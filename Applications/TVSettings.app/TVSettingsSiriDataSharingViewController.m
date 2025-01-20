@interface TVSettingsSiriDataSharingViewController
- (id)loadSettingGroups;
- (void)_toggleOptInStatus:(id)a3;
@end

@implementation TVSettingsSiriDataSharingViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = TSKLocString(@"SiriDataSharingTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"SiriDataSharingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  v8,  v3,  @"dataSharingOptInStatus",  self,  "_toggleOptInStatus:"));

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSSiriSettings tvsettings_dataSharingStatusFormatter]( &OBJC_CLASS___TVCSSiriSettings,  "tvsettings_dataSharingStatusFormatter"));
  [v9 setLocalizedValueFormatter:v10];

  -[NSMutableArray addObject:](v4, "addObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.improvesiridictation"));

  uint64_t v12 = TSKLocString(@"SiriDataSharingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 setLocalizedDescription:v13];

  [v11 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v4, "addObject:", v11);
  v14 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  -[TSKSettingGroup setSettingItems:](v14, "setSettingItems:", v4);
  v17 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  return v15;
}

- (void)_toggleOptInStatus:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if ([v4 dataSharingOptInStatus] == (id)1) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setDataSharingOptInStatus:v3 propagateToHomeAccessories:0 source:2 reason:@"User initiated change"];
}

@end