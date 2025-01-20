@interface TVSettingsBackgroundAppRefreshViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsBackgroundAppRefreshViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBackgroundAppRefreshFacade sharedInstance]( &OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade,  "sharedInstance"));
  uint64_t v3 = TSKLocString(@"BackgroundAppRefreshTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"BackgroundAppRefreshDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v4,  v6,  v2,  @"backgroundAppRefreshEnabled",  0LL,  0LL));

  [v7 setUpdateBlock:&stru_1001937F8];
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  uint64_t v10 = TSKLocString(@"AppsTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v11,  v2,  @"backgroundAppRefreshSettings",  &stru_100193838));

  [v12 setSortsByTitle:1];
  v15[0] = v9;
  v15[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  return v13;
}

@end