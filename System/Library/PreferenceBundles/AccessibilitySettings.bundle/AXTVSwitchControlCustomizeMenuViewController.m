@interface AXTVSwitchControlCustomizeMenuViewController
- (id)_menuItemsGroupWithTitle:(id)a3 menuItemsGetterKey:(id)a4;
- (id)loadSettingGroups;
- (void)_cellClicked:(id)a3;
@end

@implementation AXTVSwitchControlCustomizeMenuViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_TOP_LEVEL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlCustomizeMenuViewController _menuItemsGroupWithTitle:menuItemsGetterKey:]( self,  "_menuItemsGroupWithTitle:menuItemsGetterKey:",  v5,  @"switchControlTopLevelMenuItems"));
  [v3 axSafelyAddObject:v6];

  uint64_t v7 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_DEVICE");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlCustomizeMenuViewController _menuItemsGroupWithTitle:menuItemsGetterKey:]( self,  "_menuItemsGroupWithTitle:menuItemsGetterKey:",  v8,  @"switchControlDeviceMenuItems"));
  [v3 axSafelyAddObject:v9];

  uint64_t v10 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_SETTINGS");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlCustomizeMenuViewController _menuItemsGroupWithTitle:menuItemsGetterKey:]( self,  "_menuItemsGroupWithTitle:menuItemsGetterKey:",  v11,  @"switchControlSettingsMenuItems"));
  [v3 axSafelyAddObject:v12];

  uint64_t v13 = AXParameterizedLocalizedString(2LL, @"CUSTOMIZE_MENU_MEDIA_CONTROLS");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlCustomizeMenuViewController _menuItemsGroupWithTitle:menuItemsGetterKey:]( self,  "_menuItemsGroupWithTitle:menuItemsGetterKey:",  v14,  @"switchControlMediaControlsMenuItems"));
  [v3 axSafelyAddObject:v15];

  return v3;
}

- (id)_menuItemsGroupWithTitle:(id)a3 menuItemsGetterKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[TSKSettingGroup alloc] initWithTitle:v5];
  v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v28 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:v6]);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    id v23 = v7;
    id v24 = v5;
    v12 = 0LL;
    uint64_t v13 = *(void *)v30;
    uint64_t v14 = AXSSwitchControlMenuItemTypeKey;
    do
    {
      v15 = 0LL;
      v16 = v12;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v15), "mutableCopy", v23, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v14]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([@"CUSTOMIZE_MENU_" stringByAppendingString:v18]);
        uint64_t v20 = AXParameterizedLocalizedString(2LL, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        [v17 setObject:v28 forKeyedSubscript:@"updatePrefKey"];
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v21,  0LL,  v17,  0LL,  self,  "_cellClicked:"));

        [v12 setUpdateBlock:&stru_65610];
        -[NSMutableArray addObject:](v27, "addObject:", v12);

        v15 = (char *)v15 + 1;
        v16 = v12;
      }

      while (v11 != v15);
      id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v11);

    id v7 = v23;
    id v5 = v24;
  }

  [v7 setSettingItems:v27];
  return v7;
}

- (void)_cellClicked:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = AXSSwitchControlMenuItemEnabledKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AXSSwitchControlMenuItemEnabledKey]);
  unsigned int v8 = [v7 BOOLValue];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8 ^ 1));
  [v5 setObject:v9 forKeyedSubscript:v6];

  +[TSKSettingItem setValue:forSettingItem:](&OBJC_CLASS___TSKSettingItem, "setValue:forSettingItem:", v5, v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"updatePrefKey"]);
  id v11 = [v5 mutableCopy];

  [v11 setObject:0 forKeyedSubscript:@"updatePrefKey"];
  v12 = &AFPreferencesAssistantEnabled_ptr;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKey:v10]);
  id v15 = [v14 mutableCopy];

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    v28 = v10;
    __int128 v29 = self;
    id v30 = v4;
    uint64_t v19 = *(void *)v32;
    uint64_t v20 = AXSSwitchControlMenuItemTypeKey;
    while (2)
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v20]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);
        unsigned int v25 = [v23 isEqualToString:v24];

        if (v25)
        {
          id v26 = v22;
          goto LABEL_11;
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    id v26 = 0LL;
LABEL_11:
    self = v29;
    id v4 = v30;
    id v10 = v28;
    v12 = &AFPreferencesAssistantEnabled_ptr;
  }

  else
  {
    id v26 = 0LL;
  }

  objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v16, "indexOfObject:", v26), v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v12[247] sharedInstance]);
  [v27 setValue:v16 forKey:v10];

  -[AXTVSwitchControlCustomizeMenuViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

@end