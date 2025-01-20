@interface AXTVSwitchControlTapBehaviorViewController
- (id)_autotapTimeoutGroup;
- (id)_tapBehaviorGroup;
- (id)loadSettingGroups;
- (void)_tapBehaviorCellPressed:(id)a3;
@end

@implementation AXTVSwitchControlTapBehaviorViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlTapBehaviorViewController _tapBehaviorGroup](self, "_tapBehaviorGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlTapBehaviorViewController _autotapTimeoutGroup](self, "_autotapTimeoutGroup"));
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (id)_tapBehaviorGroup
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_DEFAULT_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  &off_6F8A0,  0LL,  self,  "_tapBehaviorCellPressed:"));

  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_DEFAULT_FOOTER_TEXT");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setLocalizedDescription:v9];

  [v7 setUpdateBlock:&stru_66230];
  -[NSMutableArray addObject:](v4, "addObject:", v7);
  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_AUTO_LABEL");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  &off_6F8B8,  0LL,  self,  "_tapBehaviorCellPressed:"));

  uint64_t v13 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_AUTO_FOOTER_TEXT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setLocalizedDescription:v14];

  [v12 setUpdateBlock:&stru_66230];
  -[NSMutableArray addObject:](v4, "addObject:", v12);
  uint64_t v15 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_ALWAYS_LABEL");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v16,  0LL,  &off_6F8D0,  0LL,  self,  "_tapBehaviorCellPressed:"));

  uint64_t v18 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_ALWAYS_FOOTER_TEXT");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v17 setLocalizedDescription:v19];

  [v17 setUpdateBlock:&stru_66230];
  -[NSMutableArray addObject:](v4, "addObject:", v17);
  [v3 setSettingItems:v4];

  return v3;
}

- (id)_autotapTimeoutGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  objc_initWeak(&location, v4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_25224;
  v13[3] = &unk_65798;
  objc_copyWeak(&v14, &location);
  [v4 setUpdateBlock:v13];
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_AUTO_TIMEOUT_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_25284;
  v11[3] = &unk_65200;
  id v7 = v2;
  id v12 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v6,  0LL,  v7,  @"switchControlAutoTapTimeout",  v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v8 setLocalizedValueFormatter:v9];

  -[NSMutableArray addObject:](v3, "addObject:", v8);
  [v4 setSettingItems:v3];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v4;
}

- (void)_tapBehaviorCellPressed:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v5 = [v4 integerValue];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 setSwitchControlTapBehavior:v5];

  -[AXTVSwitchControlTapBehaviorViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

@end