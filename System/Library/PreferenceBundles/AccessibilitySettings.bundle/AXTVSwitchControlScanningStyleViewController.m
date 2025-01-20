@interface AXTVSwitchControlScanningStyleViewController
- (id)_scanningStyleGroup;
- (id)loadSettingGroups;
- (void)_scanningStyleCellClicked:(id)a3;
@end

@implementation AXTVSwitchControlScanningStyleViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlScanningStyleViewController _scanningStyleGroup](self, "_scanningStyleGroup"));
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (id)_scanningStyleGroup
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"AUTO_SCANNING_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  &off_6F570,  0LL,  self,  "_scanningStyleCellClicked:"));

  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"SCAN_STYLE_AUTO_FOOTER_TEXT");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setLocalizedDescription:v9];

  [v7 setUpdateBlock:&stru_655B0];
  -[NSMutableArray addObject:](v4, "addObject:", v7);
  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"MANUAL_SCANNING_LABEL");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  &off_6F588,  0LL,  self,  "_scanningStyleCellClicked:"));

  uint64_t v13 = AXParameterizedLocalizedString(2LL, @"SCAN_STYLE_MANUAL_FOOTER_TEXT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setLocalizedDescription:v14];

  [v12 setUpdateBlock:&stru_655B0];
  -[NSMutableArray addObject:](v4, "addObject:", v12);
  uint64_t v15 = AXParameterizedLocalizedString(2LL, @"DWELL_SCANNING_LABEL");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v16,  0LL,  &off_6F5A0,  0LL,  self,  "_scanningStyleCellClicked:"));

  uint64_t v18 = AXParameterizedLocalizedString(2LL, @"SCAN_STYLE_STEP_FOOTER_TEXT");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v17 setLocalizedDescription:v19];

  [v17 setUpdateBlock:&stru_655B0];
  -[NSMutableArray addObject:](v4, "addObject:", v17);
  [v3 setSettingItems:v4];

  return v3;
}

- (void)_scanningStyleCellClicked:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v5 = [v4 integerValue];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 setSwitchControlScanningStyle:v5];

  -[AXTVSwitchControlScanningStyleViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlScanningStyleViewController accessibilityPreviousViewController]( self,  "accessibilityPreviousViewController"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSKViewController);
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
    [v8 reloadSettings];
  }
}

@end