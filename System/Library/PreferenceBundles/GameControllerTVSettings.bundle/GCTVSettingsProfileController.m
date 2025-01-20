@interface GCTVSettingsProfileController
- (GCTVSettingsProfileController)init;
- (GCTVSettingsProfileController)initWithProfileRepresentedObj:(id)a3 prefsStoreObj:(id)a4;
- (GCTVSettingsProfileControllerRepresentedObject)representedObject;
- (TSKSettingItemEditingController)nameViewController;
- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore;
- (id)_nameViewControllerForItem:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setNameViewController:(id)a3;
- (void)setPrefsStore:(id)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
- (void)willResignActive;
@end

@implementation GCTVSettingsProfileController

- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore
{
  return (_TtC24GameControllerTVSettings19GCSPreferencesStore *)self->_prefsStoreObj;
}

- (GCTVSettingsProfileController)init
{
  v3.receiver = self;
  v3.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
  return -[GCTVSettingsProfileController init](&v3, "init");
}

- (GCTVSettingsProfileController)initWithProfileRepresentedObj:(id)a3 prefsStoreObj:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
  v9 = -[GCTVSettingsProfileController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_prefsStoreObj, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 controller]);
    controller = v10->_controller;
    v10->_controller = (GCSController *)v11;

    objc_storeStrong((id *)&v10->_representedObject, a3);
    -[GCTVSettingsProfileControllerRepresentedObject setCustomizatonController:]( v10->_representedObject,  "setCustomizatonController:",  v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    buttonsGroups = v10->_buttonsGroups;
    v10->_buttonsGroups = (NSMutableArray *)v13;
  }

  return v10;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
  -[GCTVSettingsProfileController viewDidLoad](&v9, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"willResignActive" name:UIApplicationWillResignActiveNotification object:0];
}

- (void)willResignActive
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
  [v2 save];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
  [v5 save];

  v6.receiver = self;
  v6.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
  -[GCTVSettingsProfileController willMoveToParentViewController:](&v6, "willMoveToParentViewController:", v4);
}

- (id)_nameViewControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  id v6 = sub_EA9C(@"PROFILE_NAME_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setHeaderText:v7];

  id v8 = sub_EA9C(@"PROFILE_NAME_DESC");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 setMessageText:v9];

  [v5 setEditingDelegate:self];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedValueForSettingItem:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedValueForSettingItem:",  v4));

  [v5 setInitialText:v10];
  -[GCTVSettingsProfileController setNameViewController:](self, "setNameViewController:", v5);

  return v5;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController nameViewController](self, "nameViewController"));

  if (v11 == v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    [v12 setName:v9];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController navigationController](self, "navigationController"));
    id v14 = [v13 popToViewController:self animated:1];
  }

  else
  {
    v15.receiver = self;
    v15.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
    -[GCTVSettingsProfileController editingController:didProvideValue:forSettingItem:]( &v15,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  id v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
  id v14 = v13;
  if (v13)
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GCSElement);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject elementMappings]( self->_representedObject,  "elementMappings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v20]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject allElements]( self->_representedObject,  "allElements"));
      [v11 setElementMapping:v21 elements:v22 showRemappedIcon:1];
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject allElements]( self->_representedObject,  "allElements"));
      [v11 setElementMapping:0 elements:v18 showRemappedIcon:0];
    }

    [v11 settingItem:v14 didUpdateMetadataWithGroup:v12];
    [v14 setDirty:0];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_3A814((uint64_t)v6);
  }

  return v11;
}

- (id)loadSettingGroups
{
  id v3 = sub_EA9C(@"PROFILE_NAME_LINE_ITEM_TITLE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v4,  0LL,  v5,  @"name",  &__NSArray0__struct));

  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_BCEC;
  v77[3] = &unk_4CBD0;
  v59 = &v78;
  objc_copyWeak(&v78, &location);
  [v63 setChildControllerBlock:v77];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_BD40;
  v75[3] = &unk_4CB18;
  v60 = &v76;
  objc_copyWeak(&v76, &location);
  [v63 setUpdateBlock:v75];
  [v63 setShouldPresentChildController:0];
  v83 = v63;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v83, 1LL));
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));

  v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[GCSController supportsHaptics](self->_controller, "supportsHaptics"))
  {
    id v7 = sub_EA9C(@"RUMBLE_TITLE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 availableVibrationValues]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v8,  0LL,  v9,  @"hapticStrength",  v11));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 vibrationFormatter]);
    [v12 setLocalizedValueFormatter:v14];

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_BDA0;
    v73[3] = &unk_4CB18;
    objc_copyWeak(&v74, &location);
    [v12 setUpdateBlock:v73];
    -[NSMutableArray addObject:](v64, "addObject:", v12);
    objc_destroyWeak(&v74);
  }

  if (-[GCSController supportsLight](self->_controller, "supportsLight"))
  {
    id v15 = sub_EA9C(@"LIGHTBAR_COLOR_TITLE");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 availableColorValues]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v16,  0LL,  v17,  @"lightbarColor",  v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 colorFormatter]);
    [v20 setLocalizedValueFormatter:v22];

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_BE2C;
    v71[3] = &unk_4CB18;
    objc_copyWeak(&v72, &location);
    [v20 setUpdateBlock:v71];
    -[NSMutableArray addObject:](v64, "addObject:", v20);
    objc_destroyWeak(&v72);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController shareButton](self->_controller, "shareButton"));

  if (v23)
  {
    id v24 = sub_EA9C(@"VIDEO_RECORDING_TITLE");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    uint64_t v27 = TSKLocString(@"SettingsON");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = TSKLocString(@"SettingsOFF");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v25,  0LL,  v26,  @"videoRecordingEnabled",  v28,  v30));

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_BEB8;
    v69[3] = &unk_4CB18;
    objc_copyWeak(&v70, &location);
    [v61 setUpdateBlock:v69];
    -[NSMutableArray addObject:](v64, "addObject:", v61);
    objc_destroyWeak(&v70);
  }

  else
  {
    v61 = 0LL;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v64));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_BF58;
  v67[3] = &unk_4CDD0;
  v58 = &v68;
  objc_copyWeak(&v68, &location);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v32,  @"configurableControllerButtons",  v67));

  [v33 setAutoHide:1];
  [v33 setComparesArrayDeeply:0];
  -[NSMutableArray addObject:](self->_buttonsGroups, "addObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_C2B8;
  v65[3] = &unk_4CDD0;
  objc_copyWeak(&v66, &location);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v34,  @"configurableControllerDpads",  v65));

  [v35 setAutoHide:1];
  [v35 setComparesArrayDeeply:0];
  -[NSMutableArray addObject:](self->_buttonsGroups, "addObject:", v35);
  v82[0] = v62;
  v82[1] = v31;
  v82[2] = v33;
  v82[3] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 4LL));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v36));

  id v38 = objc_loadWeakRetained(&location);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 representedObject]);
  unsigned int v40 = [v39 customizable];

  if (v40)
  {
    id v41 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_DESC");
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    id v43 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_TITLE");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject", &v68, &v78, &v76));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v44,  v42,  0LL,  0LL,  v45,  "promptRestoreToDefaults"));

    v81 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v47));

    [v37 addObject:v48];
    id v49 = sub_EA9C(@"TV_DELETE_PROFILE_DESC");
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    id v51 = sub_EA9C(@"TV_DELETE_PROFILE_TITLE");
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController representedObject](self, "representedObject"));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v52,  v50,  0LL,  0LL,  v53,  "promptDeleteProfile"));

    v80 = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v80, 1LL));
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v55));

    [v37 addObject:v56];
  }

  objc_destroyWeak(&v66);
  objc_destroyWeak(v58);

  objc_destroyWeak(v60);
  objc_destroyWeak(v59);

  objc_destroyWeak(&location);
  return v37;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    id v5 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCSController tvset_controllerType](self->_controller, "tvset_controllerType"));
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v5;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
  if (-[NSMutableArray containsObject:](self->_buttonsGroups, "containsObject:", v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvset_assetName"));
    -[GCTVSettingsPreviewViewController setButtonName:](self->_appPreviewViewController, "setButtonName:", v10);
  }

  else
  {
    -[GCTVSettingsPreviewViewController setButtonName:](self->_appPreviewViewController, "setButtonName:", 0LL);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[GCTVSettingsPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v11);
  v12 = self->_appPreviewViewController;

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
  v5.super_class = &OBJC_CLASS___GCTVSettingsProfileController;
  -[GCTVSettingsProfileController dealloc](&v5, "dealloc");
}

- (GCTVSettingsProfileControllerRepresentedObject)representedObject
{
  return self->_representedObject;
}

- (void)setPrefsStore:(id)a3
{
}

- (TSKSettingItemEditingController)nameViewController
{
  return (TSKSettingItemEditingController *)objc_loadWeakRetained((id *)&self->_nameViewController);
}

- (void)setNameViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end