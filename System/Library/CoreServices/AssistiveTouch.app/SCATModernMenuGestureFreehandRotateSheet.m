@interface SCATModernMenuGestureFreehandRotateSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (SCATModernMenuGestureFreehandItem)rotate90CCWItem;
- (SCATModernMenuGestureFreehandItem)rotate90CWItem;
- (SCATModernMenuGestureFreehandItem)rotate90Item;
- (SCATModernMenuGestureFreehandItem)rotateCCWItem;
- (SCATModernMenuGestureFreehandItem)rotateCWItem;
- (id)elementProvider;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)didActivateMultipleMenuItemsElement:(id)a3;
- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuItemWasActivated:(id)a3;
- (void)multipleMenuItemsElement:(id)a3 didBecomeHighlighted:(BOOL)a4;
- (void)setRotate90CCWItem:(id)a3;
- (void)setRotate90CWItem:(id)a3;
- (void)setRotate90Item:(id)a3;
- (void)setRotateCCWItem:(id)a3;
- (void)setRotateCWItem:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandRotateSheet

- (id)makeMenuItemsIfNeeded
{
  providerElements = self->_providerElements;
  self->_providerElements = 0LL;

  int IsPad = AXDeviceIsPad(v4, v5);
  BOOL v7 = IsPad == 0;
  if (IsPad) {
    v8 = @"FREEHAND_ROTATE_CCW_TWO_LINES";
  }
  else {
    v8 = @"FREEHAND_ROTATE_CCW_ONE_LINE";
  }
  if (v7) {
    v9 = @"FREEHAND_ROTATE_CW_ONE_LINE";
  }
  else {
    v9 = @"FREEHAND_ROTATE_CW_TWO_LINES";
  }
  if (v7) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = 2LL;
  }
  id v11 = sub_10002B014(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_10002B014(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_rotate_ccw",  self,  v12,  @"rotateCCW",  1LL,  2LL));
  -[SCATModernMenuGestureFreehandRotateSheet setRotateCCWItem:](self, "setRotateCCWItem:", v15);

  id v16 = sub_10002B014(@"FREEHAND_ROTATE_CCW_SPOKEN");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
  [v18 setAccessibilityLabel:v17];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
  [v19 setPreferredNumberOfTitleLines:v10];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_rotate_cw",  self,  v14,  @"rotateCW",  1LL,  2LL));
  -[SCATModernMenuGestureFreehandRotateSheet setRotateCWItem:](self, "setRotateCWItem:", v20);

  id v21 = sub_10002B014(@"FREEHAND_ROTATE_CW_SPOKEN");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
  [v23 setAccessibilityLabel:v22];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
  [v24 setPreferredNumberOfTitleLines:v10];

  if (AXDeviceIsPad(v25, v26))
  {
    id v27 = sub_10002B014(@"FREEHAND_ROTATE_90_CCW");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = AXFormatInteger(90LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v28, v30));

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_rotate_90_ccw",  self,  v31,  @"rotateCCW90",  1LL,  3LL));
    -[SCATModernMenuGestureFreehandRotateSheet setRotate90CCWItem:](self, "setRotate90CCWItem:", v32);

    id v33 = sub_10002B014(@"FREEHAND_ROTATE_90_CCW_SPOKEN");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v35 = AXFormatInteger(90LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v34, v36));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CCWItem](self, "rotate90CCWItem"));
    [v38 setAccessibilityLabel:v37];

    id v39 = sub_10002B014(@"FREEHAND_ROTATE_90_CW");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v41 = AXFormatInteger(90LL);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40, v42));

    v44 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_rotate_90_cw",  self,  v43,  @"rotateCW90",  1LL,  3LL));
    -[SCATModernMenuGestureFreehandRotateSheet setRotate90CWItem:](self, "setRotate90CWItem:", v44);

    id v45 = sub_10002B014(@"FREEHAND_ROTATE_90_CW_SPOKEN");
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    uint64_t v47 = AXFormatInteger(90LL);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v46, v48));

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CWItem](self, "rotate90CWItem"));
    [v50 setAccessibilityLabel:v49];
  }

  else
  {
    id v51 = sub_10002B014(@"FREEHAND_ROTATE_90");
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    uint64_t v53 = AXFormatInteger(90LL);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v52, v54));

    v50 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_90Degrees",  self,  v49,  3LL));
    -[SCATModernMenuGestureFreehandRotateSheet setRotate90Item:](self, "setRotate90Item:", v50);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (AXDeviceIsPad(v55, v56))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
    [v55 addObject:v57];

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CWItem](self, "rotate90CWItem"));
    [v55 addObject:v58];

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
    [v55 addObject:v59];

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CCWItem](self, "rotate90CCWItem"));
    [v55 addObject:v60];

    v61 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  2LL));
    [v55 addObject:v61];

    v62 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  2LL));
    [v55 addObject:v62];

    uint64_t v63 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase moveToolbarMenuItem](self, "moveToolbarMenuItem"));
LABEL_17:
    v68 = (void *)v63;
    [v55 addObject:v63];

    goto LABEL_18;
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
  [v55 addObject:v64];

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
  [v55 addObject:v65];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90Item](self, "rotate90Item"));
  [v55 addObject:v66];

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  1LL));
    [v55 addObject:v67];

    uint64_t v63 = objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  1LL));
    goto LABEL_17;
  }

- (id)elementProvider
{
  if (AXDeviceIsPad(self, a2))
  {
    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandRotateSheet;
    id v3 = -[SCATModernMenuGestureFreehandSheetBase elementProvider](&v39, "elementProvider");
    uint64_t v4 = (SCATStaticElementProvider *)objc_claimAutoreleasedReturnValue(v3);
    return v4;
  }

  providerElements = self->_providerElements;
  if (!providerElements)
  {
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
    id v7 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    while (1)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90Item](self, "rotate90Item"));

        if (v11 != v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 scatElement]);
          -[NSArray axSafelyAddObject:](v6, "axSafelyAddObject:", v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
          if (v11 == v14)
          {
            id v16 = objc_alloc_init(&OBJC_CLASS___SCATMultipleMenuItemsElement);
            -[SCATMultipleMenuItemsElement setIdentifier:](v16, "setIdentifier:", @"freehand_rotate_90_ccw");
            -[SCATMultipleMenuItemsElement setDelegate:](v16, "setDelegate:", self);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
            v41[0] = v25;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90Item](self, "rotate90Item"));
            v41[1] = v26;
            id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v41,  2LL));
            -[SCATMultipleMenuItemsElement setMenuItems:](v16, "setMenuItems:", v27);

            id v28 = sub_10002B014(@"FREEHAND_ROTATE_90_CCW_SPOKEN");
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            uint64_t v30 = AXFormatInteger(90LL);
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v31));
          }

          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));

            if (v11 != v15) {
              continue;
            }
            id v16 = objc_alloc_init(&OBJC_CLASS___SCATMultipleMenuItemsElement);
            -[SCATMultipleMenuItemsElement setIdentifier:](v16, "setIdentifier:", @"freehand_rotate_90_cw");
            -[SCATMultipleMenuItemsElement setDelegate:](v16, "setDelegate:", self);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
            v40[0] = v17;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90Item](self, "rotate90Item"));
            v40[1] = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v40,  2LL));
            -[SCATMultipleMenuItemsElement setMenuItems:](v16, "setMenuItems:", v19);

            id v20 = sub_10002B014(@"FREEHAND_ROTATE_90_CW_SPOKEN");
            id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = AXFormatInteger(90LL);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v23));
          }

          -[SCATMultipleMenuItemsElement setAccessibilityLabel:](v16, "setAccessibilityLabel:", v24);
          -[NSArray addObject:](v6, "addObject:", v16);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (!v8)
      {
LABEL_17:

        v32 = self->_providerElements;
        self->_providerElements = v6;

        providerElements = self->_providerElements;
        break;
      }
    }
  }

  uint64_t v4 = -[NSArray count](providerElements, "count");
  if (v4) {
    uint64_t v4 = -[SCATStaticElementProvider initWithElements:]( objc_alloc(&OBJC_CLASS___SCATStaticElementProvider),  "initWithElements:",  self->_providerElements);
  }
  return v4;
}

- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v7 isEqualToString:@"freehand_rotate_ccw"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightRotateCCW:v4];
  }

  else if ([v7 isEqualToString:@"freehand_rotate_cw"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightRotateCW:v4];
  }

  else if ([v7 isEqualToString:@"freehand_rotate_90_ccw"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightRotateCCW90:v4];
  }

  else
  {
    if (![v7 isEqualToString:@"freehand_rotate_90_cw"])
    {
      v9.receiver = self;
      v9.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandRotateSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItem:didBecomeFocused:](&v9, "menuItem:didBecomeFocused:", v6, v4);
      goto LABEL_10;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightRotateCW90:v4];
  }

LABEL_10:
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_rotate_ccw"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 rotateCounterclockwiseForFreehandSheet:self];
LABEL_5:

    goto LABEL_12;
  }

  if ([v5 isEqualToString:@"freehand_rotate_cw"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 rotateClockwiseForFreehandSheet:self];
    goto LABEL_5;
  }

  if ([v5 isEqualToString:@"freehand_rotate_90_ccw"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 rotate90CounterclockwiseForFreehandSheet:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
    [v8 updateItem];

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
    [v9 updateItem];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CWItem](self, "rotate90CWItem"));
  }

  else
  {
    if (![v5 isEqualToString:@"freehand_rotate_90_cw"])
    {
      v15.receiver = self;
      v15.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandRotateSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItemWasActivated:](&v15, "menuItemWasActivated:", v4);
      goto LABEL_12;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v11 rotate90ClockwiseForFreehandSheet:self];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem"));
    [v12 updateItem];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
    [v13 updateItem];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotate90CCWItem](self, "rotate90CCWItem"));
  }

  v14 = v10;
  [v10 updateItem];

LABEL_12:
}

- (void)multipleMenuItemsElement:(id)a3 didBecomeHighlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if ([v6 isEqualToString:@"freehand_rotate_90_ccw"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 freehandSheet:self didHighlightRotateCCW90:v4];
  }

  else
  {
    if (![v6 isEqualToString:@"freehand_rotate_90_cw"])
    {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuGestureFreehandRotateSheet.m",  254LL,  "-[SCATModernMenuGestureFreehandRotateSheet multipleMenuItemsElement:didBecomeHighlighted:]",  @"Unexpected identifier for multiple menu items element in rotation sheet: %@");
      goto LABEL_7;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 freehandSheet:self didHighlightRotateCW90:v4];
  }

LABEL_7:
}

- (void)didActivateMultipleMenuItemsElement:(id)a3
{
  id v9 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if ([v4 isEqualToString:@"freehand_rotate_90_ccw"])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v5 rotate90CounterclockwiseForFreehandSheet:self];
  }

  else
  {
    if (![v4 isEqualToString:@"freehand_rotate_90_cw"])
    {
      id v8 = v9;
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuGestureFreehandRotateSheet.m",  271LL,  "-[SCATModernMenuGestureFreehandRotateSheet didActivateMultipleMenuItemsElement:]",  @"Unexpected identifier for multiple menu items element in rotation sheet: %@");
      goto LABEL_7;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v5 rotate90ClockwiseForFreehandSheet:self];
  }

LABEL_7:
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCCWItem](self, "rotateCCWItem", v8));
  [v6 updateItem];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandRotateSheet rotateCWItem](self, "rotateCWItem"));
  [v7 updateItem];
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandRotateSheet;
  return -[SCATModernMenuGestureFreehandSheetBase shouldUpdateMenuItem:](&v4, "shouldUpdateMenuItem:", a3);
}

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 1;
}

- (id)menuItemStruts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 scale];
  double v5 = v4;

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    id v6 = &off_10012F580;
    id v7 = &off_10012F568;
  }

  else
  {
    id v6 = &off_10012F5B0;
    id v7 = &off_10012F598;
  }

  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

- (SCATModernMenuGestureFreehandItem)rotateCCWItem
{
  return self->_rotateCCWItem;
}

- (void)setRotateCCWItem:(id)a3
{
}

- (SCATModernMenuGestureFreehandItem)rotateCWItem
{
  return self->_rotateCWItem;
}

- (void)setRotateCWItem:(id)a3
{
}

- (SCATModernMenuGestureFreehandItem)rotate90Item
{
  return self->_rotate90Item;
}

- (void)setRotate90Item:(id)a3
{
}

- (SCATModernMenuGestureFreehandItem)rotate90CCWItem
{
  return self->_rotate90CCWItem;
}

- (void)setRotate90CCWItem:(id)a3
{
}

- (SCATModernMenuGestureFreehandItem)rotate90CWItem
{
  return self->_rotate90CWItem;
}

- (void)setRotate90CWItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end