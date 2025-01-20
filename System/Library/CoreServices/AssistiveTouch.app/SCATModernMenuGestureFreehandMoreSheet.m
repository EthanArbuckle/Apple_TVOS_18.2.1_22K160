@interface SCATModernMenuGestureFreehandMoreSheet
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandMoreSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  id v4 = sub_10002B014(@"SLOWER");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"freehand_slower",  self,  v5,  @"SCATIcon_general_tortoise",  3LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"FASTER");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"freehand_faster",  self,  v8,  @"SCATIcon_general_hare",  3LL));
  [v3 addObject:v9];

  if (AXDeviceIsPad(v10, v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase autoPressLiftItems](self, "autoPressLiftItems"));
    [v3 addObjectsFromArray:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase moveToolbarMenuItem](self, "moveToolbarMenuItem"));
  [v3 addObject:v13];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"freehand_slower"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 decreaseVelocityForFreehandSheet:self];
  }

  else
  {
    if (![v5 isEqualToString:@"freehand_faster"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandMoreSheet;
      -[SCATModernMenuGestureFreehandSheetBase menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_7;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v6 increaseVelocityForFreehandSheet:self];
  }

LABEL_7:
}

- (id)menuItemStruts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 scale];
  double v5 = v4;

  if (-[SCATModernMenuGestureFreehandSheetBase isLandscape](self, "isLandscape"))
  {
    v6 = &off_10012F6A0;
    objc_super v7 = &off_10012F688;
  }

  else
  {
    v6 = &off_10012F6D0;
    objc_super v7 = &off_10012F6B8;
  }

  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

@end