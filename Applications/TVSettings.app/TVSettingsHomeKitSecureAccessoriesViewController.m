@interface TVSettingsHomeKitSecureAccessoriesViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsHomeKitSecureAccessoriesViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  uint64_t v3 = TSKLocString(@"HomeKitUnlockSecureAccessoriesShortTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v4,  0LL,  v2,  @"secureAccessoryAllowedRemotes",  objc_opt_class(&OBJC_CLASS___TVSettingsHomeKitSecureAccessoryControlViewController));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 allowedRemotesFormatter]);
  [v6 setLocalizedValueFormatter:v7];

  v16 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  uint64_t v10 = TSKLocString(@"HomeKitSecureAccessoriesNotificationsTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v11,  v2,  @"secureServices",  &stru_10018EF10));

  v15[0] = v9;
  v15[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  return v13;
}

@end