@interface SCATModernMenuSheet
+ (BOOL)isValidForElement:(id)a3;
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)areItemsSorted;
- (BOOL)delegatesScannerControl;
- (BOOL)isBackItemIdentifier:(id)a3;
- (BOOL)shouldAllowDwellSelection;
- (BOOL)shouldIncludeBackItem;
- (BOOL)shouldIncludeTextLabels;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (BOOL)shouldUseBackItemAsDoneItem;
- (CGRect)rectToClear;
- (Class)_menuItemClass;
- (NSArray)menuItems;
- (NSArray)menuItemsIfCreated;
- (NSString)description;
- (NSString)springBoardActionHandlerIdentifier;
- (SCATMenu)menu;
- (SCATModernMenuSheet)init;
- (SCATModernMenuSheet)initWithMenu:(id)a3;
- (SCATModernMenuSheetElementProviderDelegate)elementProviderDelegate;
- (SCATStaticElementProvider)elementProvider;
- (id)_filteredMenuItems:(id)a3;
- (id)alternateTipElement;
- (id)backTitle;
- (id)itemWithIdentifier:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (int64_t)preferredTipObject;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)presentationMode;
- (void)_insertObjectsOnSameRow:(id)a3 intoArray:(id)a4 itemsPerRow:(unint64_t)a5;
- (void)dealloc;
- (void)didFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)invalidateMenuItems;
- (void)menuItemWasActivated:(id)a3;
- (void)reload;
- (void)setAreItemsSorted:(BOOL)a3;
- (void)setElementProviderDelegate:(id)a3;
- (void)setMenu:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setShouldIncludeBackItem:(BOOL)a3;
- (void)setSpringBoardActionHandlerIdentifier:(id)a3;
- (void)sortMenuItemsForNumberOfItemsPerRow:(unint64_t)a3;
@end

@implementation SCATModernMenuSheet

+ (BOOL)isValidForElement:(id)a3
{
  return 1;
}

- (SCATModernMenuSheet)init
{
  return 0LL;
}

- (SCATModernMenuSheet)initWithMenu:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheet;
  v5 = -[SCATModernMenuSheet init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[SCATModernMenuSheet setMenu:](v5, "setMenu:", v4);
  }

  return v6;
}

- (NSString)description
{
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 count]));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p> items:%@",  v5,  self,  v7));

  return (NSString *)v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheet;
  -[SCATModernMenuSheet dealloc](&v2, "dealloc");
}

- (SCATStaticElementProvider)elementProvider
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet elementProviderDelegate](self, "elementProviderDelegate"));
  Class v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elementProvider]);

  return (SCATStaticElementProvider *)v3;
}

- (Class)_menuItemClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SCATModernMenuItem, a2);
}

- (NSArray)menuItems
{
  menuItems = self->_menuItems;
  if (!menuItems)
  {
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (-[SCATModernMenuSheet shouldIncludeBackItem](self, "shouldIncludeBackItem"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet backTitle](self, "backTitle"));
      unsigned int v6 = -[SCATModernMenuSheet shouldUseBackItemAsDoneItem](self, "shouldUseBackItemAsDoneItem");
      if (v6) {
        v7 = @"SCATIcon_general_exit";
      }
      else {
        v7 = @"SCATIcon_general_back";
      }
      uint64_t v8 = v6 ^ 1;
      LOBYTE(v24) = 1;
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:]( -[SCATModernMenuSheet _menuItemClass](self, "_menuItemClass"),  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:",  @"private_back",  self,  v5,  v7,  2LL,  1LL,  v24));
      [v9 setShouldFlipForRTL:v8];
      -[NSArray addObject:](v4, "addObject:", v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet makeMenuItemsIfNeeded](self, "makeMenuItemsIfNeeded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet _filteredMenuItems:](self, "_filteredMenuItems:", v10));

    -[SCATModernMenuSheet _listenForMuteSwitchChangeIfNecessaryForItems:]( self,  "_listenForMuteSwitchChangeIfNecessaryForItems:",  v11);
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v11);
    if (!-[NSArray count](v4, "count"))
    {
      v12 = -[SCATModernMenuSheet _menuItemClass](self, "_menuItemClass");
      id v13 = sub_10002B014(@"NO_ITEMS");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class itemWithIdentifier:delegate:title:imageName:activateBehavior:]( v12,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"private_empty",  self,  v14,  0LL,  2LL));

      +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
      double v17 = round(v16 * 44.0 / 60.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"exclamationmark.circle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", v17));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 imageWithConfiguration:v20]);
      [v15 setImage:v21];

      [v15 setDisabled:1];
      -[NSArray addObject:](v4, "addObject:", v15);
    }

    v22 = self->_menuItems;
    self->_menuItems = v4;

    menuItems = self->_menuItems;
  }

  return menuItems;
}

- (NSArray)menuItemsIfCreated
{
  return self->_menuItems;
}

- (void)sortMenuItemsForNumberOfItemsPerRow:(unint64_t)a3
{
  if (!-[SCATModernMenuSheet areItemsSorted](self, "areItemsSorted"))
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
    id v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0LL;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v8]);

        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 menuItemGroupName]);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
          unint64_t v13 = v8 + 1;
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 axSafeObjectAtIndex:v8 + 1]);

          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 menuItemGroupName]);
          double v16 = (void *)objc_claimAutoreleasedReturnValue([v14 menuItemGroupName]);
          unsigned int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v10,  v14));
            -[SCATModernMenuSheet _insertObjectsOnSameRow:intoArray:itemsPerRow:]( self,  "_insertObjectsOnSameRow:intoArray:itemsPerRow:",  v18,  v5,  a3);

            unint64_t v8 = v13;
          }

          else
          {
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }
        }

        else
        {
          -[NSMutableArray addObject:](v5, "addObject:", v10);
        }

        ++v8;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
        id v20 = [v19 count];
      }

      while (v8 < (unint64_t)v20);
    }

    menuItems = self->_menuItems;
    self->_menuItems = &v5->super;
  }

- (void)_insertObjectsOnSameRow:(id)a3 intoArray:(id)a4 itemsPerRow:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 count];
  unint64_t v11 = -[SCATModernMenuSheet numberOfItemsInFirstPage](self, "numberOfItemsInFirstPage");
  unint64_t v12 = (unint64_t)v10;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  BOOL v13 = v12 % a5 == a5 - 1;
  *((void *)&v20 + 1) = 0LL;
  __int128 v21 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator", 0));
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    unsigned int v17 = &v10[-v13];
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v14);
        }
        [v9 insertObject:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) atIndex:v17];
        v19 = (char *)v19 + 1;
      }

      while (v16 != v19);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v16);
  }
}

- (id)itemWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)invalidateMenuItems
{
}

- (unint64_t)numberOfItemsInFirstPage
{
  return 0LL;
}

- (BOOL)isBackItemIdentifier:(id)a3
{
  return [a3 isEqualToString:@"private_back"];
}

- (void)reload
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  Class v3 = (void *)objc_claimAutoreleasedReturnValue([v4 menuVisualProvider]);
  [v3 didReloadSheet:self];
}

- (id)_filteredMenuItems:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (AXAssistiveAccessEnabled())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100124A30));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filteredArrayUsingPredicate:v5]);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  unsigned int v7 = [v6 isGuidedAccessActive];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100124A50));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v8]);

    id v4 = (void *)v9;
  }

  return v4;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 isEqualToString:@"private_back"];

  if (v6)
  {
    unsigned int v8 = -[SCATModernMenuSheet shouldUseBackItemAsDoneItem](self, "shouldUseBackItemAsDoneItem");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    v10 = v9;
    if (v8)
    {
      [v9 hideWithCompletion:0];
LABEL_10:

      goto LABEL_11;
    }

    int v13 = [v9 popSheet];

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = SWCHLogCommon(v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_1000AFD18((uint64_t)self, (uint64_t)v4, (os_log_t)v10);
      }
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v11 = SWCHLogCommon(v7);
    unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Nobody handled this menu item activated: %@",  (uint8_t *)&v16,  0xCu);
    }
  }

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  return 0;
}

- (SCATModernMenuSheetElementProviderDelegate)elementProviderDelegate
{
  return (SCATModernMenuSheetElementProviderDelegate *)objc_loadWeakRetained((id *)&self->_elementProviderDelegate);
}

- (void)setElementProviderDelegate:(id)a3
{
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (BOOL)shouldIncludeBackItem
{
  return self->_shouldIncludeBackItem;
}

- (void)setShouldIncludeBackItem:(BOOL)a3
{
  self->_shouldIncludeBackItem = a3;
}

- (void)setMenuItems:(id)a3
{
}

- (BOOL)areItemsSorted
{
  return self->_areItemsSorted;
}

- (void)setAreItemsSorted:(BOOL)a3
{
  self->_areItemsSorted = a3;
}

- (NSString)springBoardActionHandlerIdentifier
{
  return self->_springBoardActionHandlerIdentifier;
}

- (void)setSpringBoardActionHandlerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)didFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v8 = [v7 switchControlScanningStyle];

  objc_opt_class(&OBJC_CLASS___SCATMenuItemElement, v9);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 menuItem]);
    BOOL v12 = 0;
  }

  else
  {
    uint64_t v11 = 0LL;
    BOOL v12 = [v5 selectBehavior] == 4;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 parentGroup]);
  v55 = v6;
  id v56 = v5;
  if (!v13) {
    goto LABEL_27;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 exitActionElement]);
  if (v6 == (void *)v16)
  {

LABEL_27:
    else {
      id v23 = 0LL;
    }
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
    id v38 = [v37 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (!v38) {
      goto LABEL_53;
    }
    id v39 = v38;
    uint64_t v40 = *(void *)v64;
    BOOL v41 = v8 == (id)2 && v12;
    BOOL v58 = v41;
LABEL_35:
    uint64_t v42 = 0LL;
    while (1)
    {
      if (*(void *)v64 != v40) {
        objc_enumerationMutation(v37);
      }
      v43 = *(void **)(*((void *)&v63 + 1) + 8 * v42);
      if (![v43 isDisabled])
      {
        if (v43 == v11)
        {
          v44 = v11;
          uint64_t v45 = 2LL;
          goto LABEL_51;
        }

        if (v11)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v11 scatElement]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 parentGroup]);
          if (v47)
          {
          }

          else
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v43 scatElement]);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v48 parentGroup]);

            if (!v49) {
              goto LABEL_49;
            }
          }
        }

        if (v23)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue([v43 scatElement]);
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 parentGroup]);
          unsigned int v52 = [v51 isEqual:v23];

          if (v52)
          {
            if (!v58)
            {
              v44 = v43;
              uint64_t v45 = 0LL;
              goto LABEL_51;
            }

- (BOOL)allowsBackAction
{
  return 1;
}

- (BOOL)allowsExitAction
{
  return 1;
}

- (CGRect)rectToClear
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)makeMenuItemsIfNeeded
{
  return 0LL;
}

- (BOOL)shouldKeepScannerAwake
{
  return 0;
}

- (BOOL)shouldAllowDwellSelection
{
  return 1;
}

- (unint64_t)presentationMode
{
  return 0LL;
}

- (BOOL)delegatesScannerControl
{
  return 0;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 0;
}

- (id)backTitle
{
  if (-[SCATModernMenuSheet shouldUseBackItemAsDoneItem](self, "shouldUseBackItemAsDoneItem")) {
    objc_super v2 = @"EXIT";
  }
  else {
    objc_super v2 = @"BACK";
  }
  id v3 = sub_10002B014(v2);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (BOOL)shouldIncludeTextLabels
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchScannerMenuLabelsEnabled];

  return v3;
}

- (int64_t)preferredTipObject
{
  return 0LL;
}

- (id)alternateTipElement
{
  return 0LL;
}

- (id)menuItemStruts
{
  return 0LL;
}

@end