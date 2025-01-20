@interface TVSettingsNativeModeSwitchingViewController
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_selectBestQMSMode:(id)a3;
- (void)_selectUnverifiedDisplayModeItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsNativeModeSwitchingViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsNativeModeSwitchingViewController;
  -[TVSettingsNativeModeSwitchingViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNativeModeSwitchingViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  if (+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR"))
  {
    uint64_t v4 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v5,  v7,  v3,  @"shouldModeSwitchForDynamicRange",  0LL,  0LL));

    -[NSMutableArray addObject:](v47, "addObject:", v8);
  }

  uint64_t v9 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v10,  v12,  v3,  @"shouldModeSwitchForFrameRate",  0LL,  0LL));

  -[NSMutableArray addObject:](v47, "addObject:", v45);
  if (_os_feature_enabled_impl("PineBoard", "quamash")
    && +[TVSDevice supportsQMSAndVRR](&OBJC_CLASS___TVSDevice, "supportsQMSAndVRR")
    && [v44 displaySupportsQMS])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = TSKLocStringFromBundleCachingKey( @"AVNativeModeSwitchingMatchFrameRateWithQMS",  v13,  1LL,  0LL,  @"Localizable-QMSVRR");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v17 = TSKLocStringFromBundleCachingKey( @"AVNativeModeSwitchingMatchVideoFrameRateWithQMSDescription",  v16,  1LL,  0LL,  @"Localizable-QMSVRR");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v15,  v18,  v3,  @"shouldUseQMSForFrameRateSwitching",  0LL,  0LL));

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10007209C;
    v55[3] = &unk_10018E608;
    id v20 = v3;
    id v56 = v20;
    [v19 setUpdateBlock:v55];
    -[NSMutableArray addObject:](v47, "addObject:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bestNearbyModeForQMS]);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v23 = TSKLocStringFromBundleCachingKey( @"AVNativeModeSwitchingOptimizeQMS",  v22,  1LL,  0LL,  @"Localizable-QMSVRR");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v26 = TSKLocStringFromBundleCachingKey( @"AVNativeModeSwitchingOptimizeQMSDescription",  v25,  1LL,  0LL,  @"Localizable-QMSVRR");
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v24,  v27,  v20,  @"bestNearbyModeForQMS",  self,  "_selectBestQMSMode:"));

      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_10007211C;
      v52[3] = &unk_100191678;
      id v53 = v44;
      id v54 = v20;
      [v28 setUpdateBlock:v52];
      -[NSMutableArray addObject:](v47, "addObject:", v28);
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v47));
  -[NSMutableArray addObject:](v46, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v3 unverifiedDisplayModes]);
  BOOL v31 = [v30 count] == 0;

  if (!v31)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000721C0;
    v50[3] = &unk_10018EBC0;
    objc_copyWeak(&v51, &location);
    v32 = objc_retainBlock(v50);
    v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"unverifiedDisplayModes",  v32));
    -[NSMutableArray addObject:](v33, "addObject:", v34);
    uint64_t v35 = TSKLocString(@"AVNativeModeSwitchingAllFormatsAreAvailable");
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v36,  0LL,  v3,  0LL));

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100072520;
    v48[3] = &unk_10018E608;
    id v49 = v3;
    [v37 setUpdateBlock:v48];
    v58 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v38));

    -[NSMutableArray addObject:](v33, "addObject:", v39);
    uint64_t v40 = TSKLocString(@"AVNativeModeSwitchingMatchVideoUnverifiedFormats");
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v41,  v33));

    -[NSMutableArray addObject:](v46, "addObject:", v42);
    objc_destroyWeak(&v51);
  }

  objc_destroyWeak(&location);
  return v46;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (id)1)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNativeModeSwitchingViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v7 section]));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNativeModeSwitchingViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v7));
    v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
    uint64_t v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7]);

    [v13 settingItem:v9 didUpdateMetadataWithGroup:v8];
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVSettingsNativeModeSwitchingViewController;
    id v14 = -[TVSettingsNativeModeSwitchingViewController tableView:cellForRowAtIndexPath:]( &v16,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  return v13;
}

- (void)_selectUnverifiedDisplayModeItem:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  v3 = -[PBSDisplayAssistantPresentationRequest initWithDestinationDisplayMode:kind:source:]( objc_alloc(&OBJC_CLASS___PBSDisplayAssistantPresentationRequest),  "initWithDestinationDisplayMode:kind:source:",  v5,  6LL,  1LL);
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v4 presentDisplayAssistantWithRequest:v3 dismissHandler:0];
  }
}

- (void)_selectBestQMSMode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 keyPath]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 valueForKeyPath:v5]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  [v6 updateDisplayManagerWithDisplayMode:v7 reason:@"Switching to best-fit mode for QMS on user selection" requestConfiguration:&stru_100191698 completion:0];
}

@end