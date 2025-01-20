@interface DTTVResetMediaServicesViewController
- (id)loadSettingGroups;
- (void)resetAllMediaServices;
- (void)resetAudioServices;
- (void)resetCaptureServices;
- (void)resetCodecServices;
- (void)resetPlaybackServices;
@end

@implementation DTTVResetMediaServicesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"ResetAllMediaServices" value:&stru_18BA0 table:@"Localizable"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  0LL,  0LL,  self,  "resetAllMediaServices"));

  [v3 addObject:v7];
  v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"ResetAudioServices" value:&stru_18BA0 table:@"Localizable"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  self,  "resetAudioServices"));

  [v3 addObject:v11];
  v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", @"ResetPlaybackServices"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  0LL,  0LL,  self,  "resetPlaybackServices"));

  [v3 addObject:v15];
  v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"ResetCaptureServices" value:&stru_18BA0 table:@"Localizable"]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v18,  0LL,  0LL,  0LL,  self,  "resetCaptureServices"));

  [v3 addObject:v19];
  v20 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"ResetCodecServices" value:&stru_18BA0 table:@"Localizable"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v22,  0LL,  0LL,  0LL,  self,  "resetCodecServices"));

  [v3 addObject:v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v3));
  v27 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

  return v25;
}

- (void)resetAllMediaServices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DTTVResetMediaServicesViewController navigationController](self, "navigationController"));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)resetAudioServices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DTTVResetMediaServicesViewController navigationController](self, "navigationController"));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)resetPlaybackServices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DTTVResetMediaServicesViewController navigationController](self, "navigationController"));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)resetCaptureServices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DTTVResetMediaServicesViewController navigationController](self, "navigationController"));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)resetCodecServices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DTTVResetMediaServicesViewController navigationController](self, "navigationController"));
  id v3 = [v4 popViewControllerAnimated:1];
}

@end