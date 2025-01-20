@interface SCATModernMenuGestureFreehandTouchSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (id)backTitle;
- (id)makeMenuItemsIfNeeded;
@end

@implementation SCATModernMenuGestureFreehandTouchSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  2LL));
  [v3 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase autoPressLiftItems](self, "autoPressLiftItems"));
  [v3 addObjectsFromArray:v5];

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase moveMenuItemWithPreferredNumberOfLines:]( self,  "moveMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v6];

    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuGestureFreehandSheetBase touchToggleMenuItemWithPreferredNumberOfLines:]( self,  "touchToggleMenuItemWithPreferredNumberOfLines:",  2LL));
    [v3 addObject:v7];
  }

  return v3;
}

- (id)backTitle
{
  return sub_10002B014(@"FREEHAND_BACK_TWO_LINES");
}

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 1;
}

@end