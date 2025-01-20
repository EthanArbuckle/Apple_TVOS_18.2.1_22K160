@interface AXTVSwitchControlSwitchVariantsViewController
+ (id)controllerWithSwitch:(id)a3;
- (AXSwitch)targetSwitch;
- (id)loadSettingGroups;
- (id)title;
- (void)setTargetSwitch:(id)a3;
@end

@implementation AXTVSwitchControlSwitchVariantsViewController

+ (id)controllerWithSwitch:(id)a3
{
  id v3 = a3;
  v4 = -[AXTVSwitchControlSwitchVariantsViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___AXTVSwitchControlSwitchVariantsViewController),  "initWithStyle:",  1LL);
  -[AXTVSwitchControlSwitchVariantsViewController setTargetSwitch:](v4, "setTargetSwitch:", v3);

  return v4;
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchVariantsViewController targetSwitch](self, "targetSwitch"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return v3;
}

- (id)loadSettingGroups
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNER_ACTIONS_LABEL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_DEFAULT_LABEL");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchVariantsViewController targetSwitch](self, "targetSwitch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v10,  @"self",  &stru_66ED0));

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlSwitchDefaultVariantValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlSwitchDefaultVariantValueFormatter"));
  [v11 setLocalizedValueFormatter:v12];

  -[NSMutableArray addObject:](v7, "addObject:", v11);
  uint64_t v13 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_LABEL");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchVariantsViewController targetSwitch](self, "targetSwitch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  v15,  @"self",  &stru_66EF0));

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlSwitchLongPressVariantValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlSwitchLongPressVariantValueFormatter"));
  [v16 setLocalizedValueFormatter:v17];

  -[NSMutableArray addObject:](v7, "addObject:", v16);
  [v6 setSettingItems:v7];
  id v20 = v6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  return v18;
}

- (AXSwitch)targetSwitch
{
  return self->_targetSwitch;
}

- (void)setTargetSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end