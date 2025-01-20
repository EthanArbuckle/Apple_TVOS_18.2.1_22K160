@interface GCTVSettingsCustomizationController
- (BOOL)isCustomizingDefaultSettings;
- (GCController)device;
- (GCControllerSettings)settings;
- (GCTVSettingsCustomizationController)init;
- (GCTVSettingsCustomizationControllerRepresentedObject_Legacy)representedObject;
- (NSString)applicationName;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setApplicationName:(id)a3;
- (void)setDevice:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setSettings:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsCustomizationController

- (GCTVSettingsCustomizationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GCTVSettingsCustomizationController;
  v2 = -[GCTVSettingsCustomizationController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsCustomizationControllerRepresentedObject_Legacy);
    representedObject = v2->_representedObject;
    v2->_representedObject = v3;

    -[GCTVSettingsCustomizationControllerRepresentedObject_Legacy setCustomizatonController:]( v2->_representedObject,  "setCustomizatonController:",  v2);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    buttonsGroups = v2->_buttonsGroups;
    v2->_buttonsGroups = (NSMutableArray *)v5;
  }

  return v2;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GCTVSettingsCustomizationController;
  -[GCTVSettingsCustomizationController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  uint64_t v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsCustomizationController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GCControllerElement);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
      [v11 setElement:v18 settings:self->_settings showRemappedIcon:1];
    }

    else
    {
      [v11 setElement:0 settings:self->_settings showRemappedIcon:0];
    }

    [v11 settingItem:v14 didUpdateMetadataWithGroup:v12];
    [v14 setDirty:0];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_3AC04((uint64_t)v6);
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsCustomizationController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  a4));
  if (v7 == self->_customizationToggleGroup)
  {
    double v9 = 25.0;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___GCTVSettingsCustomizationController;
    -[GCTVSettingsCustomizationController tableView:heightForFooterInSection:]( &v11,  "tableView:heightForFooterInSection:",  v6,  a4);
    double v9 = v8;
  }

  return v9;
}

- (void)setDevice:(id)a3
{
  id v30 = a3;
  p_device = &self->_device;
  objc_storeStrong((id *)&self->_device, a3);
  if (v30)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](*p_device, "physicalInputProfile"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _topLevelButtons]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:&stru_4D0F8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v10 setConfigurableControllerButtons:v9];

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configurableControllerButtons]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.remappable == YES"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filteredArrayUsingPredicate:v13]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v15 setConfigurableControllerButtons:v14];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](*p_device, "physicalInputProfile"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _topLevelDirectionPads]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingComparator:&stru_4D138]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v20 setConfigurableControllerDpads:v19];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 configurableControllerDpads]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.remappable == YES"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 filteredArrayUsingPredicate:v23]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v25 setConfigurableControllerDpads:v24];
  }

  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v27 setConfigurableControllerButtons:v26];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v29 setConfigurableControllerSystemButtons:v28];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
    [v22 setConfigurableControllerDpads:v21];
  }
}

- (BOOL)isCustomizingDefaultSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settings](self, "settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:kGCSettingsDefaultBundleIdentifier];

  return v4;
}

- (id)loadSettingGroups
{
  id v3 = sub_EA9C(@"CUSTOMIZATION_TITLE");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settings](self, "settings"));
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v4,  0LL,  v5,  @"customizationsEnabled",  &stru_4E2F8,  &stru_4E2F8));

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_16C7C;
  v64[3] = &unk_4CAF0;
  objc_copyWeak(&v65, &location);
  v64[4] = self;
  [v51 setUpdateBlock:v64];
  v71 = v51;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
  id v7 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
  customizationToggleGroup = self->_customizationToggleGroup;
  self->_customizationToggleGroup = v7;

  id v9 = sub_EA9C(@"RUMBLE_TITLE");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settings](self, "settings"));
  uint64_t v12 = TSKLocString(@"SettingsON");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = TSKLocString(@"SettingsOFF");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v10,  0LL,  v11,  @"hapticsEnabled",  v13,  v15));

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_16DC8;
  v62[3] = &unk_4CAF0;
  objc_copyWeak(&v63, &location);
  v62[4] = self;
  [v52 setUpdateBlock:v62];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](self->_device, "physicalInputProfile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:GCInputButtonShare]);
  if (v17)
  {
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](self->_device, "physicalInputProfile"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:GCInputButtonOptions]);
    BOOL v20 = v19 == 0LL;

    if (v20) {
      goto LABEL_6;
    }
  }

  id v21 = sub_EA9C(@"VIDEO_RECORDING_TITLE");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settings](self, "settings"));
  uint64_t v24 = TSKLocString(@"SettingsON");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = TSKLocString(@"SettingsOFF");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v22,  0LL,  v23,  @"videoRecordingEnabled",  v25,  v27));

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_16F1C;
  v60[3] = &unk_4CAF0;
  objc_copyWeak(&v61, &location);
  v60[4] = self;
  [v53 setUpdateBlock:v60];
  objc_destroyWeak(&v61);
  if (v53)
  {
    v70[0] = v52;
    v70[1] = v53;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
    goto LABEL_7;
  }

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    uint64_t v5 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCController tvset_controllerType](self->_device, "tvset_controllerType"));
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v5;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsCustomizationController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
  if (-[NSMutableArray containsObject:](self->_buttonsGroups, "containsObject:", v7))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvset_assetName"));
    -[GCTVSettingsPreviewViewController setButtonName:](self->_appPreviewViewController, "setButtonName:", v10);
  }

  else
  {
    -[GCTVSettingsPreviewViewController setButtonName:](self->_appPreviewViewController, "setButtonName:", 0LL);
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[GCTVSettingsPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v11);
  uint64_t v12 = self->_appPreviewViewController;

  return v12;
}

- (void)dealloc
{
  id GCSettingsLogger = getGCSettingsLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GCTVSettingsCustomizationController;
  -[GCTVSettingsCustomizationController dealloc](&v5, "dealloc");
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (GCController)device
{
  return self->_device;
}

- (GCControllerSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (GCTVSettingsCustomizationControllerRepresentedObject_Legacy)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end