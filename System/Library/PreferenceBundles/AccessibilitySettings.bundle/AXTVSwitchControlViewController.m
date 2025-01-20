@interface AXTVSwitchControlViewController
- (id)_audioGroup;
- (id)_cursorColorFormatter;
- (id)_cursorColorValues;
- (id)_dwellTimeItem;
- (id)_groupingGroup;
- (id)_longPressItem;
- (id)_menuGroup;
- (id)_moveRepeatItem;
- (id)_pauseOnFirstItem;
- (id)_pointScanningGroup;
- (id)_savedGesturesGroup;
- (id)_scanCyclesItem;
- (id)_scannerTimeoutItem;
- (id)_scanningSpeedItem;
- (id)_scanningStyleGroup;
- (id)_switchControlGeneralSettingGroup;
- (id)_switchStabilizationGroup;
- (id)_switchesAndRecipesGroup;
- (id)_tapBehaviorGroup;
- (id)_timingGroup;
- (id)_visualsGroup;
- (id)loadSettingGroups;
- (void)_longPressPauseScanningToggled:(id)a3;
@end

@implementation AXTVSwitchControlViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlViewController _switchControlGeneralSettingGroup]( self,  "_switchControlGeneralSettingGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _switchesAndRecipesGroup](self, "_switchesAndRecipesGroup"));
  [v3 axSafelyAddObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _scanningStyleGroup](self, "_scanningStyleGroup"));
  [v3 axSafelyAddObject:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _timingGroup](self, "_timingGroup"));
  [v3 axSafelyAddObject:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _tapBehaviorGroup](self, "_tapBehaviorGroup"));
  [v3 axSafelyAddObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _switchStabilizationGroup](self, "_switchStabilizationGroup"));
  [v3 axSafelyAddObject:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _audioGroup](self, "_audioGroup"));
  [v3 axSafelyAddObject:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _menuGroup](self, "_menuGroup"));
  [v3 axSafelyAddObject:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _groupingGroup](self, "_groupingGroup"));
  [v3 axSafelyAddObject:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _visualsGroup](self, "_visualsGroup"));
  [v3 axSafelyAddObject:v13];

  return v3;
}

- (id)_switchControlGeneralSettingGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v6,  0LL,  v2,  @"switchControlEnabled",  0LL,  0LL));

  [v7 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v4, "addObject:", v7);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_FOOTER_TEXT_ATV");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setLocalizedDescription:v9];

  [v3 setSettingItems:v4];
  return v3;
}

- (id)_switchesAndRecipesGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SWITCHES_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"REQUIRED_SWITCHES_MANUAL_FOOTER_TEXT");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v6,  v8,  v2,  @"assistiveTouchSwitches",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlSwitchesViewController));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils collectionCountValueFormatter](&OBJC_CLASS___AXTVUtils, "collectionCountValueFormatter"));
  [v10 setLocalizedValueFormatter:v11];

  -[NSMutableArray addObject:](v4, "addObject:", v10);
  [v3 setSettingItems:v4];

  return v3;
}

- (id)_scanningStyleGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SCANNING_STYLE_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v6,  0LL,  v2,  @"switchControlScanningStyle",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlScanningStyleViewController));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlScanningStyleValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlScanningStyleValueFormatter"));
  [v8 setLocalizedValueFormatter:v9];

  -[NSMutableArray addObject:](v4, "addObject:", v8);
  [v3 setSettingItems:v4];

  return v3;
}

- (id)_moveRepeatItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"STEP_REPEAT_LABEL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"STEP_REPEAT_FOOTER");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_47AC;
  v13[3] = &unk_65200;
  id v7 = v2;
  id v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  v6,  0LL,  0LL,  v13));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_4878;
  v11[3] = &unk_65228;
  id v12 = v7;
  id v9 = v7;
  [v8 setUpdateBlock:v11];

  return v8;
}

- (void)_longPressPauseScanningToggled:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  uint64_t v5 = [v4 assistiveTouchLongPressPauseScanningEnabled] ^ 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 setAssistiveTouchLongPressPauseScanningEnabled:v5];

  -[AXTVSwitchControlViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)_longPressItem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_LABEL");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_FOOTER");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_4AA0;
  v14[3] = &unk_651B0;
  id v8 = v3;
  id v15 = v8;
  v16 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  v7,  0LL,  0LL,  v14));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_4CA4;
  v12[3] = &unk_65228;
  id v13 = v8;
  id v10 = v8;
  [v9 setUpdateBlock:v12];

  return v9;
}

- (id)_scanningSpeedItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SCANNING_SPEED_LABEL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_4E24;
  v9[3] = &unk_65200;
  id v10 = v2;
  id v5 = v2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v5,  @"assistiveTouchStepInterval",  v9));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v6 setLocalizedValueFormatter:v7];

  return v6;
}

- (id)_pauseOnFirstItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"DELAY_AFTER_INPUT");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"DELAY_AFTER_INPUT_FOOTER");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_5080;
  v13[3] = &unk_65200;
  id v7 = v2;
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  v6,  0LL,  0LL,  v13));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_514C;
  v11[3] = &unk_65228;
  id v12 = v7;
  id v9 = v7;
  [v8 setUpdateBlock:v11];

  return v8;
}

- (id)_scanCyclesItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SCAN_CYCLES_LABEL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SCAN_CYCLES_FOOTER_TEXT");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v4,  v6,  v2,  @"assistiveTouchScanCycles",  &off_6FEB0));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils simpleIntegerFormatter](&OBJC_CLASS___AXTVUtils, "simpleIntegerFormatter"));
  [v7 setLocalizedValueFormatter:v8];

  return v7;
}

- (id)_scannerTimeoutItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SCAN_TIMEOUT_LABEL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SCAN_TIMEOUT_FOOTER");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_53D8;
  v13[3] = &unk_65200;
  id v7 = v2;
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  v6,  0LL,  0LL,  v13));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_54A4;
  v11[3] = &unk_65228;
  id v12 = v7;
  id v9 = v7;
  [v8 setUpdateBlock:v11];

  return v8;
}

- (id)_dwellTimeItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"DWELL_TIME_LABEL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_5624;
  v9[3] = &unk_65200;
  id v10 = v2;
  id v5 = v2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v5,  @"switchControlDwellTime",  v9));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v6 setLocalizedValueFormatter:v7];

  return v6;
}

- (id)_timingGroup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"TIMING_HEADING");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 initWithTitle:v6];

  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v9 = (char *)[v3 switchControlScanningStyle];
  if (v9 == (_BYTE *)&dword_0 + 2)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _pauseOnFirstItem](self, "_pauseOnFirstItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _dwellTimeItem](self, "_dwellTimeItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v14);

    goto LABEL_6;
  }

  if (v9 == (_BYTE *)&dword_0 + 1)
  {
LABEL_6:
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _scannerTimeoutItem](self, "_scannerTimeoutItem"));
    goto LABEL_7;
  }

  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _scanningSpeedItem](self, "_scanningSpeedItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _pauseOnFirstItem](self, "_pauseOnFirstItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v11);

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _scanCyclesItem](self, "_scanCyclesItem"));
LABEL_7:
    id v15 = (void *)v12;
    -[NSMutableArray addObject:](v8, "addObject:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _moveRepeatItem](self, "_moveRepeatItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _longPressItem](self, "_longPressItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v17);
  }

  [v7 setSettingItems:v8];

  return v7;
}

- (id)_tapBehaviorGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_TAP_GROUP_TITLE");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_LABEL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_DEFAULT_FOOTER_TEXT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v9,  v11,  v2,  @"switchControlTapBehavior",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlTapBehaviorViewController));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlTapBehaviorValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlTapBehaviorValueFormatter"));
  [v13 setLocalizedValueFormatter:v14];

  -[NSMutableArray addObject:](v7, "addObject:", v13);
  uint64_t v15 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_LABEL");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = AXParameterizedLocalizedString(2LL, @"SCAN_LOCATION_AFTER_TAP_FOOTER_TEXT");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v16,  v18,  v2,  @"switchControlScanAfterTapLocation",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlScanBehaviorAfterTapViewController));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlScanAfterTapLocationValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlScanAfterTapLocationValueFormatter"));
  [v20 setLocalizedValueFormatter:v21];

  -[NSMutableArray addObject:](v7, "addObject:", v20);
  uint64_t v22 = AXParameterizedLocalizedString(2LL, @"ALWAYS_TAP_KEYBOARD_KEYS_LABEL");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v23,  0LL,  v2,  @"switchControlShouldAlwaysActivateKeyboardKeys",  0LL,  0LL));

  -[NSMutableArray addObject:](v7, "addObject:", v24);
  [v6 setSettingItems:v7];

  return v6;
}

- (id)_switchStabilizationGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_STABILITY_HEADING");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v22 = [v3 initWithTitle:v5];

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"REQUIRE_HOLD_LABEL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = AXParameterizedLocalizedString(2LL, @"REQUIRE_HOLD_FOOTER_TEXT");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_5DD0;
  v29[3] = &unk_65200;
  id v11 = v2;
  id v30 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v8,  v10,  0LL,  0LL,  v29));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_5E9C;
  v27[3] = &unk_65228;
  id v13 = v11;
  id v28 = v13;
  [v12 setUpdateBlock:v27];
  -[NSMutableArray addObject:](v6, "addObject:", v12);
  uint64_t v14 = AXParameterizedLocalizedString(2LL, @"IGNORE_REPEAT_LABEL");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = AXParameterizedLocalizedString(2LL, @"IGNORE_REPEAT_FOOTER");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_5F28;
  v25[3] = &unk_65200;
  id v18 = v13;
  id v26 = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v15,  v17,  0LL,  0LL,  v25));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_5FF4;
  v23[3] = &unk_65228;
  id v24 = v18;
  id v20 = v18;
  [v19 setUpdateBlock:v23];
  -[NSMutableArray addObject:](v6, "addObject:", v19);
  [v22 setSettingItems:v6];

  return v22;
}

- (id)_pointScanningGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"AXIS_SELECTION_HEADING");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"AXIS_SWEEP_SPEED");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"AXIS_SWEEP_SPEED_FOOTER");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v9,  v11,  v2,  @"assistiveTouchAxisSweepSpeed",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlGlidingCursorSpeedViewController));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v13 setLocalizedValueFormatter:v14];

  -[NSMutableArray addObject:](v7, "addObject:", v13);
  [v6 setSettingItems:v7];

  return v6;
}

- (id)_audioGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"OUTPUT_HEADING");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"SOUND_LABEL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v9,  0LL,  v2,  @"assistiveTouchScannerSoundEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v7, "addObject:", v10);
  uint64_t v11 = AXParameterizedLocalizedString(2LL, @"SPEECH_LABEL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v12,  0LL,  v2,  @"assistiveTouchScannerSpeechEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v7, "addObject:", v13);
  [v6 setSettingItems:v7];

  return v6;
}

- (id)_menuGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"MENU_GROUP_TITLE");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_HEADING");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v9,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlCustomizeMenuViewController));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  -[NSMutableArray addObject:](v7, "addObject:", v11);
  uint64_t v12 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_SHORT_FIRST_PAGE");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_SHORT_FIRST_PAGE_FOOTER_TEXT");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v13,  v15,  v2,  @"switchControlShouldUseShortFirstPage",  0LL,  0LL));

  -[NSMutableArray addObject:](v7, "addObject:", v16);
  [v6 setSettingItems:v7];

  return v6;
}

- (id)_groupingGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"ITEM_GROUPING_LABEL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"ITEM_GROUPING_FOOTER_TEXT");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v6,  v8,  v2,  @"assistiveTouchGroupElementsEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v4, "addObject:", v9);
  [v3 setSettingItems:v4];

  return v3;
}

- (id)_visualsGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"VISUAL_HEADING");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 initWithTitle:v6];

  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v9 = AXParameterizedLocalizedString(2LL, @"CURSOR_COLOR");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _cursorColorValues](self, "_cursorColorValues"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v10,  0LL,  v3,  @"assistiveTouchCursorColor",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlViewController _cursorColorFormatter](self, "_cursorColorFormatter"));
  [v12 setLocalizedValueFormatter:v13];

  -[NSMutableArray addObject:](v8, "addObject:", v12);
  [v7 setSettingItems:v8];

  return v7;
}

- (id)_cursorColorValues
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", i));
    [v2 addObject:v4];
  }

  return v2;
}

- (id)_cursorColorFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_652F0];
}

- (id)_savedGesturesGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"CUSTOM_GESTURES");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v6,  0LL,  v2,  @"switchControlEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v4, "addObject:", v7);
  [v3 setSettingItems:v4];

  return v3;
}

@end