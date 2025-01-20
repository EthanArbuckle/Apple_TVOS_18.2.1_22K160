@interface SCATModernMenuGestureFreehandSheetBase
- (BOOL)delegatesScannerControl;
- (BOOL)isLandscape;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (Class)_menuItemClass;
- (SCATModernMenuGestureFreehandSheetDelegate)delegate;
- (id)_imageNameForPrefix:(id)a3;
- (id)_titleForLocalizableString:(id)a3 state:(BOOL)a4;
- (id)autoPressLiftItems;
- (id)bendMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)elementProvider;
- (id)moveMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)moveToolbarMenuItem;
- (id)pathMenuItems;
- (id)rotateMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)touchToggleMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (unint64_t)presentationMode;
- (void)didChangeOrientation;
- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuItemWasActivated:(id)a3;
- (void)pushFreehandSheetOfClass:(Class)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuItems:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandSheetBase

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 0;
}

- (id)pathMenuItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  1LL));
  [v3 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase rotateMenuItemWithPreferredNumberOfLines:]( self,  "rotateMenuItemWithPreferredNumberOfLines:",  1LL));
  [v3 addObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase bendMenuItemWithPreferredNumberOfLines:]( self,  "bendMenuItemWithPreferredNumberOfLines:",  1LL));
  [v3 addObject:v6];

  return v3;
}

- (id)moveMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_MOVE_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_MOVE_ONE_LINE";
  }
  id v6 = sub_10002B014(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_move",  self,  v7,  @"move",  1LL,  2LL));
  [v8 setPreferredNumberOfTitleLines:a3];

  return v8;
}

- (id)rotateMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_ROTATE_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_ROTATE_ONE_LINE";
  }
  id v6 = sub_10002B014(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_rotate",  self,  v7,  @"rotate",  1LL,  2LL));
  [v8 setPreferredNumberOfTitleLines:a3];

  return v8;
}

- (id)bendMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_BEND_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_BEND_ONE_LINE";
  }
  id v6 = sub_10002B014(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_bend",  self,  v7,  @"bend",  1LL,  2LL));
  [v8 setPreferredNumberOfTitleLines:a3];

  return v8;
}

- (id)touchToggleMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_touch_toggle",  self,  0LL,  3LL));
  [v4 setPreferredNumberOfTitleLines:a3];
  return v4;
}

- (id)moveToolbarMenuItem
{
  id v3 = sub_10002B014(@"FREEHAND_MOVE_MENU");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_move_menu",  self,  v4,  3LL));

  return v5;
}

- (id)autoPressLiftItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_auto_press_toggle",  self,  0LL,  3LL));
  [v3 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_auto_lift_toggle",  self,  0LL,  3LL));
  [v3 addObject:v5];

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "updateItem", (void)v12);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v6;
}

- (void)pushFreehandSheetOfClass:(Class)a3
{
  id v4 = objc_alloc(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  id v8 = [v4 initWithMenu:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
  [v8 setDelegate:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  [v7 pushSheet:v8];
}

- (BOOL)isLandscape
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v3 = [v2 isLandscape];

  return v3;
}

- (id)_imageNameForPrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
  LODWORD(self) = [v5 isTouchOnForFreehandSheet:self];

  if ((_DWORD)self) {
    id v6 = @"SCATIcon_freehand_%@TouchOn";
  }
  else {
    id v6 = @"SCATIcon_freehand_%@TouchOff";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));

  return v7;
}

- (id)_titleForLocalizableString:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = sub_10002B014(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4) {
    id v7 = @"FREEHAND_ON";
  }
  else {
    id v7 = @"FREEHAND_OFF";
  }
  id v8 = sub_10002B014(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v9));

  return v10;
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_touch_toggle"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    id v7 = [v6 isTouchOnForFreehandSheet:self];

    if ([v4 preferredNumberOfTitleLines] == (id)2) {
      id v8 = @"FREEHAND_TOUCH_STATE_TWO_LINES";
    }
    else {
      id v8 = @"FREEHAND_TOUCH_STATE_ONE_LINE";
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase _titleForLocalizableString:state:]( self,  "_titleForLocalizableString:state:",  v8,  v7));
    [v4 setTitle:v9];

    v10 = @"SCATIcon_freehand_touchOff";
    v11 = @"SCATIcon_freehand_touchOn";
    goto LABEL_10;
  }

  if ([v5 isEqualToString:@"freehand_auto_press_toggle"])
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    id v7 = [v12 isAutoPressOnForFreehandSheet:self];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase _titleForLocalizableString:state:]( self,  "_titleForLocalizableString:state:",  @"FREEHAND_AUTO_PRESS_STATE",  v7));
    [v4 setTitle:v13];

    v10 = @"SCATIcon_freehand_autoPressOff";
    v11 = @"SCATIcon_freehand_autoPressOn";
LABEL_10:
    if ((_DWORD)v7) {
      v16 = v11;
    }
    else {
      v16 = v10;
    }
    [v4 setImageName:v16];
LABEL_14:
    BOOL v17 = 1;
    goto LABEL_15;
  }

  if ([v5 isEqualToString:@"freehand_auto_lift_toggle"])
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    id v7 = [v14 isAutoLiftOnForFreehandSheet:self];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase _titleForLocalizableString:state:]( self,  "_titleForLocalizableString:state:",  @"FREEHAND_AUTO_LIFT_STATE",  v7));
    [v4 setTitle:v15];

    v10 = @"SCATIcon_freehand_autoLiftOff";
    v11 = @"SCATIcon_freehand_autoLiftOn";
    goto LABEL_10;
  }

  if ([v5 isEqualToString:@"freehand_move_menu"])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    if ([v19 dockPosition] == (id)1) {
      v20 = @"SCATIcon_freehand_menuBottom";
    }
    else {
      v20 = @"SCATIcon_freehand_menuTop";
    }
    [v4 setImageName:v20];

    goto LABEL_14;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 imagePrefixForTouchDependentGlyph]);
  BOOL v17 = v21 != 0LL;
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase _imageNameForPrefix:](self, "_imageNameForPrefix:", v21));
    [v4 setImageName:v22];
  }

  if ([v4 shouldRotate])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v23 angleForFreehandSheet:self];
    double v25 = v24;

    [v4 setIconImageAngle:v25 + 1.57079633];
    BOOL v17 = 1;
  }

LABEL_15:
  return v17;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (unint64_t)presentationMode
{
  return 1LL;
}

- (BOOL)delegatesScannerControl
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_move"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 moveForFreehandSheet:self];
LABEL_24:

    goto LABEL_25;
  }

  if ([v5 isEqualToString:@"freehand_rotate"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 rotateForFreehandSheet:self];
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"freehand_bend"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 bendForFreehandSheet:self];
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"freehand_touch_toggle"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 toggleTouchForFreehandSheet:self];

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
    id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (v12 != v4) {
            [v12 updateItem];
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"freehand_auto_press_toggle"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 autoPressToggledForFreehandSheet:self];
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"freehand_auto_lift_toggle"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 autoLiftToggledForFreehandSheet:self];
    goto LABEL_24;
  }

  if ([v5 isEqualToString:@"freehand_move_menu"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 moveToolbarForFreehandSheet:self];
    goto LABEL_24;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandSheetBase;
  -[SCATModernMenuSheet menuItemWasActivated:](&v14, "menuItemWasActivated:", v4);
LABEL_25:
  if (-[SCATModernMenuSheet isBackItemIdentifier:](self, "isBackItemIdentifier:", v5))
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v13 didPopFreehandSheet:self];
  }
}

- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if ([v7 isEqualToString:@"freehand_move"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 freehandSheet:self didHighlightMove:v4];
LABEL_7:

    goto LABEL_8;
  }

  if ([v7 isEqualToString:@"freehand_rotate"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 freehandSheet:self didHighlightRotate:v4];
    goto LABEL_7;
  }

  if ([v7 isEqualToString:@"freehand_bend"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 freehandSheet:self didHighlightBend:v4];
    goto LABEL_7;
  }

- (void)setMenuItems:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandSheetBase;
  -[SCATModernMenuSheet setMenuItems:](&v15, "setMenuItems:", v4);
  if (v5 != v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setDelegate:", 0, (void)v11);
          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }

      while (v8);
    }
  }
}

- (id)elementProvider
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (([v9 isDisabled] & 1) == 0)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scatElement]);
          [v3 axSafelyAddObject:v10];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  __int128 v11 = -[SCATStaticElementProvider initWithElements:]( objc_alloc(&OBJC_CLASS___SCATStaticElementProvider),  "initWithElements:",  v3);
  return v11;
}

- (void)didChangeOrientation
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandSheetBase;
  -[SCATModernMenuSheet didChangeOrientation](&v5, "didChangeOrientation");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007F188;
  v4[3] = &unk_100121D18;
  v4[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v4, v3, 0.0);
}

- (Class)_menuItemClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandItem, a2);
}

- (SCATModernMenuGestureFreehandSheetDelegate)delegate
{
  return (SCATModernMenuGestureFreehandSheetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end