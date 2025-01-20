@interface AXTVVoiceOverVerbosityViewController
- (id)loadSettingGroups;
@end

@implementation AXTVVoiceOverVerbosityViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = AXTVLocString(@"AXVoiceOverSpeakDetectedTextTitle", v5, v6, v7, v8, v9, v10, v11, v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v21 = AXTVLocString(@"AXVoiceOverSpeakDetectedTextDescription", v14, v15, v16, v17, v18, v19, v20, v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v13,  v22,  v2,  @"voiceOverShouldSpeakDiscoveredText",  0LL,  0LL));

  [v4 addObject:v23];
  id v31 = AXTVLocString(@"AXVoiceOverMediaDescriptionsTitle", v24, v25, v26, v27, v28, v29, v30, v46);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v40 = AXTVLocString(@"AXVoiceOverMediaDescriptionsDescription", v33, v34, v35, v36, v37, v38, v39, v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v32,  v41,  v2,  @"voiceOverDescribedMedia",  &off_6FEC8));

  id v43 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65460];
  [v42 setLocalizedValueFormatter:v43];

  [v4 addObject:v42];
  [v3 setSettingItems:v4];
  uint64_t v46 = (uint64_t)v3;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));

  return v44;
}

@end