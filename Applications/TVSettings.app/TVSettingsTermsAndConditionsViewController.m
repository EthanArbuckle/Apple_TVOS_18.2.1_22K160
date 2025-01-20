@interface TVSettingsTermsAndConditionsViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsTermsAndConditionsViewController

- (id)loadSettingGroups
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"LegalLicenseAgreementTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  &stru_100190CE0));

  [v6 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v6);
  uint64_t v7 = TSKLocString(@"LegalGameCenterTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v8,  0LL,  0LL,  0LL,  &stru_100190D00));

  [v9 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v9);
  uint64_t v10 = TSKLocString(@"LegaliCloudTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v11,  0LL,  0LL,  0LL,  &stru_100190D20));

  [v12 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v12);
  uint64_t v13 = TSKLocString(@"LegaliTunesTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  0LL,  0LL,  &stru_100190D40));

  [v15 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v15);
  uint64_t v16 = TSKLocString(@"LegalWarrantyTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v17,  0LL,  0LL,  0LL,  &stru_100190D60));

  [v18 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v18);
  -[TSKSettingGroup setSettingItems:](v2, "setSettingItems:", v3);
  v21 = v2;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));

  return v19;
}

@end