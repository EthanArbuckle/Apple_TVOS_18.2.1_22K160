@interface TVSettingsScreenSaverTransitionsViewController
+ (id)transitionTypeFormatter;
- (id)loadSettingGroups;
@end

@implementation TVSettingsScreenSaverTransitionsViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  v4 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v5 = TSKLocString(@"SaverTimePerSlide");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 availableTimesPerSlide]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v6,  0LL,  v3,  @"timePerSlide",  v7));

  [v8 setEnabledInStoreDemoMode:1];
  v9 = objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v9, "setUnitsStyle:", 3LL);
  -[NSDateComponentsFormatter setAllowedUnits:](v9, "setAllowedUnits:", 128LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10005A998;
  v21[3] = &unk_10018E608;
  v22 = v9;
  v10 = v9;
  [v8 setUpdateBlock:v21];
  v24 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v11);

  id v12 = [(id)objc_opt_class(self) transitionTypeFormatter];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_alloc(&OBJC_CLASS___TSKRadioSettingGroup);
  uint64_t v15 = TSKLocString(@"SaverTransitionTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 inputs]);
  v18 = -[TSKRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v14,  "initWithTitle:representedObject:keyPath:availableValues:",  v16,  v3,  @"transitionType",  v17);

  -[TSKRadioSettingGroup setEnabledInStoreDemoMode:](v18, "setEnabledInStoreDemoMode:", 1LL);
  -[TSKRadioSettingGroup setLocalizedValueFormatter:](v18, "setLocalizedValueFormatter:", v13);
  v23[0] = v4;
  v23[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));

  return v19;
}

+ (id)transitionTypeFormatter
{
  v35[0] = TVScreenSaverTransitionStyleRandom;
  v35[1] = TVScreenSaverTransitionStyleCube;
  v35[2] = TVScreenSaverTransitionStyleDissolve;
  v35[3] = TVScreenSaverTransitionStyleDroplet;
  v35[4] = TVScreenSaverTransitionStyleFadeBlack;
  v35[5] = TVScreenSaverTransitionStyleFadeWhite;
  v35[6] = TVScreenSaverTransitionStyleFlip;
  v35[7] = TVScreenSaverTransitionStyleMoveIn;
  v35[8] = TVScreenSaverTransitionStylePageFlip;
  v35[9] = TVScreenSaverTransitionStylePush;
  v35[10] = TVScreenSaverTransitionStyleReveal;
  v35[11] = TVScreenSaverTransitionStyleMosaicFlip;
  v35[12] = TVScreenSaverTransitionStyleTwirl;
  v35[13] = TVScreenSaverTransitionStyleWipe;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 14LL));
  uint64_t v2 = TSKLocString(@"SaverTransitionStyleRandom");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v34[0] = v32;
  uint64_t v3 = TSKLocString(@"SaverTransitionStyleCube");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v34[1] = v31;
  uint64_t v4 = TSKLocString(@"SaverTransitionStyleDissolve");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v34[2] = v30;
  uint64_t v5 = TSKLocString(@"SaverTransitionStyleDroplet");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v34[3] = v29;
  uint64_t v6 = TSKLocString(@"SaverTransitionStyleFadeBlack");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v34[4] = v28;
  uint64_t v7 = TSKLocString(@"SaverTransitionStyleFadeWhite");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v34[5] = v8;
  uint64_t v9 = TSKLocString(@"SaverTransitionStyleFlip");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v34[6] = v10;
  uint64_t v11 = TSKLocString(@"SaverTransitionStyleMoveIn");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v34[7] = v12;
  uint64_t v13 = TSKLocString(@"SaverTransitionStylePageFlip");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v34[8] = v14;
  uint64_t v15 = TSKLocString(@"SaverTransitionStylePush");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v34[9] = v16;
  uint64_t v17 = TSKLocString(@"SaverTransitionStyleReveal");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v34[10] = v18;
  uint64_t v19 = TSKLocString(@"SaverTransitionStyleMosaicFlip");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v34[11] = v20;
  uint64_t v21 = TSKLocString(@"SaverTransitionStyleTwirl");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v34[12] = v22;
  uint64_t v23 = TSKLocString(@"SaverTransitionStyleWipe");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v34[13] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 14LL));

  v26 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v33,  v25);
  return v26;
}

@end