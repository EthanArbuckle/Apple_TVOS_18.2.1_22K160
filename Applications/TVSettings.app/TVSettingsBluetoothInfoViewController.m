@interface TVSettingsBluetoothInfoViewController
- (BOOL)_shouldShowAdaptiveVolumeSettings;
- (BOOL)_shouldShowSSLSettings;
- (BOOL)_shouldShowSpatialAudioSettings;
- (NSTimer)rssiFetchTimer;
- (TSKSettingItem)adaptiveVolumeItem;
- (TSKSettingItem)editingItem;
- (TSKSettingItem)pivotItem;
- (TSKSettingItem)renameDeviceItem;
- (TSKSettingItem)soundProfileItem;
- (TSKSettingItem)sslItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (id)_bluetoothDevice;
- (id)_makeDeviceNameChildViewController;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_connectDevice:(id)a3;
- (void)_disconnectDevice:(id)a3;
- (void)_renameDevice:(id)a3;
- (void)_startRSSIFetchTimer;
- (void)_stopRSSIFetchTimer;
- (void)_toggleSpatialAudio:(id)a3;
- (void)_unpairDevice:(id)a3;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)setRssiFetchTimer:(id)a3;
- (void)showSpatialTutorial;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsBluetoothInfoViewController

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothInfoViewController;
  -[TVSettingsBluetoothInfoViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v4 type] == (id)1) {
    -[TVSettingsBluetoothInfoViewController _startRSSIFetchTimer](self, "_startRSSIFetchTimer");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothInfoViewController;
  -[TVSettingsBluetoothInfoViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v4 type] == (id)1) {
    -[TVSettingsBluetoothInfoViewController _stopRSSIFetchTimer](self, "_stopRSSIFetchTimer");
  }
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  id v106 = [v3 type];
  if (v106 == (id)1)
  {
    objc_msgSend(v3, "tvset_fetchBTLEMAC");
    [v3 readRSSI];
    v4 = @"BluetoothDisconnectRemoteTitle";
  }

  else
  {
    v4 = @"BluetoothDisconnectDeviceTitle";
  }

  objc_super v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = TSKLocString(@"BluetoothConnectDeviceTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  0LL,  0LL,  self,  "_connectDevice:"));

  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472LL;
  v122[2] = sub_10008762C;
  v122[3] = &unk_1001912B8;
  id v9 = v3;
  id v123 = v9;
  BOOL v124 = v106 == (id)1;
  [v8 setUpdateBlock:v122];
  -[NSMutableArray addObject:](v5, "addObject:", v8);
  uint64_t v10 = TSKLocString(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "_disconnectDevice:"));

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_100087680;
  v119[3] = &unk_1001912B8;
  BOOL v121 = v106 == (id)1;
  id v13 = v9;
  id v120 = v13;
  [v12 setUpdateBlock:v119];
  -[NSMutableArray addObject:](v5, "addObject:", v12);
  objc_initWeak(&location, self);
  uint64_t v14 = TSKLocString(@"BluetoothRenameDeviceMenu");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472LL;
  v116[2] = sub_1000876F4;
  v116[3] = &unk_10018E9D8;
  objc_copyWeak(&v117, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v15,  0LL,  0LL,  0LL,  v116));

  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472LL;
  v113[2] = sub_10008772C;
  v113[3] = &unk_1001912B8;
  BOOL v115 = v106 == (id)1;
  id v17 = v13;
  id v114 = v17;
  [v16 setUpdateBlock:v113];
  -[NSMutableArray addObject:](v5, "addObject:", v16);
  objc_storeStrong((id *)&self->_renameDeviceItem, v16);
  if (v106 == (id)1) {
    v18 = @"BluetoothForgetRemoteTitle";
  }
  else {
    v18 = @"BluetoothForgetDeviceTitle";
  }
  uint64_t v19 = TSKLocString(v18);
  v105 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v105,  0LL,  0LL,  0LL,  self,  "_unpairDevice:"));
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472LL;
  v110[2] = sub_100087780;
  v110[3] = &unk_1001912B8;
  BOOL v112 = v106 == (id)1;
  id v21 = v17;
  id v111 = v21;
  [v20 setUpdateBlock:v110];
  -[NSMutableArray addObject:](v5, "addObject:", v20);
  uint64_t v22 = TSKLocString(@"BluetoothSetupSectionTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v23,  v5));

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[TVSettingsBluetoothInfoViewController _shouldShowSpatialAudioSettings](self, "_shouldShowSpatialAudioSettings"))
  {
    uint64_t v24 = TSKLocString(@"SpatialAudioSettingTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v25,  0LL,  v21,  @"spatialAudioAllowed",  self,  "_toggleSpatialAudio:"));

    uint64_t v27 = TSKLocString(@"SpatialAudioSettingEnabled");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = TSKLocString(@"SpatialAudioSettingDisabled");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  v28,  v30));

    [v26 setLocalizedValueFormatter:v31];
    [v26 setAvailableValues:&off_1001AEFB0];
    [v107 addObject:v26];
    if (!_os_feature_enabled_impl("BluetoothFeatures", "CustomHRTFSupport"))
    {
LABEL_15:
      uint64_t v46 = TSKLocString(@"SpatialTutorialSettingTitle");
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v48 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v47,  0LL,  0LL,  0LL,  self,  "showSpatialTutorial"));

      [v107 addObject:v48];
      pivotItem = self->_pivotItem;
      self->_pivotItem = v48;

      goto LABEL_16;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
    if ([v32 soundProfileSupported])
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
      unsigned int v34 = [v33 isMagicPaired];

      if (v34)
      {
        v101 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
        v102 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](v101, "primaryUser"));
        uint64_t v35 = TSKLocString(@"SoundProfileSettingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v102 shortName]);
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v36,  v37));

        uint64_t v39 = TSKLocString(@"SoundProfileSettingTitle");
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v40,  v38,  v21,  @"soundProfileAllowed",  0LL,  0LL));

LABEL_14:
        objc_storeStrong((id *)&self->_soundProfileItem, v41);
        [v107 addObject:v41];

        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v42 = TSKLocString(@"SoundProfileSettingTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    uint64_t v44 = TSKLocString(@"SoundProfileSettingNotAvailableDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v43,  v45,  0LL,  0LL,  0LL,  0LL));

    [v41 setUpdateBlock:&stru_100192160];
    goto LABEL_14;
  }

- (id)previewForItemAtIndexPath:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothInfoViewController;
  id v4 = a3;
  id v5 = -[TVSettingsBluetoothInfoViewController previewForItemAtIndexPath:](&v15, "previewForItemAtIndexPath:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[TVSettingsBluetoothInfoViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));

  if (v7 != self->_soundProfileItem && v7 != self->_adaptiveVolumeItem && v7 != self->_sslItem)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
      if ([v9 hasPoorBehavior])
      {
        uint64_t v10 = TSKWiFiLocString(@"BluetoothDevicePoorBehaviorDescriptionFormat_WIFI");
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v12));
      }

      else
      {
        id v13 = 0LL;
      }

      [v6 setDescriptionText:v13];
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothInfoViewController;
  id v8 = a4;
  -[TVSettingsBluetoothInfoViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v16,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v8,  a5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v9));
  v11 = (void *)v10;
  pivotItem = self->_pivotItem;
  if (pivotItem) {
    BOOL v13 = v10 == (void)pivotItem;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100087F48;
    v14[3] = &unk_10018E468;
    v14[4] = self;
    id v15 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v14,  0LL,  0.4,  0.0);
  }
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a4;
  id v9 = v8;
  if (self->_renameDeviceItem == a5)
  {
    if ([v8 length]) {
      -[TVSettingsBluetoothInfoViewController _renameDevice:](self, "_renameDevice:", v9);
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController navigationController](self, "navigationController"));
    id v11 = [v10 popToViewController:self animated:1];
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothInfoViewController;
    -[TVSettingsBluetoothInfoViewController editingController:didProvideValue:forSettingItem:]( &v12,  "editingController:didProvideValue:forSettingItem:",  a3,  v8,  a5);
  }
}

- (void)_toggleSpatialAudio:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice", a3));
  uint64_t v5 = [v4 spatialAudioAllowed] ^ 1;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  [v6 setSpatialAudioAllowed:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.appletv.settings." stringByAppendingString:@"bluetooth_device.spatial_audio.toggled"]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100088120;
  v9[3] = &unk_1001922A8;
  id v10 = v4;
  char v11 = v5;
  id v8 = v4;
  AnalyticsSendEventLazy(v7, v9);
}

- (void)_disconnectDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice", a3));
  +[TVSettingsBluetoothFacade disconnectDevice:](&OBJC_CLASS___TVSettingsBluetoothFacade, "disconnectDevice:", v4);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController navigationController](self, "navigationController"));
  id v5 = [v6 popViewControllerAnimated:1];
}

- (void)_renameDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v5 setIdentifier:v7];

  id v8 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  [v8 setName:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008836C;
  v10[3] = &unk_10018EAA0;
  id v11 = objc_alloc_init(&OBJC_CLASS___CBController);
  id v9 = v11;
  [v9 modifyDevice:v5 settings:v8 completion:v10];
  -[TVSettingsBluetoothInfoViewController setTitle:](self, "setTitle:", v4);
}

- (void)_unpairDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice", a3));
  id v5 = [v4 type];
  if (v5 == (id)1)
  {
    uint64_t v6 = TSKLocString(@"BluetoothForgetRemoteConfirmationTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = TSKLocString(@"BluetoothDisconnectDeviceMessage");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = TSKLocString(@"BluetoothDisconnectRemoteMessage");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    uint64_t v12 = TSKLocString(@"BluetoothForgetDeviceConfirmationTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v13 = TSKLocString(@"BluetoothDisconnectDeviceMessage");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
    unsigned int v15 = [v14 isMagicPaired];

    if (!v15) {
      goto LABEL_6;
    }
    uint64_t v16 = TSKLocString(@"BluetoothUnpairMagicPairedDeviceMessage");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v17));

    id v11 = (void *)v18;
  }

LABEL_6:
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v11,  1LL));
  if (v5 == (id)1) {
    v20 = @"BluetoothForgetRemoteTitle";
  }
  else {
    v20 = @"BluetoothForgetDeviceTitle";
  }
  uint64_t v21 = TSKLocString(v20);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000885D8;
  v28[3] = &unk_10018F040;
  id v29 = v4;
  v30 = self;
  id v23 = v4;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  2LL,  v28));
  [v19 addAction:v24];
  uint64_t v25 = TSKLocString(@"Cancel");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v26,  1LL,  0LL));

  [v19 addAction:v27];
  -[TVSettingsBluetoothInfoViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
}

- (void)_connectDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice", a3));
  +[TVSettingsBluetoothFacade connectDevice:](&OBJC_CLASS___TVSettingsBluetoothFacade, "connectDevice:", v4);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController navigationController](self, "navigationController"));
  id v5 = [v6 popViewControllerAnimated:1];
}

- (void)showSpatialTutorial
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v3 isInEar])
  {
    id v4 = -[TVSettingsSpatialAudioTutorialViewController initWithBluetoothDevice:]( objc_alloc(&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController),  "initWithBluetoothDevice:",  v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting spatial allowed to YES before tutorial is presented",  buf,  2u);
    }

    [v3 setSpatialAudioAllowed:1];
    -[TVSettingsBluetoothInfoViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v4,  1LL,  0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.appletv.settings." stringByAppendingString:@"bluetooth_device.spatial_audio.tutorial_viewed"]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000888F0;
    v13[3] = &unk_1001922D0;
    v13[4] = self;
    AnalyticsSendEventLazy(v5, v13);
  }

  else
  {
    if ([v3 headsetType] == (id)2 || objc_msgSend(v3, "headsetType") == (id)4)
    {
      id v6 = @"SpatialAudioInEarAlertTitle";
    }

    else
    {
      id v6 = @"SpatialAudioInEarAlertTitle";
      if ([v3 headsetType] != (id)13 && objc_msgSend(v3, "headsetType") == (id)3) {
        id v6 = @"SpatialAudioOnHeadAlertTitle";
      }
    }

    uint64_t v7 = TSKLocString(v6);
    id v4 = (TVSettingsSpatialAudioTutorialViewController *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v8));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  0LL,  1LL));

    uint64_t v10 = TSKLocString(@"SpatialAudioInEarAlertButtonTitle");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  0LL));
    [v5 addAction:v12];

    -[TVSettingsBluetoothInfoViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
  }
}

- (id)_bluetoothDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController editingItem](self, "editingItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 representedObject]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = v3;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000F96A8();
    }
    id v5 = 0LL;
  }

  return v5;
}

- (id)_makeDeviceNameChildViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  -[TSKTextInputViewController setEditingDelegate:](v3, "setEditingDelegate:", self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController title](self, "title"));
  -[TSKTextInputViewController setInitialText:](v3, "setInitialText:", v4);

  uint64_t v5 = TSKLocString(@"BluetoothRenameDeviceTitle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[TSKTextInputViewController setHeaderText:](v3, "setHeaderText:", v6);

  return v3;
}

- (BOOL)_shouldShowSpatialAudioSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v3 spatialAudioSupported])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
    unsigned __int8 v5 = [v4 isConnected];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldShowSSLSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v3 selectiveSpeechListeningSupported])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
    else {
      char v5 = 0;
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldShowAdaptiveVolumeSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
  if ([v3 adaptiveVolumeSupported])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController _bluetoothDevice](self, "_bluetoothDevice"));
    else {
      char v5 = 0;
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_startRSSIFetchTimer
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100088C90;
  v4[3] = &unk_1001922F8;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v4,  3.0));
  -[TVSettingsBluetoothInfoViewController setRssiFetchTimer:](self, "setRssiFetchTimer:", v3);
}

- (void)_stopRSSIFetchTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothInfoViewController rssiFetchTimer](self, "rssiFetchTimer"));
  [v3 invalidate];

  -[TVSettingsBluetoothInfoViewController setRssiFetchTimer:](self, "setRssiFetchTimer:", 0LL);
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

- (TSKSettingItem)pivotItem
{
  return self->_pivotItem;
}

- (TSKSettingItem)renameDeviceItem
{
  return self->_renameDeviceItem;
}

- (TSKSettingItem)soundProfileItem
{
  return self->_soundProfileItem;
}

- (TSKSettingItem)adaptiveVolumeItem
{
  return self->_adaptiveVolumeItem;
}

- (TSKSettingItem)sslItem
{
  return self->_sslItem;
}

- (NSTimer)rssiFetchTimer
{
  return self->_rssiFetchTimer;
}

- (void)setRssiFetchTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end