@interface SCATModernMenuScrollSheet
+ (BOOL)isValidForElement:(id)a3;
- (AXElement)scrollableElement;
- (BOOL)_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:(BOOL)a3;
- (SCATModernMenuScrollSheet)initWithMenu:(id)a3;
- (id)_fallbackAncestorForScrollToTop;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)_updateScrollableElement;
- (void)reload;
- (void)setScrollableElement:(id)a3;
@end

@implementation SCATModernMenuScrollSheet

+ (BOOL)isValidForElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 scatTraits];
  if ((kAXCausesPageTurnTrait & v4) != 0) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v3 scatCanScrollInAtLeastOneDirection];
  }

  return v5;
}

- (void)setScrollableElement:(id)a3
{
  unsigned __int8 v5 = (AXElement *)a3;
  if (self->_scrollableElement != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_scrollableElement, a3);
    -[SCATModernMenuSheet invalidateMenuItems](self, "invalidateMenuItems");
    unsigned __int8 v5 = v6;
  }
}

- (void)_updateScrollableElement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  unsigned __int8 v6 = [v4 shouldShowAppWideScrollActionsInMenu:v5];

  if ((v6 & 1) == 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 element]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scrollableElement]);
    -[SCATModernMenuScrollSheet setScrollableElement:](self, "setScrollableElement:", v8);
  }

- (SCATModernMenuScrollSheet)initWithMenu:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuScrollSheet;
  id v3 = -[SCATModernMenuSheet initWithMenu:](&v6, "initWithMenu:", a3);
  unint64_t v4 = v3;
  if (v3) {
    -[SCATModernMenuScrollSheet _updateScrollableElement](v3, "_updateScrollableElement");
  }
  return v4;
}

- (id)makeMenuItemsIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));

  if (!v4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scrollViewsForAction:2007]);
    if ([v18 count])
    {
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 scrollViewsForAction:2006]);
      id v23 = [v22 count];

      if (!v23) {
        goto LABEL_21;
      }
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2006LL,  self));
    [v3 addObject:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2007LL,  self));
    [v3 addObject:v25];

LABEL_21:
    v26 = (void *)objc_claimAutoreleasedReturnValue([v17 scrollViewsForAction:2008]);
    if ([v26 count])
    {
    }

    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v17 scrollViewsForAction:2009]);
      id v28 = [v27 count];

      if (!v28)
      {
LABEL_39:

        return v3;
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    unsigned int v30 = [v29 applicationIsRTL];

    if (v30) {
      uint64_t v31 = 2009LL;
    }
    else {
      uint64_t v31 = 2008LL;
    }
    if (v30) {
      uint64_t v32 = 2008LL;
    }
    else {
      uint64_t v32 = 2009LL;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  v31,  self));
    [v3 addObject:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  v32,  self));
    [v3 addObject:v34];

    goto LABEL_39;
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  if ([v5 scatSupportsAction:2006])
  {
LABEL_5:

LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2006LL,  self));
    [v3 addObject:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2007LL,  self));
    [v3 addObject:v8];

    int v9 = 1;
    goto LABEL_7;
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  if ([v6 scatSupportsAction:2007])
  {

    goto LABEL_5;
  }

  unsigned __int8 v21 = -[SCATModernMenuScrollSheet _shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:]( self,  "_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:",  1LL);

  if ((v21 & 1) != 0) {
    goto LABEL_6;
  }
  int v9 = 0;
LABEL_7:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  unsigned __int8 v11 = [v10 applicationIsRTL];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  unint64_t v13 = (unint64_t)[v12 scatTraits];
  unint64_t v14 = kAXCausesPageTurnTrait & v13;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2020LL,  self));
    uint64_t v16 = 2019LL;
LABEL_32:
    [v3 addObject:v15];

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  v16,  self));
    [v3 addObject:v35];

    goto LABEL_33;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  if ([v20 scatSupportsAction:2008])
  {

LABEL_14:
    goto LABEL_15;
  }

  unsigned __int8 v41 = -[SCATModernMenuScrollSheet _shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:]( self,  "_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:",  0LL);

  if ((v41 & 1) != 0)
  {
LABEL_15:
    if ((v11 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2009LL,  self));
      uint64_t v16 = 2008LL;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2008LL,  self));
      uint64_t v16 = 2009LL;
    }

    goto LABEL_32;
  }

- (id)_fallbackAncestorForScrollToTop
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fallbackScrollUpAncestor]);
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 fallbackScrollDownAncestor]);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v6));
  return v8;
}

- (int64_t)preferredTipObject
{
  return 2LL;
}

- (void)reload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATModernMenuScrollSheet;
  -[SCATModernMenuSheet reload](&v3, "reload");
}

- (BOOL)_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  id v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 fallbackScrollUpAncestor]);
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fallbackScrollDownAncestor]);
LABEL_7:
      BOOL v10 = v9 != 0LL;

      goto LABEL_8;
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 fallbackScrollLeftAncestor]);
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fallbackScrollRightAncestor]);
      goto LABEL_7;
    }
  }

  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (AXElement)scrollableElement
{
  return self->_scrollableElement;
}

- (void).cxx_destruct
{
}

@end