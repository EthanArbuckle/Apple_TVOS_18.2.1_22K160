@interface SCATModernMenuRotateItemsSheet
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuRotateItemsSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_10002B014(@"ORIENTATION-PORTRAIT");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:",  @"device_rotatePortrait"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"device_rotatePortrait",  self,  v5,  v6,  0LL));
  [v3 addObject:v7];

  id v8 = sub_10002B014(@"ORIENTATION-LANDSCAPE-LEFT");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:",  @"device_rotateLeft"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"device_rotateLeft",  self,  v9,  v10,  0LL));
  [v3 addObject:v11];

  id v12 = sub_10002B014(@"ORIENTATION-LANDSCAPE-RIGHT");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:",  @"device_rotateRight"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"device_rotateRight",  self,  v13,  v14,  0LL));
  [v3 addObject:v15];

  id v16 = sub_10002B014(@"ORIENTATION-UPSIDE-DOWN");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:",  @"device_rotateUpsideDown"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"device_rotateUpsideDown",  self,  v17,  v18,  0LL));
  [v3 addObject:v19];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"device_rotateLeft"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v6 rotateLeft];
  }

  else if ([v5 isEqualToString:@"device_rotateRight"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v6 rotateRight];
  }

  else if ([v5 isEqualToString:@"device_rotatePortrait"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v6 rotatePortrait];
  }

  else
  {
    if (![v5 isEqualToString:@"device_rotateUpsideDown"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuRotateItemsSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_10;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v6 rotateUpsideDown];
  }

LABEL_10:
}

@end