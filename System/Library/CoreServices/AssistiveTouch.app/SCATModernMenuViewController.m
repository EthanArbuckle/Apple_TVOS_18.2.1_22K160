@interface SCATModernMenuViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_menuFrameIsValid:(CGRect)a3;
- (BOOL)isElementTopLevelInMenu:(id)a3;
- (BOOL)isVisible;
- (BOOL)showsFooter;
- (CGPoint)_positionForMenuDockPosition:(int64_t)a3 size:(CGSize)a4;
- (CGPoint)_positionForMenuPopoverPosition:(int64_t)a3 size:(CGSize)a4;
- (CGRect)_rectToClearIfNeededForSheet:(id)a3;
- (CGRect)frame;
- (NSMutableArray)sheetViewControllerStack;
- (SCATMenu)menu;
- (SCATModernMenuViewController)initWithMenu:(id)a3;
- (SCATPointPicker)pointPicker;
- (id)contentViewContainer;
- (id)currentSheet;
- (id)currentSheetViewController;
- (id)elementProviderForSheet:(id)a3;
- (id)exitActionElement;
- (id)extraProviderElements;
- (id)showMoreItemsPageControl;
- (int64_t)tipObject;
- (void)_determineMenuOrigin:(CGPoint *)a3 anchorPosition:(double *)a4 anchorDirection:(BOOL *)a5 shouldUseTip:(BOOL *)a6 sheet:(id)a7;
- (void)_handleShowMoreItems:(id)a3;
- (void)_updateContentSizeForSheet:(id)a3;
- (void)_updateMenuLayoutForSheet:(id)a3 sheetViewController:(id)a4 animated:(BOOL)a5;
- (void)didFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)didReloadSheet:(id)a3;
- (void)flashModernMenuItem:(id)a3;
- (void)hide;
- (void)loadView;
- (void)reloadMenuVisuals;
- (void)setMenu:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setSheetViewControllerStack:(id)a3;
- (void)setShowsFooter:(BOOL)a3 numberOfPagesRequired:(unint64_t)a4;
- (void)setTipObject:(int64_t)a3;
- (void)transitionToMenuSheet:(id)a3 fromSheet:(id)a4;
- (void)updateForGeometryChange;
- (void)updateMenuLayout;
- (void)updateMenuSheetContentSize;
- (void)updateMenuSheetForOrientationChange;
- (void)updateModernMenuItem:(id)a3;
- (void)updateViewControllerStackForSheet:(id)a3 previousSheet:(id)a4;
- (void)willBePresentedWithElement:(id)a3 pointPicker:(id)a4 sheetToShow:(id)a5;
- (void)willUnfocusFromContext:(id)a3;
@end

@implementation SCATModernMenuViewController

- (SCATModernMenuViewController)initWithMenu:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATModernMenuViewController;
  v5 = -[SCATModernMenuViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5)
  {
    -[SCATModernMenuViewController setMenu:](v5, "setMenu:", v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[SCATModernMenuViewController setSheetViewControllerStack:](v6, "setSheetViewControllerStack:", v7);

    -[SCATModernMenuViewController setOverrideUserInterfaceStyle:](v6, "setOverrideUserInterfaceStyle:", 2LL);
  }

  return v6;
}

- (void)loadView
{
  v3 = -[SCATModernMenuView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATModernMenuView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SCATModernMenuViewController setView:](self, "setView:", v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)currentSheet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSheet]);

  return v3;
}

- (void)setTipObject:(int64_t)a3
{
  if (self->_tipObject != a3)
  {
    self->_tipObject = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    [v3 menuTipObjectDidChange];
  }

- (BOOL)showsFooter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundView]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  unsigned __int8 v5 = [v4 isShowingFooterView];

  return v5;
}

- (void)setShowsFooter:(BOOL)a3 numberOfPagesRequired:(unint64_t)a4
{
  BOOL v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundView]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containerView]);
  [v9 setShowingFooterView:v5];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
  [v10 setNumberOfPages:a4];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  objc_msgSend(v10, "setCurrentPage:", objc_msgSend(v11, "currentPage"));

  [v10 setHidesForSinglePage:0];
  if (v5)
  {
    [v10 addTarget:self action:"_handleShowMoreItems:" forControlEvents:64];
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allTargets", 0));
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [v10 removeTarget:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) action:0 forControlEvents:64];
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v14);
    }
  }
}

- (id)showMoreItemsPageControl
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundView]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 footerView]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 moreItemsPageControl]);

  return v6;
}

- (id)contentViewContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundView]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentViewContainer]);

  return v5;
}

- (void)willBePresentedWithElement:(id)a3 pointPicker:(id)a4 sheetToShow:(id)a5
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scatUIContextForDisplayID:", objc_msgSend(v7, "currentDisplayID")));

  [v8 addSubview:v9];
}

- (void)didFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v34 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v34 element]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
    [v7 setScatMenuItemStyle:2];
  }

  unsigned int v8 = [v34 shouldBeTrackedByZoom];
  id v9 = v34;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v34 element]);
    [v10 scatFrame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v34 element]);
    unsigned int v20 = [v19 isGroup];

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
      objc_msgSend(v21, "convertRect:toView:", 0, v12, v14, v16, v18);
      double v12 = v22;
      double v14 = v23;
      double v16 = v24;
      double v18 = v25;
    }

    if (fabs(v12) == INFINITY || fabs(v14) == INFINITY)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
      [v26 frame];
      double v12 = v27;
      double v14 = v28;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 window]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 screen]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 displayIdentity]);
    objc_msgSend( v29,  "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:",  3,  0,  objc_msgSend(v33, "displayID"),  v12,  v14,  v16,  v18);

    id v9 = v34;
  }
}

- (void)willUnfocusFromContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 element]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));

  if (v4 == v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
    [v6 setScatMenuItemStyle:0];
  }

- (id)exitActionElement
{
  int64_t v3 = -[SCATModernMenuViewController tipObject](self, "tipObject");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  BOOL v5 = v4;
  if (v3 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 exitActionElementForFingersInMenu:v7]);

LABEL_6:
    return v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);

  if (!v9)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 backgroundView]);
    goto LABEL_6;
  }

  unsigned int v8 = 0LL;
  return v8;
}

- (id)extraProviderElements
{
  if (!-[SCATModernMenuViewController showsFooter](self, "showsFooter")) {
    return 0LL;
  }
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));

  if (!v3) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
  v7 = v4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (id)elementProviderForSheet:(id)a3
{
  return [a3 elementProvider];
}

- (void)updateForGeometryChange
{
}

- (void)hide
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController view](self, "view"));
  [v2 removeFromSuperview];
}

- (CGRect)frame
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController view](self, "view"));
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateMenuLayout
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheet](self, "currentSheet"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  -[SCATModernMenuViewController _updateMenuLayoutForSheet:sheetViewController:animated:]( self,  "_updateMenuLayoutForSheet:sheetViewController:animated:",  v4,  v3,  1LL);
}

- (void)updateMenuSheetForOrientationChange
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundView]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerView]);
  [v3 orientationDidChange];
}

- (void)updateMenuSheetContentSize
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheet](self, "currentSheet"));
  -[SCATModernMenuViewController _updateContentSizeForSheet:](self, "_updateContentSizeForSheet:", v3);
}

- (void)_handleShowMoreItems:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheet](self, "currentSheet", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  [v5 willTransitionToSheet:v4];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionViewController]);
  [v7 showMoreItemsButtonWasActivated];

  -[SCATModernMenuViewController _updateContentSizeForSheet:](self, "_updateContentSizeForSheet:", v4);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  -[SCATModernMenuViewController _updateMenuLayoutForSheet:sheetViewController:animated:]( self,  "_updateMenuLayoutForSheet:sheetViewController:animated:",  v4,  v8,  0LL);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 menuItems]);
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      double v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) setStyle:0];
        double v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  id v15 = [v14 currentPage];
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));
  [v16 setCurrentPage:v15];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004FA84;
  v19[3] = &unk_100122168;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  AXPerformBlockOnMainThreadAfterDelay(v19, v18, 0.0);
}

- (id)currentSheetViewController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);

  return v3;
}

- (void)updateViewControllerStackForSheet:(id)a3 previousSheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
    [v9 enumerateObjectsUsingBlock:&stru_100123708];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
    [v8 removeAllObjects];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10004FD18;
  v20[3] = &unk_100123730;
  id v19 = v6;
  id v21 = v19;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 axFilterObjectsUsingBlock:v20]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
  double v14 = v13;
  if (!v12)
  {
    uint64_t v18 = -[SCATMenuSheetViewController initWithSheet:]( objc_alloc(&OBJC_CLASS___SCATMenuSheetViewController),  "initWithSheet:",  v19);
    [v14 addObject:v18];
    goto LABEL_8;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastObject]);

  if (v12 != v15)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
    id v17 = [v16 indexOfObject:v12];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
    uint64_t v18 = (SCATMenuSheetViewController *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuViewController sheetViewControllerStack]( self,  "sheetViewControllerStack"));
    objc_msgSend( v14,  "removeObjectsInRange:",  v17 + 1,  (_BYTE *)-[SCATMenuSheetViewController count](v18, "count") - (v17 + 1));
LABEL_8:
  }
}

- (BOOL)isVisible
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController view](self, "view"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  if (v3 && ([v2 alpha], v4 > 0.0)) {
    unsigned int v5 = [v2 isHidden] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)didReloadSheet:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController sheetViewControllerStack](self, "sheetViewControllerStack"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004FE78;
  v9[3] = &unk_100123730;
  id v10 = v4;
  id v8 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 axFilterObjectsUsingBlock:v9]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  [v7 reload];
}

- (void)reloadMenuVisuals
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);
  [v3 reloadData];
}

- (BOOL)isElementTopLevelInMenu:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController showMoreItemsPageControl](self, "showMoreItemsPageControl"));

  return v5 == v4;
}

- (void)updateModernMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  [v5 updateCellForMenuItem:v4];
}

- (void)flashModernMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  [v5 flashCellForMenuItem:v4];
}

- (void)transitionToMenuSheet:(id)a3 fromSheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  [v8 willTransitionToSheet:v6];

  -[SCATModernMenuViewController _updateContentSizeForSheet:](self, "_updateContentSizeForSheet:", v6);
  -[SCATModernMenuViewController updateViewControllerStackForSheet:previousSheet:]( self,  "updateViewControllerStackForSheet:previousSheet:",  v6,  v7);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  -[SCATModernMenuViewController addChildViewController:](self, "addChildViewController:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  [v10 didMoveToParentViewController:self];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController contentViewContainer](self, "contentViewContainer"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 collectionViewController]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
  [v11 setContentView:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  -[SCATModernMenuViewController setTipObject:]( self,  "setTipObject:",  [v15 tipObjectForPresentingSheet:v6]);

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController"));
  -[SCATModernMenuViewController _updateMenuLayoutForSheet:sheetViewController:animated:]( self,  "_updateMenuLayoutForSheet:sheetViewController:animated:",  v6,  v16,  0LL);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000501A8;
  v19[3] = &unk_100122168;
  v19[4] = self;
  id v20 = v6;
  id v17 = v6;
  AXPerformBlockOnMainThreadAfterDelay(v19, v18, 0.1);
}

- (void)_updateContentSizeForSheet:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheetViewController](self, "currentSheetViewController", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionViewController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  [v5 invalidateIntrinsicContentSize];
}

- (void)_updateMenuLayoutForSheet:(id)a3 sheetViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  if ([v8 presentationMode])
  {
    if ([v8 presentationMode] == (id)1)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 backgroundView]);
      [v12 setShouldRoundMenuCorners:0];

      -[SCATModernMenuViewController setShowsFooter:numberOfPagesRequired:]( self,  "setShowsFooter:numberOfPagesRequired:",  0LL,  1LL);
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 backgroundView]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 containerView]);
      [v15 setShouldUseDockContentPadding:1];

      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
      id v17 = [v16 dockPosition];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 backgroundView]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containerView]);
      [v20 setDockPosition:v17];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 backgroundView]);
      [v22 setTip:0];

      [v10 sizeToFit];
      [v10 bounds];
      double v24 = v23;
      double v25 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
      double v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scatUIContextForDisplayID:", objc_msgSend(v26, "currentDisplayID")));

      [v27 bounds];
      double v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
      -[SCATModernMenuViewController _positionForMenuDockPosition:size:]( self,  "_positionForMenuDockPosition:size:",  [v30 dockPosition],  v29,  v24);
      double v32 = v31;
      double v34 = v33;

      objc_msgSend(v10, "setFrame:", v32, v34, v29, v24);
    }
  }

  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 backgroundView]);
    [v36 setShouldRoundMenuCorners:1];

    id v37 = [v9 numberOfPagesRequired];
    -[SCATModernMenuViewController setShowsFooter:numberOfPagesRequired:]( self,  "setShowsFooter:numberOfPagesRequired:",  (unint64_t)v37 > 1,  v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 backgroundView]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 containerView]);
    [v40 setShouldUseDockContentPadding:0];

    -[SCATModernMenuViewController _determineMenuOrigin:anchorPosition:anchorDirection:shouldUseTip:sheet:]( self,  "_determineMenuOrigin:anchorPosition:anchorDirection:shouldUseTip:sheet:",  &v56,  &v55,  &v54,  &v53,  v8);
    if (v53)
    {
      int v41 = v54;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v10 backgroundView]);
      v43 = v42;
      if (v41) {
        uint64_t v44 = 1LL;
      }
      else {
        uint64_t v44 = 2LL;
      }
    }

    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue([v10 backgroundView]);
      v43 = v42;
      uint64_t v44 = 0LL;
    }

    [v42 setTip:v44];

    [v10 sizeToFit];
    double v45 = v55 - *(double *)&v56;
    [v10 frame];
    double v47 = v45 / v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v10 backgroundView]);
    [v48 setNormalizedHorizontalTipCenter:v47];

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    LODWORD(v48) = [v49 isVisible];

    if ((_DWORD)v48 && a5)
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_10005066C;
      v50[3] = &unk_100121F30;
      id v51 = v10;
      __int128 v52 = v56;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v50, 0.1);
    }

    else
    {
      [v10 frame];
      [v10 setFrame:v56];
    }
  }
}

- (CGRect)_rectToClearIfNeededForSheet:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuViewController.m",  447LL,  "-[SCATModernMenuViewController _rectToClearIfNeededForSheet:]",  @"Should not have called _rectToClearIfNeededForSheet: without a sheet");
  }
  [v4 rectToClear];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (CGRectIsNull(v20) && (id)-[SCATModernMenuViewController tipObject](self, "tipObject") == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    [v10 menu:v11 rectToClearForFingersWithGestureSheet:1];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
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

- (void)_determineMenuOrigin:(CGPoint *)a3 anchorPosition:(double *)a4 anchorDirection:(BOOL *)a5 shouldUseTip:(BOOL *)a6 sheet:(id)a7
{
  id v109 = a7;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menuView](self, "menuView"));
  uint64_t v13 = (uint64_t)v109;
  if (!v109) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController currentSheet](self, "currentSheet"));
  }
  id v110 = (id)v13;
  double height = CGSizeZero.height;
  objc_msgSend(v12, "sizeThatFits:includeTip:", 1, CGSizeZero.width, height);
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v12, "sizeThatFits:includeTip:", 0, CGSizeZero.width, height);
  double v20 = v19;
  double v22 = v21;
  if (![v110 presentationMode])
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    id v39 = [v38 popoverPosition];

    if (v39)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
      -[SCATModernMenuViewController _positionForMenuPopoverPosition:size:]( self,  "_positionForMenuPopoverPosition:size:",  [(id)v23 popoverPosition],  v20,  v22);
      goto LABEL_12;
    }
  }

  if ([v110 presentationMode] == (id)1)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
    -[SCATModernMenuViewController _positionForMenuDockPosition:size:]( self,  "_positionForMenuDockPosition:size:",  [(id)v23 dockPosition],  v20,  v22);
LABEL_12:
    double v40 = v24;
    double v41 = v25;
    char v32 = 0;
    double v42 = 0.0;
    LOBYTE(v43) = 1;
    goto LABEL_78;
  }

  -[SCATModernMenuViewController _rectToClearIfNeededForSheet:](self, "_rectToClearIfNeededForSheet:", v110);
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  CGFloat v102 = v30;
  double rect1 = v31;
  int64_t v104 = -[SCATModernMenuViewController tipObject](self, "tipObject");
  char v32 = v104 != 0;
  double v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v33 element]);

  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController pointPicker](self, "pointPicker"));
  v103 = a6;
  if (v34)
  {
    v35 = (void *)v34;
    if ([(id)v23 scatIsAXElement])
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v23 uiElement]);
      unsigned __int8 v37 = [v36 BOOLWithAXAttribute:2150];

      if ((v37 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v23 = 0LL;
  }

- (BOOL)_menuFrameIsValid:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scatUIContextForDisplayID:", objc_msgSend(v9, "currentDisplayID")));

  [v10 bounds];
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  LOBYTE(v9) = CGRectContainsRect(v12, v13);

  return (char)v9;
}

- (CGPoint)_positionForMenuPopoverPosition:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scatUIContextForDisplayID:", objc_msgSend(v9, "currentDisplayID")));

  [v10 bounds];
  double x = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v10 safeAreaInsets];
  double y = v14 + v19;
  double v22 = v18 - v21;
  switch(a3)
  {
    case 1LL:
      break;
    case 2LL:
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.double width = v16;
      v26.size.double height = v22;
      double x = floor(CGRectGetMidX(v26) + width * -0.5);
      break;
    case 3LL:
      double x = v16 - width;
      break;
    case 4LL:
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = v16;
      v27.size.double height = v22;
      double y = floor(CGRectGetMidY(v27) + height * -0.5);
      double x = v16 - width;
      break;
    case 5LL:
      double x = v16 - width;
      goto LABEL_8;
    case 6LL:
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = v16;
      v28.size.double height = v22;
      double x = floor(CGRectGetMidX(v28) + width * -0.5);
      goto LABEL_8;
    case 7LL:
LABEL_8:
      double y = v22 - height;
      break;
    case 8LL:
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = v16;
      v29.size.double height = v22;
      double y = floor(CGRectGetMidY(v29) + height * -0.5);
      break;
    default:
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuViewController.m",  742LL,  "-[SCATModernMenuViewController _positionForMenuPopoverPosition:size:]",  @"It is undefined to ask for the original position of the menu since it may have changed size");
      break;
  }

  double v23 = x;
  double v24 = y;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_positionForMenuDockPosition:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  if (a4.width == CGSizeZero.width && a4.height == CGSizeZero.height)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController view](self, "view"));
    [v8 frame];
    double height = v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  CGRect v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scatUIContextForDisplayID:", objc_msgSend(v11, "currentDisplayID")));

  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController view](self, "view"));
  [v19 frame];

  if (a3 == 1) {
    double v20 = v16;
  }
  else {
    double v20 = v18 - height;
  }

  double v21 = v14;
  double v22 = v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (int64_t)tipObject
{
  return self->_tipObject;
}

- (SCATMenu)menu
{
  return (SCATMenu *)objc_loadWeakRetained((id *)&self->_menu);
}

- (void)setMenu:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  return (SCATPointPicker *)objc_loadWeakRetained((id *)&self->_pointPicker);
}

- (void)setPointPicker:(id)a3
{
}

- (NSMutableArray)sheetViewControllerStack
{
  return self->_sheetViewControllerStack;
}

- (void)setSheetViewControllerStack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end