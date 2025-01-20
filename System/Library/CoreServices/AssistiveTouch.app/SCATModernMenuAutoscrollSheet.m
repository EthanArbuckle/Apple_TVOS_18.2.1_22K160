@interface SCATModernMenuAutoscrollSheet
- (BOOL)allowsExitAction;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (BOOL)shouldUseBackItemAsDoneItem;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (unint64_t)presentationMode;
- (void)dealloc;
- (void)menuItemWasActivated:(id)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuAutoscrollSheet

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autoscroller]);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATModernMenuAutoscrollSheet;
  -[SCATModernMenuSheet dealloc](&v5, "dealloc");
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_10002B014(@"PAUSE");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"autoscroll_pause",  self,  v5,  0LL,  3LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"SLOWER");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"autoscroll_decreaseSpeed",  self,  v8,  @"SCATIcon_general_tortoise",  3LL));
  [v3 addObject:v9];

  id v10 = sub_10002B014(@"FASTER");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"autoscroll_increaseSpeed",  self,  v11,  @"SCATIcon_general_hare",  3LL));
  [v3 addObject:v12];

  if (AXDeviceIsPad(v13, v14))
  {
    id v15 = sub_10002B014(@"TOP");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"autoscroll_scrollToTop",  self,  v16,  0LL,  3LL));
    [v3 addObject:v17];
  }

  return v3;
}

- (unint64_t)presentationMode
{
  return 1LL;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 1;
}

- (BOOL)allowsExitAction
{
  return 0;
}

- (int64_t)preferredTipObject
{
  return 0LL;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuAutoscrollSheet;
  -[SCATModernMenuSheet sheetWillDisappear:](&v6, "sheetWillDisappear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autoscroller]);

  [v4 setScrollElement:0];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v5 refreshElements];
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if ([v4 isEqualToString:@"autoscroll_pause"])
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autoscroller]);

    unsigned int v7 = [v6 isAutoscrolling];
    BOOL v8 = v7 == 0;
    if (v7) {
      v9 = @"PAUSE";
    }
    else {
      v9 = @"RESUME";
    }
    if (v8) {
      id v10 = @"SCATIcon_autoscroll_resume";
    }
    else {
      id v10 = @"SCATIcon_autoscroll_pause";
    }
    id v11 = sub_10002B014(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v3 setTitle:v12];

    [v3 setImageName:v10];
  }

  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"autoscroll_pause"])
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 autoscroller]);

    else {
      [v7 resume];
    }
  }

  else
  {
    if ([v5 isEqualToString:@"autoscroll_increaseSpeed"])
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 autoscroller]);

      [v9 increaseAutoscrollSpeed];
    }

    else if ([v5 isEqualToString:@"autoscroll_decreaseSpeed"])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v10 autoscroller]);

      [v9 decreaseAutoscrollSpeed];
    }

    else
    {
      if (![v5 isEqualToString:@"autoscroll_scrollToTop"])
      {
        v12.receiver = self;
        v12.super_class = (Class)&OBJC_CLASS___SCATModernMenuAutoscrollSheet;
        -[SCATModernMenuSheet menuItemWasActivated:](&v12, "menuItemWasActivated:", v4);
        goto LABEL_13;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v11 autoscroller]);

      [v9 scrollToTop];
    }
  }

@end