@interface SCATModernMenuGestureFreehandBendSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandBendSheet

- (id)makeMenuItemsIfNeeded
{
  int IsPad = AXDeviceIsPad(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  if (IsPad) {
    v5 = @"FREEHAND_BEND_RIGHT_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_BEND_RIGHT_ONE_LINE";
  }
  if (IsPad) {
    v6 = @"FREEHAND_BEND_LEFT_TWO_LINES";
  }
  else {
    v6 = @"FREEHAND_BEND_LEFT_ONE_LINE";
  }
  id v7 = sub_10002B014(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_10002B014(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_bendRight",  self,  v8,  @"bendRight",  1LL,  2LL));
  [v4 addObject:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_bendLeft",  self,  v10,  @"bendLeft",  1LL,  2LL));
  [v4 addObject:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_straighten",  self,  0LL,  0LL,  1LL,  3LL));
  [v4 addObject:v13];

  if ((IsPad & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  1LL));
    [v4 addObject:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  1LL));
    [v4 addObject:v15];

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase moveToolbarMenuItem](self, "moveToolbarMenuItem"));
LABEL_11:
    v18 = (void *)v16;
    [v4 addObject:v16];

    goto LABEL_12;
  }

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  1LL));
    [v4 addObject:v17];

    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  1LL));
    goto LABEL_11;
  }

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 isEqualToString:@"freehand_straighten"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 curvatureForFreehandSheet:self];
    double v9 = v8;

    int IsPad = AXDeviceIsPad(v10, v11);
    if (v9 == 0.0)
    {
      if (IsPad) {
        v13 = @"FREEHAND_STRAIGHT_TWO_LINES";
      }
      else {
        v13 = @"FREEHAND_STRAIGHT_ONE_LINE";
      }
      id v14 = sub_10002B014(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = @"straight";
    }

    else
    {
      if (IsPad) {
        v17 = @"FREEHAND_STRAIGHTEN_TWO_LINES";
      }
      else {
        v17 = @"FREEHAND_STRAIGHTEN_ONE_LINE";
      }
      id v18 = sub_10002B014(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = @"straightenFromLeft";
      if (v9 > 0.0) {
        v19 = @"straightenFromRight";
      }
      uint64_t v16 = v19;
    }

    [v4 setTitle:v15];
    [v4 setImagePrefixForTouchDependentGlyph:v16];
    [v4 setDisabled:v9 == 0.0];
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandBendSheet;
  BOOL v20 = -[SCATModernMenuGestureFreehandSheetBase shouldUpdateMenuItem:](&v22, "shouldUpdateMenuItem:", v4);

  return v20;
}

- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v7 isEqualToString:@"freehand_bendRight"])
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightBendRight:v4];
  }

  else if ([v7 isEqualToString:@"freehand_bendLeft"])
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightBendLeft:v4];
  }

  else
  {
    if (![v7 isEqualToString:@"freehand_straighten"])
    {
      v9.receiver = self;
      v9.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandBendSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItem:didBecomeFocused:](&v9, "menuItem:didBecomeFocused:", v6, v4);
      goto LABEL_8;
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v8 freehandSheet:self didHighlightStraighten:v4];
  }

LABEL_8:
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_bendRight"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 bendRightForFreehandSheet:self];
  }

  else if ([v5 isEqualToString:@"freehand_bendLeft"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 bendLeftForFreehandSheet:self];
  }

  else
  {
    if (![v5 isEqualToString:@"freehand_straighten"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandBendSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_8;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 straightenForFreehandSheet:self];
  }

LABEL_8:
}

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 1;
}

- (id)menuItemStruts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 scale];
  double v5 = v4;

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    id v6 = &off_10012F4F0;
    objc_super v7 = &off_10012F4D8;
  }

  else
  {
    id v6 = &off_10012F520;
    objc_super v7 = &off_10012F508;
  }

  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

@end