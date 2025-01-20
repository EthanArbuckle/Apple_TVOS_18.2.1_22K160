@interface AXTVReduceMotionViewController
- (id)loadSettingGroups;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation AXTVReduceMotionViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVReduceMotionViewController;
  -[AXTVReduceMotionViewController viewDidLoad](&v4, "viewDidLoad");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_B588,  kAXSPhotosensitiveMitigationEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSPhotosensitiveMitigationEnabledNotification, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVReduceMotionViewController;
  -[AXTVReduceMotionViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v13 = AXTVLocString(@"AXReduceMotionTitle", v6, v7, v8, v9, v10, v11, v12, v42);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v14,  0LL,  v2,  @"reduceMotionEnabled",  0LL,  0LL));

  [v15 setEnabledInStoreDemoMode:1];
  if (AXDeviceSupportsPhotosensitiveMitigation(-[NSMutableArray addObject:](v5, "addObject:", v15)))
  {
    id v23 = AXTVLocStringWithTable( @"DIM_MITIGATION_TITLE",  @"Accessibility-PSE",  v17,  v18,  v19,  v20,  v21,  v22,  v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = PSESettingsFooterText();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v24,  v26,  v3,  @"photosensitiveMitigationEnabled",  0LL,  0LL));

    [v27 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v5, "addObject:", v27);
    v15 = v27;
  }

  id v28 = AXTVLocString(@"AXReduceMotionAutoplayVideoPreviewsTitle", v16, v17, v18, v19, v20, v21, v22, v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v29,  0LL,  v2,  @"reduceMotionAutoplayVideoPreviewsEnabled",  0LL,  0LL));

  id v38 = AXTVLocString(@"AXReduceMotionAutoplayVideoPreviewsDescription", v31, v32, v33, v34, v35, v36, v37, v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  [v30 setLocalizedDescription:v39];

  [v30 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v5, "addObject:", v30);
  [v4 setSettingItems:v5];
  uint64_t v42 = (uint64_t)v4;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));

  return v40;
}

@end