@interface GCTVSettingsController
- (BOOL)shouldShowCopilotOptions;
- (GCController)device;
- (GCSController)controller;
- (GCTVSettingsControllerRepresentedObject)representedObj;
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingController)nameViewController;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_bluetoothDevice;
- (id)_nameViewControllerForItem:(id)a3;
- (id)availableCopilotControllers;
- (id)availableProfileValuesAndIncludeNil:(BOOL)a3;
- (id)gameBuddyFormatter;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_connectDevice:(id)a3;
- (void)_disconnectDevice:(id)a3;
- (void)_initializeGameController;
- (void)_unpairDevice:(id)a3;
- (void)dealloc;
- (void)didConnectToGameController:(id)a3;
- (void)didDisconnectToGameController:(id)a3;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setController:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)setNameViewController:(id)a3;
- (void)setPrefsStore:(id)a3;
- (void)setRepresentedObj:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsController

- (id)availableCopilotControllers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore unfusedFusableControllers](self->_prefsStore, "unfusedFusableControllers"));
  id v4 = [v3 mutableCopy];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 wrappedCopilotFusedController]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 firstObject]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 copilot]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___GCSController);
  LOBYTE(v6) = objc_opt_isKindOfClass(v8, v9);

  if ((v6 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 copilot]);
    [v4 addObject:v10];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController controller](self, "controller"));
  [v4 removeObject:v11];

  v12 = objc_opt_new(&OBJC_CLASS___GCSNilCopilot);
  [v4 addObject:v12];

  return v4;
}

- (id)gameBuddyFormatter
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController availableCopilotControllers](self, "availableCopilotControllers"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___GCSController);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 name]);
        }

        else
        {
          id v12 = sub_EA9C(@"COPILOT_UNSET");
          uint64_t v11 = objc_claimAutoreleasedReturnValue(v12);
        }

        v13 = (void *)v11;
        -[NSMutableArray addObject:](v3, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  id v14 = [[TSKMappingFormatter alloc] initWithInputs:v4 outputs:v3];

  return v14;
}

- (id)availableProfileValuesAndIncludeNil:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore profiles](self->_prefsStore, "profiles"));
  id v5 = [v4 mutableCopy];

  if (v3)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___GCSNilProfile);
    [v5 addObject:v6];
  }

  return v5;
}

- (void)setDevice:(id)a3
{
  id v4 = (GCController *)a3;
  id v5 = v4;
  device = self->_device;
  if (device != v4)
  {
    v8 = v4;
    if (v4)
    {
      -[GCTVSettingsControllerRepresentedObject setDevice:](self->_representedObj, "setDevice:", v4);
      uint64_t v7 = v8;
      device = self->_device;
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    self->_device = v7;

    id v5 = v8;
  }
}

- (void)setController:(id)a3
{
  id v4 = (GCSController *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](v4, "productCategoryKey"));
  unsigned int v6 = [v5 isEqual:@"PRODUCT_CATEGORY_NINTENDO_JOY_CON"];

  if (v6)
  {

    id v4 = 0LL;
  }

  id GCSettingsLogger = getGCSettingsLogger();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Set controller %@", (uint8_t *)&v14, 0xCu);
  }

  controller = self->_controller;
  if (controller != v4)
  {
    if (v4)
    {
      -[GCTVSettingsControllerRepresentedObject setController:](self->_representedObj, "setController:", v4);
      objc_storeStrong((id *)&self->_controller, v4);
    }

    else
    {
      self->_controller = 0LL;
    }

    -[GCTVSettingsControllerRepresentedObject filterSupportedApps](self->_representedObj, "filterSupportedApps");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore games](self->_prefsStore, "games"));
    [v10 updateGames:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore copilotFusedControllers](self->_prefsStore, "copilotFusedControllers"));
    [v12 updateCopilotFusedControllers:v13];

    -[GCTVSettingsController reloadSettings](self, "reloadSettings");
  }
}

- (void)_initializeGameController
{
  if (!self->_gameControllerInitialized)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS____TtC24GameControllerTVSettings19GCSPreferencesStore);
    prefsStore = self->_prefsStore;
    self->_prefsStore = v3;

    self->_gameControllerInitialized = 1;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController _bluetoothDevice](self, "_bluetoothDevice"));
    id GCSettingsLogger = getGCSettingsLogger();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 serialNumber]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 macAddress]);
      *(_DWORD *)buf = 138412546;
      v30 = v8;
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "btDevice.serialNumber = %@, macAddress = %@, attempting to locate associated GCController instance.",  buf,  0x16u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 macAddress]);
    id v12 = (NSPredicate *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.extendedGamepad != nil && SELF.isComponentBased == true && (self.identifier CONTAINS %@ || self.identifier CONTAINS %@)",  v10,  v11));
    gcPredicate = self->_gcPredicate;
    self->_gcPredicate = v12;

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 macAddress]);
    __int128 v16 = (NSPredicate *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(self.persistentIdentifier CONTAINS %@ || self.persistentIdentifier CONTAINS %@)",  v14,  v15));
    gcsPredicate = self->_gcsPredicate;
    self->_gcsPredicate = v16;

    __int128 v18 = -[GCTVSettingsControllerRepresentedObject initWithPrefsStore:]( objc_alloc(&OBJC_CLASS___GCTVSettingsControllerRepresentedObject),  "initWithPrefsStore:",  self->_prefsStore);
    representedObj = self->_representedObj;
    self->_representedObj = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:self selector:"didConnectToGameController:" name:GCControllerDidConnectNotification object:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:self selector:"didDisconnectToGameController:" name:GCControllerDidDisconnectNotification object:0];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 filteredArrayUsingPredicate:self->_gcPredicate]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
    -[GCTVSettingsController setDevice:](self, "setDevice:", v24);

    -[GCSPreferencesStore addObserver:forKeyPath:options:context:]( self->_prefsStore,  "addObserver:forKeyPath:options:context:",  self,  @"controllers",  5LL,  0LL);
    -[GCSPreferencesStore addObserver:forKeyPath:options:context:]( self->_prefsStore,  "addObserver:forKeyPath:options:context:",  self,  @"games",  5LL,  0LL);
    -[GCSPreferencesStore addObserver:forKeyPath:options:context:]( self->_prefsStore,  "addObserver:forKeyPath:options:context:",  self,  @"profiles",  5LL,  0LL);
    -[GCSPreferencesStore addObserver:forKeyPath:options:context:]( self->_prefsStore,  "addObserver:forKeyPath:options:context:",  self,  @"copilotFusedControllers",  5LL,  0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore allControllers](self->_prefsStore, "allControllers"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 filteredArrayUsingPredicate:self->_gcsPredicate]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 firstObject]);
    -[GCTVSettingsController setController:](self, "setController:", v27);

    SEL v28 = NSSelectorFromString(@"__openXPC_and_CBApplicationDidBecomeActive__");
    if ((objc_opt_respondsToSelector(&OBJC_CLASS___GCController, v28) & 1) != 0) {
      +[GCController performSelector:](&OBJC_CLASS___GCController, "performSelector:", v28);
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = (_TtC24GameControllerTVSettings19GCSPreferencesStore *)a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"controllers"] && self->_prefsStore == v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore allControllers](self->_prefsStore, "allControllers"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:self->_gcsPredicate]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
      -[GCTVSettingsController setController:](self, "setController:", v17);
    }

    goto LABEL_16;
  }

  if ([v10 isEqualToString:@"games"] && self->_prefsStore == v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v13, v18) & 1) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }

    id v19 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    [v20 updateGames:v19];

LABEL_15:
    goto LABEL_16;
  }

  if ([v10 isEqualToString:@"profiles"] && self->_prefsStore == v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore profiles](self->_prefsStore, "profiles"));
    [v21 updateProfiles:v22];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore games](self->_prefsStore, "games"));
    [v13 updateGames:v20];
    goto LABEL_15;
  }

  if ([v10 isEqualToString:@"copilotFusedControllers"] && self->_prefsStore == v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore copilotFusedControllers](self->_prefsStore, "copilotFusedControllers"));
    [v23 updateCopilotFusedControllers:v24];

    -[GCTVSettingsController reloadSettings](self, "reloadSettings");
  }

  else
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
    -[GCTVSettingsController observeValueForKeyPath:ofObject:change:context:]( &v25,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
  -[GCTVSettingsController viewDidLoad](&v3, "viewDidLoad");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCAnalytics instance](&OBJC_CLASS___GCAnalytics, "instance"));
  [v2 sendSettingsEnteredEvent];
}

- (id)loadSettingGroups
{
  id v73 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController _bluetoothDevice](self, "_bluetoothDevice"));
  v74 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"BluetoothConnectDeviceTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  self,  "_connectDevice:"));

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = sub_778C;
  v94[3] = &unk_4CAC8;
  id v7 = v3;
  id v95 = v7;
  [v6 setUpdateBlock:v94];
  -[NSMutableArray addObject:](v74, "addObject:", v6);
  uint64_t v8 = TSKLocString(@"BluetoothDisconnectDeviceTitle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_DESC");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  v11,  0LL,  0LL,  self,  "_disconnectDevice:"));

  objc_initWeak(&location, self);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472LL;
  v90[2] = sub_77D4;
  v90[3] = &unk_4CAF0;
  objc_copyWeak(&v92, &location);
  id v13 = v7;
  id v91 = v13;
  [v12 setUpdateBlock:v90];
  v68 = v13;
  -[NSMutableArray addObject:](v74, "addObject:", v12);
  uint64_t v14 = TSKLocString(@"BluetoothForgetDeviceTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_DESC");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v15,  v17,  0LL,  0LL,  self,  "_unpairDevice:"));

  -[NSMutableArray addObject:](v74, "addObject:", v71);
  if (!self->_gameControllerInitialized) {
    -[GCTVSettingsController _initializeGameController](self, "_initializeGameController");
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController device](self, "device"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 haptics]);
  BOOL v20 = v19 == 0LL;

  if (v20)
  {
    v72 = 0LL;
  }

  else
  {
    id v21 = sub_EA9C(@"FIND_CONTROLLER_TITLE");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = sub_EA9C(@"FIND_CONTROLLER_DESC_TVOS");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v22,  v24,  v25,  @"findingController",  v26,  "findController"));

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  &stru_4E2F8,  &stru_4E2F8));
    [v72 setLocalizedValueFormatter:v27];

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = sub_7870;
    v88[3] = &unk_4CB18;
    objc_copyWeak(&v89, &location);
    [v72 setUpdateBlock:v88];
    -[NSMutableArray insertObject:atIndex:](v74, "insertObject:atIndex:", v72, 0LL);
    objc_destroyWeak(&v89);
  }

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_7940;
  v86[3] = &unk_4CBA8;
  objc_copyWeak(&v87, &location);
  v70 = objc_retainBlock(v86);
  id v28 = sub_EA9C(@"PROFILE_LIST_TITLE");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  __int16 v31 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v29,  v30,  @"profiles",  v70));
  profilesGroup = self->_profilesGroup;
  self->_profilesGroup = v31;

  -[TSKListSettingGroup setComparesArrayDeeply:](self->_profilesGroup, "setComparesArrayDeeply:", 1LL);
  id v33 = sub_EA9C(@"PROFILE_ADD");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  id v35 = sub_EA9C(@"PROFILE_LIST_DESC");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v34,  v36,  v37,  @"createNewProfileName",  0LL,  0LL));

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_7B94;
  v84[3] = &unk_4CBD0;
  objc_copyWeak(&v85, &location);
  [v38 setChildControllerBlock:v84];
  [v38 setShouldPresentChildController:0];
  [v38 setUpdateBlock:&stru_4CBF0];
  v96 = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v96, 1LL));
  v40 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v39));
  newProfileGroup = self->_newProfileGroup;
  self->_newProfileGroup = v40;

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_7BF4;
  v82[3] = &unk_4CC40;
  objc_copyWeak(&v83, &location);
  v42 = objc_retainBlock(v82);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  v44 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v43,  @"wrappedDefaultGame",  v42));
  defaultAppGroup = self->_defaultAppGroup;
  self->_defaultAppGroup = v44;

  -[TSKListSettingGroup setComparesArrayDeeply:](self->_defaultAppGroup, "setComparesArrayDeeply:", 1LL);
  id v46 = sub_EA9C(@"CUSTOMIZED_APPS_TITLE");
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  v49 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v47,  v48,  @"wrappedGamesWithProfile",  v42));
  customizedAppsGroup = self->_customizedAppsGroup;
  self->_customizedAppsGroup = v49;

  -[TSKListSettingGroup setComparesArrayDeeply:](self->_customizedAppsGroup, "setComparesArrayDeeply:", 1LL);
  id v51 = sub_EA9C(@"APP_CUSTOMIZATION_TITLE");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  v54 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v52,  v53,  @"wrappedGamesWithoutProfile",  v42));
  appCustomizationsGroup = self->_appCustomizationsGroup;
  self->_appCustomizationsGroup = v54;

  -[TSKListSettingGroup setComparesArrayDeeply:](self->_appCustomizationsGroup, "setComparesArrayDeeply:", 1LL);
  v56 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v74));
  bluetoothConnectionGroup = self->_bluetoothConnectionGroup;
  self->_bluetoothConnectionGroup = v56;

  v58 = self->_bluetoothConnectionGroup;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_8138;
  v79[3] = &unk_4CAF0;
  objc_copyWeak(&v81, &location);
  id v69 = v68;
  id v80 = v69;
  -[TSKSettingGroup setUpdateBlock:](v58, "setUpdateBlock:", v79);
  [v73 addObject:self->_bluetoothConnectionGroup];
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController controller](self, "controller"));
  LOBYTE(v58) = v59 == 0LL;

  if ((v58 & 1) == 0)
  {
    [v73 addObject:self->_defaultAppGroup];
    [v73 addObject:self->_profilesGroup];
    [v73 addObject:self->_newProfileGroup];
    [v73 addObject:self->_customizedAppsGroup];
    [v73 addObject:self->_appCustomizationsGroup];
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsControllerRepresentedObject controller](self->_representedObj, "controller"));
  unsigned int v61 = [v60 supportsBuddyController];

  if (v61)
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_8234;
    v77[3] = &unk_4CC68;
    objc_copyWeak(&v78, &location);
    v77[4] = self;
    v62 = objc_retainBlock(v77);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
    v64 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v63,  @"wrappedCopilotFusedController",  v62));
    gameBuddyGroup = self->_gameBuddyGroup;
    self->_gameBuddyGroup = v64;

    v66 = self->_gameBuddyGroup;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_84A0;
    v75[3] = &unk_4CB18;
    objc_copyWeak(&v76, &location);
    -[TSKSettingGroup setUpdateBlock:](v66, "setUpdateBlock:", v75);
    [v73 addObject:self->_gameBuddyGroup];
    objc_destroyWeak(&v76);

    objc_destroyWeak(&v78);
  }

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&v92);
  objc_destroyWeak(&location);

  return v73;
}

- (BOOL)shouldShowCopilotOptions
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController representedObj](self, "representedObj"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 wrappedCopilotFusedController]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCSPreferencesStore unfusedFusableControllers](self->_prefsStore, "unfusedFusableControllers"));
  if ((unint64_t)[v6 count] > 1)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 copilot]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___GCSController);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [v5 controllerIsCopilot];
    }
  }

  return v9;
}

- (void)dealloc
{
  id GCSettingsLogger = getGCSettingsLogger();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController device](self, "device"));
  [v5 removeHapticEngines];

  prefsStore = self->_prefsStore;
  if (prefsStore)
  {
    -[GCSPreferencesStore removeObserver:forKeyPath:context:]( prefsStore,  "removeObserver:forKeyPath:context:",  self,  @"controllers",  0LL);
    -[GCSPreferencesStore removeObserver:forKeyPath:context:]( self->_prefsStore,  "removeObserver:forKeyPath:context:",  self,  @"games",  0LL);
    -[GCSPreferencesStore removeObserver:forKeyPath:context:]( self->_prefsStore,  "removeObserver:forKeyPath:context:",  self,  @"profiles",  0LL);
    -[GCSPreferencesStore removeObserver:forKeyPath:context:]( self->_prefsStore,  "removeObserver:forKeyPath:context:",  self,  @"copilotFusedControllers",  0LL);
    id v7 = self->_prefsStore;
    self->_prefsStore = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
  -[GCTVSettingsController dealloc](&v8, "dealloc");
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController settingGroupAtIndex:](self, "settingGroupAtIndex:", a4));
  if (v7 == self->_bluetoothConnectionGroup)
  {
    double v9 = 25.0;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
    -[GCTVSettingsController tableView:heightForFooterInSection:](&v11, "tableView:heightForFooterInSection:", v6, a4);
    double v9 = v8;
  }

  return v9;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_controller)
  {
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
    id v12 = -[GCTVSettingsController previewForItemAtIndexPath:](&v33, "previewForItemAtIndexPath:", v4);
    id v13 = (UIViewController *)objc_claimAutoreleasedReturnValue(v12);
    previewViewController = self->_previewViewController;
    self->_previewViewController = v13;

    goto LABEL_15;
  }

  id v6 = (TSKListSettingGroup *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
  id v7 = v6;
  if (v6 == self->_appCustomizationsGroup || v6 == self->_customizedAppsGroup)
  {
    objc_super v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v5));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController representedObject](v11, "representedObject"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 game]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCSGame defaultIdentifier](&OBJC_CLASS___GCSGame, "defaultIdentifier"));
    unsigned int v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      BOOL v20 = self->_previewViewController;
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___GCTVSettingsPreviewViewController);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }

      v22 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCSController tvset_controllerType](self->_controller, "tvset_controllerType"));
      id v23 = self->_previewViewController;
      self->_previewViewController = (UIViewController *)v22;
    }

    else
    {
      id v24 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      id v23 = (UIViewController *)objc_claimAutoreleasedReturnValue([v15 game]);
      objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bundleIdentifier](v23, "bundleIdentifier"));
      v26 = (UIViewController *)[v24 initWithApplicationBundleIdentifier:v25];
      v27 = self->_previewViewController;
      self->_previewViewController = v26;
    }

    goto LABEL_12;
  }

  double v8 = self->_previewViewController;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___GCTVSettingsPreviewViewController);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    id v10 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCSController tvset_controllerType](self->_controller, "tvset_controllerType"));
    objc_super v11 = self->_previewViewController;
    self->_previewViewController = (UIViewController *)v10;
LABEL_13:
  }

LABEL_15:
  id v28 = self->_previewViewController;
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v5));
    -[UIViewController setDescriptionText:](self->_previewViewController, "setDescriptionText:", v30);
  }

  __int16 v31 = self->_previewViewController;

  return v31;
}

- (id)_nameViewControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  id v6 = sub_EA9C(@"PROFILE_NAME_NEW_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setHeaderText:v7];

  id v8 = sub_EA9C(@"PROFILE_NAME_NEW_DESC");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 setMessageText:v9];

  [v5 setEditingDelegate:self];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedValueForSettingItem:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedValueForSettingItem:",  v4));

  [v5 setInitialText:v10];
  -[GCTVSettingsController setNameViewController:](self, "setNameViewController:", v5);

  return v5;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController nameViewController](self, "nameViewController"));

  if (v11 == v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GCSProfile profileWithName:](&OBJC_CLASS___GCSProfile, "profileWithName:", v10));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController prefsStore](self, "prefsStore"));
    [v13 addProfile:v12 saveToDisk:1];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController navigationController](self, "navigationController"));
    id v15 = [v14 popToViewController:self animated:1];
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___GCTVSettingsController;
    -[GCTVSettingsController editingController:didProvideValue:forSettingItem:]( &v16,  "editingController:didProvideValue:forSettingItem:",  v8,  v10,  v9);
  }
}

- (void)didConnectToGameController:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_8C9C;
  block[3] = &unk_4CAA0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)didDisconnectToGameController:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_8D94;
  block[3] = &unk_4CAA0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)_bluetoothDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController editingItem](self, "editingItem"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 representedObject]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = v3;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_3A778();
    }
    id v5 = 0LL;
  }

  return v5;
}

- (void)_disconnectDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController _bluetoothDevice](self, "_bluetoothDevice", a3));
  id v5 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_CONFIRMATION_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_EAFC((uint64_t)@"%@", @"BLUETOOTH_DISCONNECT_DEVICE_MESSAGE");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v10,  1LL));
  id v12 = sub_EA9C(@"BLUETOOTH_DISCONNECT_DEVICE_CONFIRMATION_BUTTON");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_907C;
  v18[3] = &unk_4CC90;
  v18[4] = self;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  2LL,  v18));
  [v11 addAction:v14];
  id v15 = sub_EA9C(@"CANCEL");
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));

  [v11 addAction:v17];
  -[GCTVSettingsController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_unpairDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController _bluetoothDevice](self, "_bluetoothDevice", a3));
  id v5 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_CONFIRMATION_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_EAFC((uint64_t)@"%@", @"BLUETOOTH_FORGET_DEVICE_MESSAGE");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v10,  1LL));
  id v12 = sub_EA9C(@"BLUETOOTH_FORGET_DEVICE_CONFIRMATION_BUTTON");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_92D4;
  v19[3] = &unk_4CCB8;
  id v20 = v4;
  uint64_t v21 = self;
  id v14 = v4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  2LL,  v19));
  [v11 addAction:v15];
  id v16 = sub_EA9C(@"CANCEL");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  0LL));

  [v11 addAction:v18];
  -[GCTVSettingsController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_connectDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController _bluetoothDevice](self, "_bluetoothDevice"));
  [v4 connectDevice:v5];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[GCTVSettingsController navigationController](self, "navigationController"));
  id v6 = [v7 popViewControllerAnimated:1];
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

- (GCTVSettingsControllerRepresentedObject)representedObj
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

- (GCSController)controller
{
  return self->_controller;
}

- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore
{
  return self->_prefsStore;
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