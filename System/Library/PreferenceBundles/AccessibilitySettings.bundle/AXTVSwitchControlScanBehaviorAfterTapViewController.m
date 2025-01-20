@interface AXTVSwitchControlScanBehaviorAfterTapViewController
- (id)_scanCurrentItemAfterTapGroup;
- (id)loadSettingGroups;
- (void)_cellPressed:(id)a3;
@end

@implementation AXTVSwitchControlScanBehaviorAfterTapViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlScanBehaviorAfterTapViewController _scanCurrentItemAfterTapGroup]( self,  "_scanCurrentItemAfterTapGroup"));
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (id)_scanCurrentItemAfterTapGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_LABEL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_FOOTER_TEXT");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setLocalizedDescription:v8];

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_DEFAULT_LABEL");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  &off_6F900,  0LL,  self,  "_cellPressed:"));

  [v12 setUpdateBlock:&stru_66298];
  -[NSMutableArray addObject:](v9, "addObject:", v12);
  uint64_t v13 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_CURRENT_ITEM_LABEL");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  &off_6F918,  0LL,  self,  "_cellPressed:"));

  [v15 setUpdateBlock:&stru_66298];
  -[NSMutableArray addObject:](v9, "addObject:", v15);
  [v6 setSettingItems:v9];

  return v6;
}

- (void)_cellPressed:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v5 = [v4 integerValue];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 setSwitchControlScanAfterTapLocation:v5];

  -[AXTVSwitchControlScanBehaviorAfterTapViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

@end