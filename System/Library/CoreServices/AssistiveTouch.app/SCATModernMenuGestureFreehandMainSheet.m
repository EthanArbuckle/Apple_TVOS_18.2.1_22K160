@interface SCATModernMenuGestureFreehandMainSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUseBackItemAsDoneItem;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandMainSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (AXDeviceIsPad(v3, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase rotateMenuItemWithPreferredNumberOfLines:]( self,  "rotateMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v5];

    v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase bendMenuItemWithPreferredNumberOfLines:]( self,  "bendMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v6];

    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v8];

    id v9 = sub_10002B014(@"FREEHAND_MORE_TWO_LINES");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_more",  self,  v10,  2LL));
    [v3 addObject:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase moveToolbarMenuItem](self, "moveToolbarMenuItem"));
    [v3 addObject:v12];
  }

  else
  {
    if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase pathMenuItems](self, "pathMenuItems"));
      [v3 addObjectsFromArray:v13];
    }

    else
    {
      id v14 = sub_10002B014(@"FREEHAND_PATH");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:",  @"freehand_path",  self,  v13,  @"adjust",  1LL,  2LL));
      [v3 addObject:v15];
    }

    id v16 = sub_10002B014(@"FREEHAND_TOUCH");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_touch",  self,  v17,  2LL));
    [v3 addObject:v18];

    id v19 = sub_10002B014(@"FREEHAND_MORE_ONE_LINE");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuGestureFreehandItem itemWithIdentifier:delegate:title:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:activateBehavior:",  @"freehand_more",  self,  v12,  2LL));
    [v3 addObject:v20];
  }

  return v3;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_path"])
  {
    v7 = &OBJC_CLASS___SCATModernMenuGestureFreehandPathSheet;
  }

  else if ([v5 isEqualToString:@"freehand_touch"])
  {
    v7 = &OBJC_CLASS___SCATModernMenuGestureFreehandTouchSheet;
  }

  else
  {
    if (![v5 isEqualToString:@"freehand_more"])
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandMainSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItemWasActivated:](&v10, "menuItemWasActivated:", v4);
      goto LABEL_8;
    }

    v7 = &OBJC_CLASS___SCATModernMenuGestureFreehandMoreSheet;
  }

  *(void *)&double v8 = objc_opt_class(v7, v6).n128_u64[0];
  -[SCATModernMenuGestureFreehandSheetBase pushFreehandSheetOfClass:](self, "pushFreehandSheetOfClass:", v9, v8);
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
    uint64_t v6 = &off_10012F5F8;
    v7 = &off_10012F5E0;
  }

  else
  {
    uint64_t v6 = &off_10012F628;
    v7 = &off_10012F610;
  }

  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

@end