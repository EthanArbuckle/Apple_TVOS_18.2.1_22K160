@interface SCATModernMenuActionsSheet
- (BOOL)_addTapReplacementGestureIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (BOOL)_itemBelongsOnShortFirstPage:(id)a3 shouldAddControlCenterActions:(BOOL)a4 shouldIncludeSpotlight:(BOOL)a5;
- (id)_bestScrollMenuItemsForScrollableElement:(id)a3;
- (id)_escapableElements;
- (id)_menuItemForScrollAction:(int)a3;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)storedNumberOfItemsInFirstPage;
- (void)_addAdditionalShortcutsIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)_addScrollShortcutIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)_addTapIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)setStoredNumberOfItemsInFirstPage:(unint64_t)a3;
@end

@implementation SCATModernMenuActionsSheet

- (unint64_t)numberOfItemsInFirstPage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));

  if (!v3) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuActionsSheet.m",  34LL,  "-[SCATModernMenuActionsSheet numberOfItemsInFirstPage]",  @"Should not have asked us how many items we needed in our first page, until we had created our menu items.  If this changes, we'll need to rework some stuff.");
  }
  return -[SCATModernMenuActionsSheet storedNumberOfItemsInFirstPage](self, "storedNumberOfItemsInFirstPage");
}

- (id)_menuItemForScrollAction:(int)a3
{
  return +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  *(void *)&a3,  self);
}

- (id)_bestScrollMenuItemsForScrollableElement:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayWithAXAttribute:2089]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "intValue", (void)v19);
        if ([v4 scatSupportsAction:v13])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuActionsSheet _menuItemForScrollAction:]( self,  "_menuItemForScrollAction:",  v13));
          -[NSMutableArray addObject:](v5, "addObject:", v14);
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  if (!-[NSMutableArray count](v5, "count"))
  {
    uint64_t v15 = 2006LL;
    uint64_t v15 = 2008LL;
    uint64_t v15 = 2009LL;
    unint64_t v16 = (unint64_t)[v4 scatTraits];
    if ((kAXCausesPageTurnTrait & v16) != 0)
    {
      uint64_t v15 = 2019LL;
LABEL_16:
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuActionsSheet _menuItemForScrollAction:]( self,  "_menuItemForScrollAction:",  v15,  (void)v19));
      -[NSMutableArray addObject:](v5, "addObject:", v17);
    }
  }

  return v5;
}

- (void)_addTapIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!v21) {
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 pointPicker]);
  if (v8)
  {
    id v9 = (void *)v8;
    if (![v21 scatIsAXElement])
    {

      goto LABEL_11;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v21 uiElement]);
    unsigned __int8 v11 = [v10 BOOLWithAXAttribute:2150];

    if ((v11 & 1) == 0)
    {
LABEL_11:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 screenPoint]);

      if (v18)
      {
        uint64_t v19 = AXSSwitchControlMenuItemGesturesTap;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v19,  v15,  self));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
        [v6 addObject:v20];

        goto LABEL_13;
      }

      goto LABEL_14;
    }
  }

  else
  {
  }

  unint64_t v12 = (unint64_t)[v21 scatTraits];
  if ((kAXAdjustableTrait & v12) == 0
    || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v21 uiElement]),
        unsigned int v14 = [v13 BOOLWithAXAttribute:2019],
        v13,
        v14))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuActionsFactory menuItemForTapWithMenu:delegate:]( &OBJC_CLASS___SCATModernMenuActionsFactory,  "menuItemForTapWithMenu:delegate:",  v15,  self));
    [v6 addObject:v16];
LABEL_13:
  }

- (void)_addScrollShortcutIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 scrollableElement]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuActionsSheet _bestScrollMenuItemsForScrollableElement:]( self,  "_bestScrollMenuItemsForScrollableElement:",  v7));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (BOOL)_addTapReplacementGestureIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 scatIsAXElement])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayWithAXAttribute:12016]);

    id v10 = [v9 count];
    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      id v22 = v6;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v21 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v17,  v18,  self));
            [v7 axSafelyAddObjectsFromArray:v19];
          }

          id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v14);
      }

      id v6 = v22;
      id v9 = v21;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_addAdditionalShortcutsIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 scatIsAXElement])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayWithAXAttribute:12015]);

    if (v9)
    {
      v18 = v9;
      id v19 = v6;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu", v18, v19, (void)v20));
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v15,  v16,  self));
            [v7 axSafelyAddObjectsFromArray:v17];

            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v12);
      }

      id v9 = v18;
      id v6 = v19;
    }
  }
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v53 = v6;
  if ([v6 switchControlTapBehavior] == (id)1)
  {
    BOOL v7 = 1;
  }

  else if ([v6 switchControlTapBehavior] == (id)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    if ([v8 isUsingPointMode])
    {
      BOOL v7 = 0;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      BOOL v7 = [v10 itemMenuStateForMenu:v11] != (id)2;

      id v6 = v53;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v13 = [v12 isExternalDisplayConnected];

  if ([v6 switchControlTapBehavior] == (id)2)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 delegate]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    if ([v15 itemMenuStateForMenu:v16])
    {
      BOOL v17 = 0;
    }

    else
    {
      unint64_t v18 = (unint64_t)[v5 scatTraits];
      BOOL v17 = (kAXAdjustableTrait & ~v18) == 0;
    }

    id v6 = v53;
    if (!v7) {
      goto LABEL_17;
    }
  }

  else
  {
    BOOL v17 = 0;
    if (!v7) {
      goto LABEL_17;
    }
  }

  if (!v17) {
    goto LABEL_19;
  }
LABEL_17:
  if (![v6 switchControlShouldUseShortFirstPage]
    || [v6 assistiveTouchScanningMode] == (id)2)
  {
LABEL_19:
    id v19 = v3;
    int v20 = 0;
    int v21 = 0;
    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v50 = -[SCATModernMenuActionsSheet _addTapReplacementGestureIfApplicableForElement:toMenuItems:]( self,  "_addTapReplacementGestureIfApplicableForElement:toMenuItems:",  v5,  v19);
  int v20 = 1;
  int v21 = 1;
  if ((v50 & 1) == 0)
  {
LABEL_20:
    -[SCATModernMenuActionsSheet _addTapIfApplicableForElement:toMenuItems:]( self,  "_addTapIfApplicableForElement:toMenuItems:",  v5,  v19);
    int v21 = v20;
  }

- (BOOL)_itemBelongsOnShortFirstPage:(id)a3 shouldAddControlCenterActions:(BOOL)a4 shouldIncludeSpotlight:(BOOL)a5
{
  id v8 = a3;
  if (qword_100157710 != -1) {
    dispatch_once(&qword_100157710, &stru_100124138);
  }
  if ([v8 isEqualToString:AXSSwitchControlMenuItemEdit])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 element]);
    if ([v10 scatIsKeyboardKey])
    {
      a4 = 1;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 element]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyboardContainer]);
      a4 = v13 != 0LL;
    }
  }

  else if ([v8 isEqualToString:AXSSwitchControlMenuItemHome])
  {
    a4 = 0;
  }

  else if (([v8 isEqualToString:AXSSwitchControlMenuItemEscape] & 1) == 0)
  {
    if ([v8 isEqualToString:AXSSwitchControlMenuItemIncrementDecrement])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 element]);
      unint64_t v16 = (unint64_t)[v15 scatTraits];
      a4 = (kAXAdjustableTrait & ~v16) == 0;
    }

    else
    {
      a4 = a5;
    }
  }

  return a4;
}

- (int64_t)preferredTipObject
{
  return 2LL;
}

- (id)_escapableElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elementsForMatchingBlock:&stru_100124158]);

  return v3;
}

- (unint64_t)storedNumberOfItemsInFirstPage
{
  return self->_storedNumberOfItemsInFirstPage;
}

- (void)setStoredNumberOfItemsInFirstPage:(unint64_t)a3
{
  self->_storedNumberOfItemsInFirstPage = a3;
}

@end