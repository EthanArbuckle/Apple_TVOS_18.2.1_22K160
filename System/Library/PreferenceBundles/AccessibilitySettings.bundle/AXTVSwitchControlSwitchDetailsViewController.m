@interface AXTVSwitchControlSwitchDetailsViewController
+ (id)controllerWithSwitch:(id)a3 variant:(int64_t)a4;
- (AXSwitch)targetSwitch;
- (id)_atvRemoteActionsGroup;
- (id)_noActionGroup;
- (id)_scannerActionsGroup;
- (id)_systemActionsGroup;
- (id)loadSettingGroups;
- (id)title;
- (int64_t)variant;
- (void)_updateItem:(id)a3;
- (void)actionCellClicked:(id)a3;
- (void)setTargetSwitch:(id)a3;
- (void)setVariant:(int64_t)a3;
@end

@implementation AXTVSwitchControlSwitchDetailsViewController

+ (id)controllerWithSwitch:(id)a3 variant:(int64_t)a4
{
  id v5 = a3;
  v6 = -[AXTVSwitchControlSwitchDetailsViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___AXTVSwitchControlSwitchDetailsViewController),  "initWithStyle:",  1LL);
  -[AXTVSwitchControlSwitchDetailsViewController setTargetSwitch:](v6, "setTargetSwitch:", v5);

  -[AXTVSwitchControlSwitchDetailsViewController setVariant:](v6, "setVariant:", a4);
  return v6;
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return v3;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ((char *)-[AXTVSwitchControlSwitchDetailsViewController variant](self, "variant") == (char *)&dword_0 + 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController _noActionGroup](self, "_noActionGroup"));
    [v3 axSafelyAddObject:v4];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController _scannerActionsGroup](self, "_scannerActionsGroup"));
  [v3 axSafelyAddObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController _systemActionsGroup](self, "_systemActionsGroup"));
  [v3 axSafelyAddObject:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController _atvRemoteActionsGroup](self, "_atvRemoteActionsGroup"));
  [v3 axSafelyAddObject:v7];

  return v3;
}

- (id)_noActionGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_LABEL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  uint64_t v8 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_NO_ACTION");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  &off_6F8E8,  0LL,  self,  "actionCellClicked:"));

  -[NSMutableArray addObject:](v7, "addObject:", v10);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_25700;
  v15 = &unk_65798;
  objc_copyWeak(&v16, &location);
  [v10 setUpdateBlock:&v12];
  objc_msgSend(v6, "setSettingItems:", v7, v12, v13, v14, v15);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_scannerActionsGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNER_ACTIONS_LABEL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id inited = objc_initWeak(&location, self);
  uint64_t v9 = SCATScannerSwitchActions(inited);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_2588C;
  id v16 = &unk_66278;
  v17 = self;
  v11 = v7;
  v18 = v11;
  objc_copyWeak(&v19, &location);
  [v10 enumerateObjectsUsingBlock:&v13];

  objc_msgSend(v6, "setSettingItems:", v11, v13, v14, v15, v16, v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_systemActionsGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SYSTEM_ACTIONS_LABEL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id inited = objc_initWeak(&location, self);
  uint64_t v9 = SCATSystemSwitchActions(inited);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_25B10;
  id v16 = &unk_66278;
  v17 = self;
  v11 = v7;
  v18 = v11;
  objc_copyWeak(&v19, &location);
  [v10 enumerateObjectsUsingBlock:&v13];

  objc_msgSend(v6, "setSettingItems:", v11, v13, v14, v15, v16, v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_atvRemoteActionsGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_ATV_REMOTE_ACTIONS_LABEL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithTitle:v5];

  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"SWITCH_ACTION_ATV_REMOTE_HINT");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setLocalizedDescription:v8];

  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id inited = objc_initWeak(&location, self);
  uint64_t v11 = SCATATVRemoteSwitchActions(inited);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_25DBC;
  v18 = &unk_66278;
  id v19 = self;
  uint64_t v13 = v9;
  v20 = v13;
  objc_copyWeak(&v21, &location);
  [v12 enumerateObjectsUsingBlock:&v15];

  objc_msgSend(v6, "setSettingItems:", v13, v15, v16, v17, v18, v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  return v6;
}

- (void)_updateItem:(id)a3
{
  id v11 = a3;
  int64_t v4 = -[AXTVSwitchControlSwitchDetailsViewController variant](self, "variant");
  if (v4 == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
    id v6 = [v5 longPressAction];
  }

  else
  {
    if (v4)
    {
      uint64_t v10 = 0LL;
      uint64_t v9 = v11;
      goto LABEL_7;
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
    id v6 = [v5 action];
  }

  id v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 representedObject]);
  LODWORD(v7) = v7 == [v8 integerValue];

  uint64_t v9 = v11;
  uint64_t v10 = 2LL * v7;
LABEL_7:
  [v9 setAccessoryTypes:v10];
}

- (void)actionCellClicked:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
  SCATRemoveSwitchFromSettings();

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  id v7 = [v6 integerValue];

  int64_t v8 = -[AXTVSwitchControlSwitchDetailsViewController variant](self, "variant");
  if (v8 == 1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
    [v9 setLongPressAction:v7];
    goto LABEL_5;
  }

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
    [v9 setAction:v7];
LABEL_5:
  }

  -[AXTVSwitchControlSwitchDetailsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchDetailsViewController targetSwitch](self, "targetSwitch"));
  SCATAddOrUpdateSwitchToSettings();

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_260CC;
  v11[3] = &unk_65530;
  v11[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v11, 0.75);
}

- (AXSwitch)targetSwitch
{
  return self->_targetSwitch;
}

- (void)setTargetSwitch:(id)a3
{
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (void).cxx_destruct
{
}

@end