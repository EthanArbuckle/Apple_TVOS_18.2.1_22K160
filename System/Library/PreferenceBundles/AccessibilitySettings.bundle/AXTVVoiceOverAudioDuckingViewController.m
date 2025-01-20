@interface AXTVVoiceOverAudioDuckingViewController
+ (double)_maximumVolumeValue;
+ (double)_minimumVolumeValue;
+ (id)_descriptionForCurrentAudioDuckingMode;
- (id)loadSettingGroups;
@end

@implementation AXTVVoiceOverAudioDuckingViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = AXTVLocString(@"AXVoiceOverAudioDuckingTitle", v5, v6, v7, v8, v9, v10, v11, v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVVoiceOverAudioDuckingViewController _descriptionForCurrentAudioDuckingMode]( &OBJC_CLASS___AXTVVoiceOverAudioDuckingViewController,  "_descriptionForCurrentAudioDuckingMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v13,  v14,  v2,  @"voiceOverMediaDuckingMode",  &off_700A8));

  [v15 setUpdateBlock:&stru_66188];
  id v16 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_661A8];
  [v15 setLocalizedValueFormatter:v16];

  [v4 addObject:v15];
  id v24 = AXTVLocString(@"AXVoiceOverAudioDuckingVolumeTitle", v17, v18, v19, v20, v21, v22, v23, v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_23590;
  v33[3] = &unk_65200;
  id v34 = v2;
  id v26 = v2;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v25,  0LL,  v26,  @"voiceOverVolume",  v33));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter"));
  [v27 setLocalizedValueFormatter:v28];

  [v27 setEnabledInStoreDemoMode:1];
  [v4 addObject:v27];
  [v3 setSettingItems:v4];
  id v35 = v3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));

  return v29;
}

+ (id)_descriptionForCurrentAudioDuckingMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = (char *)[v2 voiceOverMediaDuckingMode];

  uint64_t v11 = @"AXVoiceOverAudioDuckingOffFooter";
  if (v3 == (_BYTE *)&dword_0 + 2) {
    uint64_t v11 = @"AXVoiceOverAudioDuckingAlwaysFooter";
  }
  if (v3 == (_BYTE *)&dword_0 + 1) {
    id v12 = @"AXVoiceOverAudioDuckingOnlySpeakingFooter";
  }
  else {
    id v12 = (__CFString *)v11;
  }
  id v13 = AXTVLocString(v12, v4, v5, v6, v7, v8, v9, v10, v15);
  return (id)objc_claimAutoreleasedReturnValue(v13);
}

+ (double)_minimumVolumeValue
{
  return 0.00999999978;
}

+ (double)_maximumVolumeValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v2 voiceOverMediaDuckingMode]) {
    double v3 = 1.99000001;
  }
  else {
    double v3 = 1.0;
  }

  return v3;
}

@end