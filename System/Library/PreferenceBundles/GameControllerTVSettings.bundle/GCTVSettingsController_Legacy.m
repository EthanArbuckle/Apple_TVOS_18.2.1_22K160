@interface GCTVSettingsController_Legacy
- (GCController)device;
- (GCControllerSettings)settings;
- (GCTVSettingsControllerRepresentedObject_Legacy)representedObj;
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_bluetoothDevice;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_connectDevice:(id)a3;
- (void)_disconnectDevice:(id)a3;
- (void)_initializeGameController;
- (void)_unpairDevice:(id)a3;
- (void)dealloc;
- (void)didConnectToGameController:(id)a3;
- (void)didDisconnectToGameController:(id)a3;
- (void)filterSupportedApps;
- (void)setDevice:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)setRepresentedObj:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsController_Legacy

- (void)_initializeGameController
{
  if (!self->_gameControllerInitialized)
  {
    self->_gameControllerInitialized = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy _bluetoothDevice](self, "_bluetoothDevice"));
    id GCSettingsLogger = getGCSettingsLogger();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 serialNumber]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 macAddress]);
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "btDevice.serialNumber = %@, macAddress = %@, attempting to locate associated GCController instance.",  buf,  0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 macAddress]);
    v10 = (NSPredicate *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.extendedGamepad != nil && SELF.isComponentBased == true && (self.identifier CONTAINS %@ || self.identifier CONTAINS %@)",  v8,  v9));
    gcPredicate = self->_gcPredicate;
    self->_gcPredicate = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsControllerRepresentedObject_Legacy);
    representedObj = self->_representedObj;
    self->_representedObj = v12;

    v14 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    settingsCustomizedIdentifier = self->_settingsCustomizedIdentifier;
    self->_settingsCustomizedIdentifier = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 filteredArrayUsingPredicate:self->_gcPredicate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
    -[GCTVSettingsController_Legacy setDevice:](self, "setDevice:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:self selector:"didConnectToGameController:" name:GCControllerDidConnectNotification object:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:self selector:"didDisconnectToGameController:" name:GCControllerDidDisconnectNotification object:0];

    SEL v21 = NSSelectorFromString(@"__openXPC_and_CBApplicationDidBecomeActive__");
    if ((objc_opt_respondsToSelector(&OBJC_CLASS___GCController, v21) & 1) != 0) {
      +[GCController performSelector:](&OBJC_CLASS___GCController, "performSelector:", v21);
    }
  }

- (void)setDevice:(id)a3
{
  v5 = (GCController *)a3;
  p_device = &self->_device;
  device = self->_device;
  if (device != v5)
  {
    if (device)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCController identifier](device, "identifier"));
      +[GCControllerSettings unregisterSettingsCustomizedHandlerForController:forKey:]( &OBJC_CLASS___GCControllerSettings,  "unregisterSettingsCustomizedHandlerForController:forKey:",  v8,  self->_settingsCustomizedIdentifier);
    }

    if (v5)
    {
      -[GCTVSettingsControllerRepresentedObject_Legacy setDevice:](self->_representedObj, "setDevice:", v5);
      objc_storeStrong((id *)&self->_device, a3);
      v9 = (GCControllerSettings *)-[GCControllerSettings initForController:]( objc_alloc(&OBJC_CLASS___GCControllerSettings),  "initForController:",  v5);
      settings = self->_settings;
      self->_settings = v9;

      objc_initWeak(&location, self);
      objc_copyWeak(&v15, &location);
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[GCController identifier]( v5,  "identifier",  _NSConcreteStackBlock,  3221225472LL,  sub_F5C8,  &unk_4CED8));
      +[GCControllerSettings registerSettingsCustomizedHandler:forController:forKey:]( &OBJC_CLASS___GCControllerSettings,  "registerSettingsCustomizedHandler:forController:forKey:",  &v14,  v11,  self->_settingsCustomizedIdentifier);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    else
    {
      v12 = *p_device;
      *p_device = 0LL;

      v13 = self->_settings;
      self->_settings = 0LL;
    }

    -[GCTVSettingsController_Legacy filterSupportedApps](self, "filterSupportedApps");
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GCTVSettingsController_Legacy;
  -[GCTVSettingsController_Legacy viewDidLoad](&v3, "viewDidLoad");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCAnalytics instance](&OBJC_CLASS___GCAnalytics, "instance"));
  [v2 sendSettingsEnteredEvent];
}

- (id)loadSettingGroups
{
  id v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy _bluetoothDevice](self, "_bluetoothDevice"));
  v55 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"BluetoothConnectDeviceTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  self,  "_connectDevice:"));

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_FE84;
  v73[3] = &unk_4CAC8;
  id v7 = v3;
  id v74 = v7;
  [v6 setUpdateBlock:v73];
  -[NSMutableArray addObject:](v55, "addObject:", v6);
  uint64_t v8 = TSKLocString(@"BluetoothDisconnectDeviceTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_DESC");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  v11,  0LL,  0LL,  self,  "_disconnectDevice:"));

  objc_initWeak(&location, self);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_FECC;
  v69[3] = &unk_4CAF0;
  objc_copyWeak(&v71, &location);
  id v13 = v7;
  id v70 = v13;
  [v12 setUpdateBlock:v69];
  v49 = v13;
  -[NSMutableArray addObject:](v55, "addObject:", v12);
  uint64_t v14 = TSKLocString(@"BluetoothForgetDeviceTitle");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_DESC");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v15,  v17,  0LL,  0LL,  self,  "_unpairDevice:"));

  -[NSMutableArray addObject:](v55, "addObject:", v53);
  if (!self->_gameControllerInitialized) {
    -[GCTVSettingsController_Legacy _initializeGameController](self, "_initializeGameController");
  }
  id v18 = sub_EA9C(@"CUSTOMIZATION_TITLE");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = sub_EA9C(@"CUSTOMIZATION_DESC");
  SEL v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_FF68;
  v67[3] = &unk_4CBD0;
  objc_copyWeak(&v68, &location);
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v19,  v21,  0LL,  0LL,  v67));

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1001C;
  v65[3] = &unk_4CB18;
  objc_copyWeak(&v66, &location);
  [v52 setUpdateBlock:v65];
  v75 = v52;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v22));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy device](self, "device"));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 haptics]);
  BOOL v25 = v24 == 0LL;

  if (v25)
  {
    v54 = 0LL;
  }

  else
  {
    id v26 = sub_EA9C(@"FIND_CONTROLLER_TITLE");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = sub_EA9C(@"FIND_CONTROLLER_DESC_TVOS");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v27,  v29,  v30,  @"findingController",  v31,  "findController"));

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  &stru_4E2F8,  &stru_4E2F8));
    [v54 setLocalizedValueFormatter:v32];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_100E0;
    v63[3] = &unk_4CB18;
    objc_copyWeak(&v64, &location);
    [v54 setUpdateBlock:v63];
    -[NSMutableArray insertObject:atIndex:](v55, "insertObject:atIndex:", v54, 0LL);
    objc_destroyWeak(&v64);
  }

  objc_initWeak(&from, self->_representedObj);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_101B0;
  v59[3] = &unk_4CF28;
  objc_copyWeak(&v60, &location);
  objc_copyWeak(&v61, &from);
  v33 = objc_retainBlock(v59);
  id v34 = sub_EA9C(@"CUSTOMIZED_APPS_TITLE");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
  v37 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v35,  v36,  @"appsWithSettings",  v33));
  customizedAppsGroup = self->_customizedAppsGroup;
  self->_customizedAppsGroup = v37;

  id v39 = sub_EA9C(@"APP_CUSTOMIZATION_TITLE");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
  v42 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v40,  v41,  @"appsWithoutSettings",  v33));
  appCustomizationsGroup = self->_appCustomizationsGroup;
  self->_appCustomizationsGroup = v42;

  v44 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v55));
  bluetoothConnectionGroup = self->_bluetoothConnectionGroup;
  self->_bluetoothConnectionGroup = v44;

  v46 = self->_bluetoothConnectionGroup;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1087C;
  v56[3] = &unk_4CAF0;
  objc_copyWeak(&v58, &location);
  id v47 = v49;
  id v57 = v47;
  -[TSKSettingGroup setUpdateBlock:](v46, "setUpdateBlock:", v56);
  [v51 addObject:self->_bluetoothConnectionGroup];
  [v51 addObject:v50];
  [v51 addObject:self->_customizedAppsGroup];
  [v51 addObject:self->_appCustomizationsGroup];

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v71);
  objc_destroyWeak(&location);

  return v51;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy settingGroupAtIndex:](self, "settingGroupAtIndex:", a4));
  if (v7 == self->_bluetoothConnectionGroup)
  {
    double v9 = 25.0;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___GCTVSettingsController_Legacy;
    -[GCTVSettingsController_Legacy tableView:heightForFooterInSection:]( &v11,  "tableView:heightForFooterInSection:",  v6,  a4);
    double v9 = v8;
  }

  return v9;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_device)
  {
    id v6 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsController_Legacy settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
    id v7 = v6;
    if (v6 == self->_appCustomizationsGroup || v6 == self->_customizedAppsGroup)
    {
      double v9 = (UIViewController *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsController_Legacy settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v5));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController representedObject](v9, "representedObject"));
      id v14 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
      id v16 = (UIViewController *)[v14 initWithApplicationBundleIdentifier:v15];
      previewViewController = self->_previewViewController;
      self->_previewViewController = v16;
    }

    else
    {
      double v8 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCController tvset_controllerType](self->_device, "tvset_controllerType"));
      double v9 = self->_previewViewController;
      self->_previewViewController = (UIViewController *)v8;
    }
  }

  else
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___GCTVSettingsController_Legacy;
    id v10 = -[GCTVSettingsController_Legacy previewForItemAtIndexPath:](&v23, "previewForItemAtIndexPath:", v4);
    objc_super v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(v10);
    v12 = self->_previewViewController;
    self->_previewViewController = v11;
  }

  id v18 = self->_previewViewController;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v5));
    -[UIViewController setDescriptionText:](self->_previewViewController, "setDescriptionText:", v20);
  }

  SEL v21 = self->_previewViewController;

  return v21;
}

- (void)dealloc
{
  id GCSettingsLogger = getGCSettingsLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v9 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCController identifier](self->_device, "identifier"));
  +[GCControllerSettings unregisterSettingsCustomizedHandlerForController:forKey:]( &OBJC_CLASS___GCControllerSettings,  "unregisterSettingsCustomizedHandlerForController:forKey:",  v5,  self->_settingsCustomizedIdentifier);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy device](self, "device"));
  [v6 removeHapticEngines];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GCTVSettingsController_Legacy;
  -[GCTVSettingsController_Legacy dealloc](&v7, "dealloc");
}

- (id)_bluetoothDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy editingItem](self, "editingItem"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 representedObject]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = v3;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_3AA48();
    }
    id v5 = 0LL;
  }

  return v5;
}

- (void)_disconnectDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy _bluetoothDevice](self, "_bluetoothDevice", a3));
  id v5 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_CONFIRMATION_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_EAFC((uint64_t)@"%@", @"BLUETOOTH_DISCONNECT_DEVICE_MESSAGE");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v10,  1LL));
  id v12 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_CONFIRMATION_BUTTON");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10F50;
  v18[3] = &unk_4CC90;
  v18[4] = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  2LL,  v18));
  [v11 addAction:v14];
  id v15 = sub_EA9C(@"CANCEL");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));

  [v11 addAction:v17];
  -[GCTVSettingsController_Legacy presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_unpairDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy _bluetoothDevice](self, "_bluetoothDevice", a3));
  id v5 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_CONFIRMATION_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_EAFC((uint64_t)@"%@", @"BLUETOOTH_FORGET_DEVICE_MESSAGE");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v10,  1LL));
  id v12 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_CONFIRMATION_BUTTON");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_111A8;
  v19[3] = &unk_4CCB8;
  id v20 = v4;
  SEL v21 = self;
  id v14 = v4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  2LL,  v19));
  [v11 addAction:v15];
  id v16 = sub_EA9C(@"CANCEL");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  0LL));

  [v11 addAction:v18];
  -[GCTVSettingsController_Legacy presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_connectDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy _bluetoothDevice](self, "_bluetoothDevice"));
  [v4 connectDevice:v5];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy navigationController](self, "navigationController"));
  id v6 = [v7 popViewControllerAnimated:1];
}

- (void)filterSupportedApps
{
  if (self->_device)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:argumentArray:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:argumentArray:",  @"SELF.supportsControllerUserInteraction == true",  &__NSArray0__struct));
    [v3 setPredicate:v4];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v3;
    id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier", v26));

          if (v7)
          {
            v31 = v6;
            double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedGameControllers]);
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            id v9 = v8;
            id v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v10)
            {
              id v11 = v10;
              uint64_t v12 = *(void *)v35;
              while (2)
              {
                for (j = 0LL; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v35 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  id v14 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) objectForKey:@"ProfileName" ofClass:objc_opt_class(NSString)];
                  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
                  unsigned __int8 v16 = [v15 isEqualToString:@"ExtendedGamepad"];

                  if ((v16 & 1) != 0)
                  {

                    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GCController identifier](self->_device, "identifier"));
                    id v18 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
                    unsigned int v19 = +[GCControllerSettings settingsCustomizedForController:forBundleIdentifier:]( &OBJC_CLASS___GCControllerSettings,  "settingsCustomizedForController:forBundleIdentifier:",  v17,  v18);

                    if (v19) {
                      id v20 = v27;
                    }
                    else {
                      id v20 = v26;
                    }
                    [v20 addObject:v31];
                    goto LABEL_21;
                  }
                }

                id v11 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }

LABEL_21:
          }
        }

        id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }

      while (v32);
    }

    [v27 sortUsingComparator:&stru_4CF68];
    [v26 sortUsingComparator:&stru_4CF68];
    SEL v21 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    [v21 setAppsWithSettings:v27];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    [v22 setAppsWithoutSettings:v26];
  }

  else
  {
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    [v24 setAppsWithSettings:v23];

    id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController_Legacy representedObj](self, "representedObj"));
    [v25 setAppsWithoutSettings:v33];
  }

- (void)didConnectToGameController:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_11758;
  block[3] = &unk_4CAA0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)didDisconnectToGameController:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_11850;
  block[3] = &unk_4CAA0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (TSKSettingItem)editingItem
{
  return self->_editingItem;
}

- (void)setEditingItem:(id)a3
{
}

- (TSKSettingItemEditingControllerDelegate)editingDelegate
{
  return (TSKSettingItemEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (GCTVSettingsControllerRepresentedObject_Legacy)representedObj
{
  return self->_representedObj;
}

- (void)setRepresentedObj:(id)a3
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

- (void).cxx_destruct
{
}

@end