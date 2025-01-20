@interface TVSettingsLegalViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsLegalViewController

- (id)loadSettingGroups
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"LegalTermsAndConditionsTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v5,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsTermsAndConditionsViewController));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  -[NSMutableArray addObject:](v3, "addObject:", v7);
  uint64_t v8 = TSKLocString(@"LegalAcknowledgementsTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  0LL,  0LL,  &stru_100190918));

  [v10 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v10);
  uint64_t v11 = TSKLocString(@"LegalRegulatoryTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v12,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsRegulatoryViewController));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  -[NSMutableArray addObject:](v3, "addObject:", v14);
  uint64_t v15 = TSKLocString(@"LegalSafetyTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v16,  0LL,  0LL,  0LL,  &stru_100190938));

  [v17 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v17);
  -[TSKSettingGroup setSettingItems:](v2, "setSettingItems:", v3);
  objc_opt_class(&OBJC_CLASS___TVSettingsLicenseUtilities);
  v20 = v2;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  return v18;
}

@end