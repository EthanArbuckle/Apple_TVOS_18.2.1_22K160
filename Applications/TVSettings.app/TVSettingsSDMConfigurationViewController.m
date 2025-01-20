@interface TVSettingsSDMConfigurationViewController
- (id)loadSettingGroups;
- (void)applyChanges;
- (void)discardChanges;
@end

@implementation TVSettingsSDMConfigurationViewController

- (id)loadSettingGroups
{
  v3 = objc_alloc_init(&OBJC_CLASS____TVSettingsInteralStoreDemoModeFacade);
  settingsFacade = self->_settingsFacade;
  self->_settingsFacade = v3;

  -[TVSettingsSDMConfigurationViewController setTitle:](self, "setTitle:", @"Retail Demo Configuration");
  v5 = self->_settingsFacade;
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v7 = -[_TVSettingsInteralStoreDemoModeFacade isEnrolledInDeKOTA](self->_settingsFacade, "isEnrolledInDeKOTA");
  v8 = self->_settingsFacade;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"Demo Mode",  @"Turns Retail Demo Mode on or off",  v8,  @"enabled",  0LL,  0LL,  v5));
    [v9 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v6, "addObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"Unenroll Device",  @"Remove this Apple TV from Demo Mode",  self->_settingsFacade,  @"requestUnenroll",  @"Yes",  @"No"));

    [v10 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v6, "addObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  @"Configuration URL",  @"Screensaver assets will be pulled from this URL",  self->_settingsFacade,  @"screenSaverConfigurationURLString"));
    [v13 setKeyboardType:3];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100048E84;
    v45[3] = &unk_10018E608;
    v46 = v5;
    [v13 setUpdateBlock:v45];
    -[NSMutableArray addObject:](v12, "addObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  @"Screen Saver",  v12));
    v48[0] = v11;
    v48[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));

    v16 = v46;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsInteralStoreDemoModeFacade availableModeTypes](v8, "availableModeTypes", v5));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  @"Demo Mode",  @"Sets the specific Retail Demo Mode Type",  v8,  @"modeType",  v17));

    [v18 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v6, "addObject:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  @"Configuration URL",  @"Screensaver assets will be pulled from this URL",  self->_settingsFacade,  @"screenSaverConfigurationURLString"));
    [v20 setKeyboardType:3];
    [v20 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v19, "addObject:", v20);
    v16 = (_TVSettingsInteralStoreDemoModeFacade *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  @"Screen Saver",  v19));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100048EC8;
    v43[3] = &unk_10018E608;
    v21 = v5;
    v44 = v21;
    -[_TVSettingsInteralStoreDemoModeFacade setUpdateBlock:](v16, "setUpdateBlock:", v43);
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"Restrict Video Playback",  @"Restrict the amount of time the video player will play back content",  self->_settingsFacade,  @"videoPlaybackRestricted",  @"On",  @"Off"));
    [v22 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v12, "addObject:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  @"Video Playback Duration",  @"The number of seconds that video playback will be restricted to",  self->_settingsFacade,  @"videoPlaybackRestrictionTimeout"));

    [v13 setKeyboardType:5];
    v23 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
    [v13 setLocalizedValueFormatter:v23];

    [v13 setEnabledInStoreDemoMode:1];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100048F58;
    v41[3] = &unk_10018E608;
    v24 = v21;
    v42 = v24;
    [v13 setUpdateBlock:v41];
    -[NSMutableArray addObject:](v12, "addObject:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  @"Video Playback",  v12));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100048F9C;
    v39[3] = &unk_10018E608;
    v40 = v24;
    [v25 setUpdateBlock:v39];
    v47[0] = v11;
    v47[1] = v16;
    v47[2] = v25;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));
  }

  v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  @"Restore Current Settings",  @"Restores current settings",  0LL,  0LL,  self->_settingsFacade,  "restoreDefaults"));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10004902C;
  v37[3] = &unk_10018E608;
  id v28 = v34;
  id v38 = v28;
  [v27 setUpdateBlock:v37];
  [v27 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v26, "addObject:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  @"Apply Changes",  @"Applies the changes and restarts the box",  0LL,  0LL,  self,  "applyChanges"));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100049070;
  v35[3] = &unk_10018E608;
  id v36 = v28;
  id v30 = v28;
  [v29 setUpdateBlock:v35];
  [v29 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v26, "addObject:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v26));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v15 arrayByAddingObject:v31]);

  return v32;
}

- (void)applyChanges
{
  if (-[_TVSettingsInteralStoreDemoModeFacade applyChanges](self->_settingsFacade, "applyChanges"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v3 relaunch];
  }

  else
  {
    -[TVSettingsSDMConfigurationViewController discardChanges](self, "discardChanges");
  }

- (void)discardChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsSDMConfigurationViewController navigationController](self, "navigationController"));
  id v2 = [v3 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
}

@end