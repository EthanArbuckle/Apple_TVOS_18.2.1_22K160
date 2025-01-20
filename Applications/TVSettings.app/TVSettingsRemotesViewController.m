@interface TVSettingsRemotesViewController
- (BOOL)_canProgramBluetoothRemote;
- (BOOL)_isAudioUsingARC;
- (BOOL)_isAudioUsingAirPlayOther;
- (BOOL)_isAudioUsingBTHeadphones;
- (BOOL)_isAudioUsingBTSpeakers;
- (BOOL)_showLearnedRemotes;
- (BOOL)cachedAudioOutputIsHomeTheater;
- (BOOL)isPairedWithAppleRemote;
- (BOOL)isUpdatingPairedAppleRemoteState;
- (PBSExternalControlSystem)externalControlSystem;
- (TVSettingsAudioVideoFacade)avFacade;
- (TVSettingsBluetoothFacade)bluetoothFacade;
- (TVSettingsContinuityCameraFacade)continuityCameraFacade;
- (TVSettingsRemotesFacade)remotesFacade;
- (TVSettingsRemotesViewController)initWithStyle:(int64_t)a3;
- (TVSettingsSelectIRConfigurationViewController)selectIRConfigurationViewController;
- (id)_appleRemoteSettingGroups;
- (id)_remoteSettingsGroups;
- (id)_systemControlSettingsGroups;
- (id)loadSettingGroups;
- (id)stringForCurrentVolumePolicy;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unsigned)cachedAudioOutputDeviceSubtype;
- (unsigned)cachedAudioOutputDeviceType;
- (void)_activateKonamiCodeForUnpair:(id)a3;
- (void)_addPowerMenuItemsTo:(id)a3;
- (void)_addVolumeMenuItemsTo:(id)a3;
- (void)_didSelectDedicatedContinuityCamera:(id)a3;
- (void)_didSelectLearnNewRemoteItem:(id)a3;
- (void)_didSelectLearnedRemoteItem:(id)a3;
- (void)_didSelectPairAppleRemoteItem:(id)a3;
- (void)_didSelectVolumeControlItem:(id)a3;
- (void)_fetchAppleRemotePairedState;
- (void)_learnNewRemote;
- (void)_sendDedicatedCameraSetupCompleteAnalyticsWithDevice:(id)a3;
- (void)_setUpGuideButtonsForRemoteWithUUID:(id)a3;
- (void)_setUpPlaybackButtonsForRemoteWithUUID:(id)a3;
- (void)_showLearnedRemoteFinishedAlertWithName:(id)a3;
- (void)_showLearnedRemoteOptionsAlertForDevice:(id)a3 withName:(id)a4;
- (void)_showSelectedLearnedRemoteOptionsAlertForConfiguration:(id)a3;
- (void)_showSystemControlUnavailableDialog;
- (void)_togglePowerItem:(id)a3;
- (void)_updateAppleRemotePairedStateWithBlock:(id)a3;
- (void)_updateAudioEndpointInfo;
- (void)dealloc;
- (void)externalControlSystem:(id)a3 didChangeReadyStatus:(BOOL)a4;
- (void)externalControlSystem:(id)a3 didReceiveDeviceEvent:(int64_t)a4;
- (void)externalControlSystemDidUpdatePolicy:(id)a3;
- (void)setAvFacade:(id)a3;
- (void)setBluetoothFacade:(id)a3;
- (void)setCachedAudioOutputDeviceSubtype:(unsigned int)a3;
- (void)setCachedAudioOutputDeviceType:(unsigned int)a3;
- (void)setCachedAudioOutputIsHomeTheater:(BOOL)a3;
- (void)setContinuityCameraFacade:(id)a3;
- (void)setExternalControlSystem:(id)a3;
- (void)setPairedWithAppleRemote:(BOOL)a3;
- (void)setRemotesFacade:(id)a3;
- (void)setSelectIRConfigurationViewController:(id)a3;
- (void)setUpdatingPairedAppleRemoteState:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsRemotesViewController

- (TVSettingsRemotesViewController)initWithStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesViewController;
  v3 = -[TVSettingsRemotesViewController initWithStyle:](&v16, "initWithStyle:", a3);
  if (v3)
  {
    if (qword_1001E1B00 != -1) {
      dispatch_once(&qword_1001E1B00, &stru_100193960);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"reloadSettingsIfNeeded" name:TVSBluetoothRemoteDidConnectNotification object:0];
    [v4 addObserver:v3 selector:"reloadSettingsIfNeeded" name:TVSBluetoothRemoteDidDisconnectNotification object:0];
    [v4 addObserver:v3 selector:"_externalControlSystemConfigurationChanged" name:PBSExternalControlSystemConfigurationChanged object:0];
    [v4 addObserver:v3 selector:"_audioOutputDevicesChanged" name:kMRAVEndpointOutputDevicesDidChangeNotification object:0];
    v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsBluetoothFacade);
    bluetoothFacade = v3->_bluetoothFacade;
    v3->_bluetoothFacade = v5;

    [v4 addObserver:v3 selector:"reloadSettingsIfNeeded" name:@"TVSettingsBluetoothDeviceInfoDidUpdateNotification" object:v3->_bluetoothFacade];
    v7 = objc_alloc_init(&OBJC_CLASS___TVSettingsRemotesFacade);
    remotesFacade = v3->_remotesFacade;
    v3->_remotesFacade = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___TVSettingsAudioVideoFacade);
    avFacade = v3->_avFacade;
    v3->_avFacade = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[TVSettingsContinuityCameraFacade sharedInstance]( &OBJC_CLASS___TVSettingsContinuityCameraFacade,  "sharedInstance"));
    continuityCameraFacade = v3->_continuityCameraFacade;
    v3->_continuityCameraFacade = (TVSettingsContinuityCameraFacade *)v11;

    -[TVSettingsContinuityCameraFacade activateWithCompletion:]( v3->_continuityCameraFacade,  "activateWithCompletion:",  &stru_100193980);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    externalControlSystem = v3->_externalControlSystem;
    v3->_externalControlSystem = (PBSExternalControlSystem *)v13;

    -[PBSExternalControlSystem setDelegate:](v3->_externalControlSystem, "setDelegate:", v3);
    -[TVSettingsRemotesViewController _fetchAppleRemotePairedState](v3, "_fetchAppleRemotePairedState");
    -[TVSettingsRemotesViewController _updateAudioEndpointInfo](v3, "_updateAudioEndpointInfo");
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesViewController;
  -[TVSettingsRemotesViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesViewController;
  -[TVSettingsRemotesViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesViewController;
  -[TVSettingsRemotesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TVSettingsRemotesViewController _fetchAppleRemotePairedState](self, "_fetchAppleRemotePairedState");
  -[TVSettingsRemotesViewController _updateAudioEndpointInfo](self, "_updateAudioEndpointInfo");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController _appleRemoteSettingGroups](self, "_appleRemoteSettingGroups"));
  [v3 addObjectsFromArray:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController _remoteSettingsGroups](self, "_remoteSettingsGroups"));
  [v3 addObjectsFromArray:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController _systemControlSettingsGroups](self, "_systemControlSettingsGroups"));
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRemotesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v7 section]));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  if (v10 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice), (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
  {
    v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
    uint64_t v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7]);

    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    [v15 setBluetoothDevice:v16];

    [v15 settingItem:v9 didUpdateMetadataWithGroup:v8];
    [v9 setDirty:0];
    id v17 = v15;
    if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000FB050();
    }
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesViewController;
    id v18 = -[TVSettingsRemotesViewController tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v18);
    if (!v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000FAFE8();
      }
      id v17 = 0LL;
    }
  }

  return v17;
}

- (void)_togglePowerItem:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  0LL));
  if ([v5 isConfiguredForUse])
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController externalControlSystem](self, "externalControlSystem"));
    [v4 togglePolicyForFeature:v5 withCompletion:0];
  }

  else
  {
    -[TVSettingsRemotesViewController _showSystemControlUnavailableDialog](self, "_showSystemControlUnavailableDialog");
  }
}

- (void)_didSelectVolumeControlItem:(id)a3
{
  obj = objc_alloc_init(&OBJC_CLASS___TVSettingsSelectIRConfigurationViewController);
  -[TVSettingsSelectIRConfigurationViewController setRemotesFacade:](obj, "setRemotesFacade:", self->_remotesFacade);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v4 pushViewController:obj animated:1];

  objc_storeWeak((id *)&self->_selectIRConfigurationViewController, obj);
}

- (void)_didSelectPairAppleRemoteItem:(id)a3
{
  uint64_t v4 = -[TVSettingsRemotesViewController isPairedWithAppleRemote](self, "isPairedWithAppleRemote", a3) ^ 1;
  -[TVSettingsRemotesViewController setPairedWithAppleRemote:](self, "setPairedWithAppleRemote:", v4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B5AF0;
  v5[3] = &unk_1001939A0;
  char v6 = v4;
  -[TVSettingsRemotesViewController _updateAppleRemotePairedStateWithBlock:]( self,  "_updateAppleRemotePairedStateWithBlock:",  v5);
}

- (void)_didSelectLearnNewRemoteItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TSKLocString(@"RCLearnRemoteStartDialogTitle");
  char v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"RCLearnRemoteStartDialogDescriptionText");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

  objc_initWeak(&location, self);
  uint64_t v10 = TSKLocString(@"RCLearnRemoteStartButtonTitle");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_1000B5D30;
  objc_super v20 = &unk_10018F4E8;
  objc_copyWeak(&v21, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  &v17));

  objc_msgSend(v9, "addAction:", v12, v17, v18, v19, v20);
  uint64_t v13 = TSKLocString(@"RCLearnRemoteCancel");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));

  [v9 addAction:v15];
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v16 presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_didSelectLearnedRemoteItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      objc_super v8 = v7;
    }
    else {
      objc_super v8 = 0LL;
    }
  }

  else
  {
    objc_super v8 = 0LL;
  }

  id v9 = v8;

  -[TVSettingsRemotesViewController _showSelectedLearnedRemoteOptionsAlertForConfiguration:]( self,  "_showSelectedLearnedRemoteOptionsAlertForConfiguration:",  v9);
}

- (void)_showSelectedLearnedRemoteOptionsAlertForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceName]);

  if (v5)
  {
    uint64_t v6 = TSKLocString(@"RCEditLearnedRemoteDialogDescriptionText");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceName]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
  }

  else
  {
    uint64_t v10 = TSKLocString(@"RCEditLearnedRemoteDialogUnnamedDescriptionText");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  0LL,  1LL));
  objc_initWeak(location, self);
  uint64_t v12 = TSKLocString(@"RCEditLearnedRemoteRenameButtonTitle");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v37 = (void *)v9;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000B62E4;
  v50[3] = &unk_10018F4C0;
  objc_copyWeak(&v52, location);
  id v14 = v4;
  id v51 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v50));
  [v11 addAction:v15];
  v36 = self;

  uint64_t v16 = TSKLocString(@"RCEditLearnedRemoteBasicButtonsButtonTitle");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000B6458;
  v47[3] = &unk_10018FF80;
  id v18 = v14;
  id v48 = v18;
  objc_copyWeak(&v49, location);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v47));
  [v11 addAction:v19];

  uint64_t v20 = TSKLocString(@"RCEditLearnedRemotePlaybackButtonsButtonTitle");
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000B65DC;
  v44[3] = &unk_10018FF80;
  id v22 = v18;
  id v45 = v22;
  objc_copyWeak(&v46, location);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  v44));
  [v11 addAction:v23];

  uint64_t v24 = TSKLocString(@"RCEditLearnedRemoteGuideButtonsButtonTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000B6760;
  v41[3] = &unk_10018FF80;
  id v26 = v22;
  id v42 = v26;
  objc_copyWeak(&v43, location);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  0LL,  v41));
  [v11 addAction:v27];

  uint64_t v28 = TSKLocString(@"RCEditLearnedRemoteDeleteButtonTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000B68E4;
  v38[3] = &unk_10018F4C0;
  objc_copyWeak(&v40, location);
  id v30 = v26;
  id v39 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  2LL,  v38));
  [v11 addAction:v31];

  uint64_t v32 = TSKLocString(@"RCLearnRemoteCancel");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v33,  1LL,  0LL));
  [v11 addAction:v34];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](v36, "navigationController"));
  [v35 presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v52);
  objc_destroyWeak(location);
}

- (void)_activateKonamiCodeForUnpair:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  +[TVSettingsBluetoothFacade unpairDevice:](&OBJC_CLASS___TVSettingsBluetoothFacade, "unpairDevice:", v3);
}

- (void)_didSelectDedicatedContinuityCamera:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsContinuityCameraFacade dedicatedDevice](self->_continuityCameraFacade, "dedicatedDevice"));
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[TVSettingsRemotesViewController _didSelectDedicatedContinuityCamera:]";
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: continuityCameraDevice: %@",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [[DDPeoplePickerViewController alloc] initRemoteCameraDevicePicker];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setOptions:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000B6DE0;
    v8[3] = &unk_1001939C8;
    objc_copyWeak(&v9, (id *)buf);
    [v7 setCameraDevicePickerCompletion:v8];
    -[TVSettingsRemotesViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 5LL);
    -[TVSettingsRemotesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
    objc_destroyWeak(&v9);
  }

  objc_destroyWeak((id *)buf);
}

- (void)_sendDedicatedCameraSetupCompleteAnalyticsWithDevice:(id)a3
{
  if (a3)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 model]);
    id v4 = (void *)v3;
    uint64_t v5 = @"Unknown";
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    id v6 = v5;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sending dedicated device setup complete analytic with companion device model: %@",  buf,  0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000B6FF4;
    v8[3] = &unk_1001922D0;
    id v9 = v6;
    uint64_t v7 = v6;
    AnalyticsSendEventLazy(@"com.apple.ddui.setupdedicatedcamera", v8);
  }

- (void)externalControlSystem:(id)a3 didChangeReadyStatus:(BOOL)a4
{
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v6 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v4, &_os_log_default, 1LL, 0LL, 5LL, v6);
  }

  -[TVSettingsRemotesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)externalControlSystem:(id)a3 didReceiveDeviceEvent:(int64_t)a4
{
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v6 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v4, &_os_log_default, 1LL, 0LL, 5LL, v6);
  }

  -[TVSettingsRemotesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)externalControlSystemDidUpdatePolicy:(id)a3
{
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v5 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 5LL, v5);
  }

  -[TVSettingsRemotesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)_appleRemoteSettingGroups
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (+[TVSDevice supportsTouchRemote](&OBJC_CLASS___TVSDevice, "supportsTouchRemote"))
  {
    id v42 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppleRemoteFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppleRemoteFacade,  "sharedInstance"));
    v47 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = TSKLocStringFromBundleCachingKey(@"RCClickpadModeTitle", v5, 1LL, 0LL, @"Localizable-B519");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 availableClickpadModeValues]);
    id v46 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v7,  0LL,  v4,  @"clickpadMode",  v8));

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 clickpadModeFormatter]);
    [v46 setLocalizedValueFormatter:v9];

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000B7818;
    v56[3] = &unk_10018E608;
    id v10 = v4;
    id v57 = v10;
    [v46 setUpdateBlock:v56];
    -[NSMutableArray addObject:](v47, "addObject:", v46);
    uint64_t v11 = TSKLocString(@"RCTouchpadTrackingTitle");
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 availableSensitivityValues]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v12,  0LL,  v10,  @"sensitivity",  v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 sensitivityFormatter]);
    [v14 setLocalizedValueFormatter:v15];

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_1000B785C;
    v54[3] = &unk_10018E608;
    id v43 = v10;
    id v55 = v43;
    [v14 setUpdateBlock:v54];
    -[NSMutableArray addObject:](v47, "addObject:", v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v47));
    else {
      uint64_t v16 = @"RemoteTVButtonTitleTVApp";
    }
    uint64_t v17 = TSKLocString(v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v17);
    int v18 = sub_1000B78CC();
    v19 = @"RemoteTVButtonDescriptionTVApp";
    if (v18) {
      v19 = @"RemoteTVButtonDescriptionTVApp#CH";
    }
    id v45 = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    uint64_t v22 = TSKAttributedSymbolLocString(v45, &off_1001AF840, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    uint64_t v24 = TSKLocString(@"RemoteTVButtonTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = TSKLocString(@"RemoteTVButtonTitleHomeScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v25,  0LL,  v43,  @"tvButtonLaunchesTVApp",  v44,  v27));

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1000B7980;
    v52[3] = &unk_10018E608;
    id v29 = v23;
    id v53 = v29;
    [v28 setUpdateBlock:v52];
    v59 = v28;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v30));

    objc_initWeak(&location, self);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBluetoothFacade deviceStatusFormatterForDeviceType:headsetType:showConnectedState:]( &OBJC_CLASS___TVSettingsBluetoothFacade,  "deviceStatusFormatterForDeviceType:headsetType:showConnectedState:",  1LL,  0LL,  0LL));
    bluetoothFacade = self->_bluetoothFacade;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000B7A64;
    v48[3] = &unk_100193A10;
    id v34 = v32;
    id v49 = v34;
    objc_copyWeak(&v50, &location);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  bluetoothFacade,  @"remotes",  v48));
    [v35 setComparesArrayDeeply:0];
    uint64_t v36 = TSKLocString(@"RCAppleRemoteTitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v58[0] = v41;
    v58[1] = v31;
    v58[2] = v35;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 3LL));
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v37,  v38));

    -[NSMutableArray addObject:](v42, "addObject:", v39);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&location);
    uint64_t v3 = v42;
  }

  return v3;
}

- (id)_remoteSettingsGroups
{
  v54 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  4LL));
  if (+[TVSettingsContinuityCameraFacade isEnabled](&OBJC_CLASS___TVSettingsContinuityCameraFacade, "isEnabled")
    && +[TVSettingsContinuityCameraFacade isSupported](&OBJC_CLASS___TVSettingsContinuityCameraFacade, "isSupported"))
  {
    uint64_t v4 = TSKLocString(@"DedicatedCameraDescription");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = TSKLocString(@"DedicatedCameraDisabledDescription");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = TSKLocString(@"DedicatedCameraTitle");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  v5,  self->_continuityCameraFacade,  @"dedicatedDevice",  self,  "_didSelectDedicatedContinuityCamera:"));

    [v50 setAccessoryTypes:1];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_1000B83AC;
    v65[3] = &unk_100191390;
    objc_copyWeak(&v68, &location);
    id v10 = v7;
    id v66 = v10;
    id v11 = v5;
    id v67 = v11;
    [v50 setUpdateBlock:v65];
    __int16 v12 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    uint64_t v13 = TSKLocString(@"ContinuityCameraSectionTitle");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[TSKSettingGroup initWithTitle:](v12, "initWithTitle:", v14);

    v72 = v50;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
    -[TSKSettingGroup setSettingItems:](v15, "setSettingItems:", v16);

    -[NSMutableArray addObject:](v54, "addObject:", v15);
    objc_destroyWeak(&v68);
  }

  else
  {
    id v50 = 0LL;
  }

  uint64_t v17 = TSKLocString(@"BluetoothItemTitle");
  int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1000B84C8;
  v63[3] = &unk_10018E9D8;
  objc_copyWeak(&v64, &location);
  id v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v18,  0LL,  0LL,  0LL,  v63));

  if ((+[TVSDevice supportsTouchRemote](&OBJC_CLASS___TVSDevice, "supportsTouchRemote") & 1) != 0)
  {
    id v53 = 0LL;
  }

  else
  {
    if (-[TVSettingsRemotesViewController isPairedWithAppleRemote](self, "isPairedWithAppleRemote")) {
      uint64_t v19 = TSKLocString(@"RCUnPairRemoteTitle");
    }
    else {
      uint64_t v19 = TSKLocString(@"RCPairRemoteTitle");
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = TSKLocString(@"RCPairRemoteInstructionalText");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v20,  v22,  0LL,  0LL,  self,  "_didSelectPairAppleRemoteItem:"));

    objc_initWeak(&from, self);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_1000B8560;
    v60[3] = &unk_10018E9B0;
    objc_copyWeak(&v61, &from);
    [v53 setUpdateBlock:v60];
    objc_destroyWeak(&v61);
    objc_destroyWeak(&from);
  }

  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v24 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v25 = TSKLocString(@"RCRemotesGroupTitle");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v52 = -[TSKSettingGroup initWithTitle:](v24, "initWithTitle:", v26);

  -[NSMutableArray addObject:](v23, "addObject:", v51);
  if (v53) {
    -[NSMutableArray addObject:](v23, "addObject:", v53);
  }
  uint64_t v27 = TSKLocString(@"RCSystemPairingsTitle");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = TSKLocString(@"RCSystemPairingsInstructionalText");
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v28,  v30,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsSystemPairingsViewController));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  [v32 setEnabledInStoreDemoMode:0];
  -[NSMutableArray addObject:](v23, "addObject:", v32);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1000B85D8;
  void v58[3] = &unk_100193A60;
  v58[4] = self;
  id v33 = v3;
  id v59 = v33;
  id v34 = objc_retainBlock(v58);
  uint64_t v35 = ((uint64_t (*)(void *, uint64_t))v34[2])(v34, 1LL);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[NSMutableArray addObject:](v23, "addObject:", v36);

  -[TSKSettingGroup setSettingItems:](v52, "setSettingItems:", v23);
  -[NSMutableArray addObject:](v54, "addObject:", v52);
  remotesFacade = self->_remotesFacade;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1000B87B8;
  v55[3] = &unk_100193A88;
  objc_copyWeak(&v57, &location);
  id v38 = v33;
  id v56 = v38;
  id v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  remotesFacade,  @"thirdPartyConfigurations",  v55));
  id v40 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v41 = ((uint64_t (*)(void *, void))v34[2])(v34, 0LL);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v71 = v42;
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
  -[TSKSettingGroup setSettingItems:](v40, "setSettingItems:", v43);

  uint64_t v44 = TSKLocString(@"RCLearnedRemotesSectionTitle");
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v70[0] = v40;
  v70[1] = v39;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v45,  v46));

  -[NSMutableArray addObject:](v54, "addObject:", v47);
  id v48 = -[NSMutableArray copy](v54, "copy");

  objc_destroyWeak(&v57);
  objc_destroyWeak(&v64);

  objc_destroyWeak(&location);
  return v48;
}

- (id)_systemControlSettingsGroups
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[TVSettingsRemotesViewController _addPowerMenuItemsTo:](self, "_addPowerMenuItemsTo:", v4);
  -[TVSettingsRemotesViewController _addVolumeMenuItemsTo:](self, "_addVolumeMenuItemsTo:", v4);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v6 = TSKLocString(@"RCSystemControlGroupTitle");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = -[TSKSettingGroup initWithTitle:](v5, "initWithTitle:", v7);

  -[TSKSettingGroup setSettingItems:](v8, "setSettingItems:", v4);
  -[NSMutableArray addObject:](v3, "addObject:", v8);
  id v9 = -[NSMutableArray copy](v3, "copy");

  return v9;
}

- (void)_addPowerMenuItemsTo:(id)a3
{
  id v5 = a3;
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v6 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  0LL));
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 5LL, v6);
  }

  uint64_t v7 = TSKLocString(@"RCCECPowerTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v8,  0LL,  0LL,  0LL,  self,  "_togglePowerItem:"));

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B8BBC;
  v11[3] = &unk_10018E9B0;
  objc_copyWeak(&v12, &location);
  [v9 setUpdateBlock:v11];
  [v5 addObject:v9];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_addVolumeMenuItemsTo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v7 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 5LL, v7);
  }

  uint64_t v8 = TSKLocString(@"RCVCTitle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  0LL,  0LL,  self,  "_didSelectVolumeControlItem:"));

  objc_initWeak(location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000B9070;
  v24[3] = &unk_10018E9B0;
  objc_copyWeak(&v25, location);
  [v10 setUpdateBlock:v24];
  [v5 addObject:v10];
  if (_os_feature_enabled_impl("CoreControl", "EXT_AS_VOLUME_UI"))
  {
    uint64_t v21 = v6;
    uint64_t v11 = TSKLocString(@"RCVolumeUITitle");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = TSKLocString(@"RCVolumeUIInstructionalText");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    avFacade = self->_avFacade;
    uint64_t v16 = TSKLocString(@"RCVolumeUIShow");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = TSKLocString(@"RCVolumeUIHide");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v12,  v14,  avFacade,  @"displayVolumeUI",  v17,  v19));

    objc_initWeak(&v23, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000B9244;
    v22[3] = &unk_10018E608;
    v22[4] = self;
    [v20 setUpdateBlock:v22];
    [v5 addObject:v20];
    objc_destroyWeak(&v23);

    uint64_t v6 = v21;
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
}

- (BOOL)_showLearnedRemotes
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  4LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesFacade thirdPartyConfigurations](self->_remotesFacade, "thirdPartyConfigurations"));
  if ([v4 count]) {
    unsigned __int8 v5 = [v3 isReadyForUse];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_canProgramBluetoothRemote
{
  return +[TVSBluetoothRemoteUtilities isAnyRemoteConnected]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "isAnyRemoteConnected");
}

- (void)_showSystemControlUnavailableDialog
{
  uint64_t v3 = TSKLocString(@"RCSystemControlUnavailableTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"RCSystemControlUnavailableMessage");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  uint64_t v7 = TSKLocString(@"RCSystemControlUnavailableOKButton");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));

  [v11 addAction:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v10 presentViewController:v11 animated:1 completion:0];
}

- (void)_learnNewRemote
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsLearnRemoteViewController);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration basicConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "basicConfigurationForDeviceWithUUID:",  0LL));
  -[TVSettingsLearnRemoteViewController setConfiguration:](v3, "setConfiguration:", v4);

  objc_initWeak(&location, self);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_1000B957C;
  id v9 = &unk_1001936C8;
  objc_copyWeak(&v10, &location);
  -[TVSettingsLearnRemoteViewController setCompletionHandler:](v3, "setCompletionHandler:", &v6);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController", v6, v7, v8, v9));
  [v5 pushViewController:v3 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_showLearnedRemoteOptionsAlertForDevice:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TSKLocString(@"RCLearnRemoteBasicSetUpCompleteDescriptionText");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v7));

  uint64_t v10 = TSKLocString(@"RCLearnRemoteSetUpCompleteDialogTitle");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  v25,  1LL));

  uint64_t v13 = TSKLocString(@"RCLearnRemoteFinishedOkayButtonTitle");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B98B4;
  v30[3] = &unk_10018F018;
  v30[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  v30));

  [v12 addAction:v15];
  uint64_t v16 = TSKLocString(@"RCLearnRemoteFinishedSetUpExtendedButtonTitle");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000B9900;
  v28[3] = &unk_10018F040;
  v28[4] = self;
  id v18 = v6;
  id v29 = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v28));

  [v12 addAction:v19];
  uint64_t v20 = TSKLocString(@"RCLearnRemoteFinishedSetUpGuideButtonTitle");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000B990C;
  v26[3] = &unk_10018F040;
  v26[4] = self;
  id v27 = v18;
  id v22 = v18;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  v26));

  [v12 addAction:v23];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v24 presentViewController:v12 animated:1 completion:0];
}

- (void)_setUpPlaybackButtonsForRemoteWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsLearnRemoteViewController);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration playbackConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "playbackConfigurationForDeviceWithUUID:",  v4));
  -[TVSettingsLearnRemoteViewController setConfiguration:](v5, "setConfiguration:", v6);

  objc_initWeak(&location, self);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1000B9ACC;
  uint64_t v16 = &unk_1001936C8;
  objc_copyWeak(&v17, &location);
  -[TVSettingsLearnRemoteViewController setCompletionHandler:](v5, "setCompletionHandler:", &v13);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRemotesViewController navigationController]( self,  "navigationController",  v13,  v14,  v15,  v16));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v9 = [v8 mutableCopy];

  uint64_t v10 = (TVSettingsRemotesViewController *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
  if (v10 != self)
  {
    do
    {
      [v9 removeLastObject];
      id v11 = (TVSettingsRemotesViewController *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

      uint64_t v10 = v11;
    }

    while (v11 != self);
  }

  [v9 addObject:v5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v12 setViewControllers:v9 animated:1];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_setUpGuideButtonsForRemoteWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsLearnRemoteViewController);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration guideConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "guideConfigurationForDeviceWithUUID:",  v4));
  -[TVSettingsLearnRemoteViewController setConfiguration:](v5, "setConfiguration:", v6);

  objc_initWeak(&location, self);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1000B9D28;
  uint64_t v16 = &unk_1001936C8;
  objc_copyWeak(&v17, &location);
  -[TVSettingsLearnRemoteViewController setCompletionHandler:](v5, "setCompletionHandler:", &v13);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRemotesViewController navigationController]( self,  "navigationController",  v13,  v14,  v15,  v16));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v9 = [v8 mutableCopy];

  uint64_t v10 = (TVSettingsRemotesViewController *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
  if (v10 != self)
  {
    do
    {
      [v9 removeLastObject];
      id v11 = (TVSettingsRemotesViewController *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

      uint64_t v10 = v11;
    }

    while (v11 != self);
  }

  [v9 addObject:v5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v12 setViewControllers:v9 animated:1];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_showLearnedRemoteFinishedAlertWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TSKLocString(@"RCLearnRemoteExtendedSetUpCompleteDescriptionText");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));

  uint64_t v8 = TSKLocString(@"RCLearnRemoteSetUpCompleteDialogTitle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v7,  1LL));

  uint64_t v11 = TSKLocString(@"RCLearnRemoteFinishedOkayButtonTitle");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B9F2C;
  v15[3] = &unk_10018F018;
  v15[4] = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  v15));

  [v10 addAction:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController navigationController](self, "navigationController"));
  [v14 presentViewController:v10 animated:1 completion:0];
}

- (void)_fetchAppleRemotePairedState
{
}

- (void)_updateAppleRemotePairedStateWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4
    && !-[TVSettingsRemotesViewController isUpdatingPairedAppleRemoteState](self, "isUpdatingPairedAppleRemoteState"))
  {
    -[TVSettingsRemotesViewController setUpdatingPairedAppleRemoteState:]( self,  "setUpdatingPairedAppleRemoteState:",  1LL);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000BA060;
    v5[3] = &unk_10018EC08;
    void v5[4] = self;
    v4[2](v4, v5);
  }
}

- (void)_updateAudioEndpointInfo
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB270();
  }
  -[TVSettingsRemotesViewController setCachedAudioOutputDeviceType:](self, "setCachedAudioOutputDeviceType:", 0LL);
  -[TVSettingsRemotesViewController setCachedAudioOutputDeviceSubtype:](self, "setCachedAudioOutputDeviceSubtype:", 0LL);
  uint64_t SharedSystemAudioContext = MRAVOutputContextGetSharedSystemAudioContext( -[TVSettingsRemotesViewController setCachedAudioOutputIsHomeTheater:]( self,  "setCachedAudioOutputIsHomeTheater:",  0LL));
  uint64_t UniqueIdentifier = MRAVOutputContextGetUniqueIdentifier(SharedSystemAudioContext);
  if (MRAVEndpointGetLocalEndpoint(UniqueIdentifier))
  {
    uint64_t v5 = (void *)MRAVEndpointCopyOutputDevices();
    if ([v5 count])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB1FC();
      }
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      -[TVSettingsRemotesViewController setCachedAudioOutputDeviceType:]( self,  "setCachedAudioOutputDeviceType:",  [v6 deviceType]);
      -[TVSettingsRemotesViewController setCachedAudioOutputDeviceSubtype:]( self,  "setCachedAudioOutputDeviceSubtype:",  [v6 deviceSubtype]);
      unsigned int v7 = [v6 clusterType];
      -[TVSettingsRemotesViewController setCachedAudioOutputIsHomeTheater:]( self,  "setCachedAudioOutputIsHomeTheater:",  v7 == 2);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB140(self, v7 == 2);
      }
      -[TVSettingsRemotesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    }

    else
    {
      BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v16) {
        sub_1000FB10C(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }

  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_1000FB0D8(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

- (BOOL)_isAudioUsingARC
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localAccessory]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 room]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hmRoom]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessories]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = HMAccessoryCategoryTypeHomePod;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "category", (void)v25));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 categoryType]);
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v11);
  }

  else {
    BOOL v18 = 0;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
  id v20 = [v19 eARCStatus];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
  id v22 = [v21 eARCStatus];

  if (!v18) {
    return 0;
  }
  BOOL result = -[TVSettingsRemotesViewController _isAudioUsingHomeTheater](self, "_isAudioUsingHomeTheater");
  if (v20 != (id)2 && v22 != (id)3) {
    return 0;
  }
  return result;
}

- (BOOL)_isAudioUsingBTHeadphones
{
  return -[TVSettingsRemotesViewController cachedAudioOutputDeviceType](self, "cachedAudioOutputDeviceType") == 2
      && -[TVSettingsRemotesViewController cachedAudioOutputDeviceSubtype](self, "cachedAudioOutputDeviceSubtype") == 2;
}

- (BOOL)_isAudioUsingBTSpeakers
{
  return -[TVSettingsRemotesViewController cachedAudioOutputDeviceType](self, "cachedAudioOutputDeviceType") == 2
      && -[TVSettingsRemotesViewController cachedAudioOutputDeviceSubtype](self, "cachedAudioOutputDeviceSubtype") == 1;
}

- (BOOL)_isAudioUsingAirPlayOther
{
  return -[TVSettingsRemotesViewController cachedAudioOutputDeviceType](self, "cachedAudioOutputDeviceType") == 1;
}

- (id)stringForCurrentVolumePolicy
{
  unsigned int v3 = -[TVSettingsRemotesViewController _isAudioUsingARC](self, "_isAudioUsingARC");
  unsigned int v4 = -[TVSettingsRemotesViewController _isAudioUsingBTHeadphones](self, "_isAudioUsingBTHeadphones");
  unsigned int v5 = -[TVSettingsRemotesViewController _isAudioUsingBTSpeakers](self, "_isAudioUsingBTSpeakers");
  unsigned int v6 = -[TVSettingsRemotesViewController _isAudioUsingHomeTheater](self, "_isAudioUsingHomeTheater");
  unsigned int v7 = -[TVSettingsRemotesViewController _isAudioUsingAirPlayOther](self, "_isAudioUsingAirPlayOther");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesViewController externalControlSystem](self, "externalControlSystem"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  unsigned int v10 = [v9 isAutomaticallyConfigured];
  unsigned int v11 = [v9 isEnabled];
  id v12 = [v9 transport];
  id v13 = [v9 transport];
  if (!v3)
  {
    if ((v11 & v10) == 1)
    {
      if (v4)
      {
        uint64_t v17 = @"RCVCAutoViaAirPodsValue";
LABEL_13:
        uint64_t v21 = TSKLocString(v17);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
        goto LABEL_14;
      }

      if (v5)
      {
        uint64_t v17 = @"RCVCAutoViaBTSpeakersValue";
        goto LABEL_13;
      }

      if (v6)
      {
        uint64_t v17 = @"RCVCAutoViaOdeonValue";
        goto LABEL_13;
      }

      if (v7)
      {
        uint64_t v17 = @"RCVCAutoViaOtherAirPlayValue";
        goto LABEL_13;
      }

      if (v12 == (id)2)
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveVolumeButtonConfiguration]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v35 configurationName]);

        if ([v19 length])
        {
          id v20 = @"RCVCAutoViaIRWithNameValue";
          goto LABEL_51;
        }

        BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (!v26) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }

      if (v13 != (id)1)
      {
        BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v38) {
          sub_1000FB318(v38, v39, v40, v41, v42, v43, v44, v45);
        }
        uint64_t v17 = @"RCVCAutoUnknownValue";
        goto LABEL_13;
      }

      id v36 = [v8 volumeControlTargetDeviceType];
      if (v36 == (id)1)
      {
        v37 = @"RCVCCECVolumeControlTV";
      }

      else
      {
        if (v36 != (id)2)
        {
          uint64_t v19 = 0LL;
          goto LABEL_46;
        }

        v37 = @"RCVCCECVolumeControlAVR";
      }

      uint64_t v46 = TSKLocString(v37);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v46);
LABEL_46:
      if ([v19 length])
      {
        id v20 = @"RCVCAutoViaCECWithNameValue";
        goto LABEL_51;
      }

      BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v47) {
        sub_1000FB2E4(v47, v48, v49, v50, v51, v52, v53, v54);
      }
      goto LABEL_50;
    }

    if (!v11)
    {
      uint64_t v17 = @"RCVCOffValue";
      goto LABEL_13;
    }

    if (v12 == (id)2)
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveVolumeButtonConfiguration]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 configurationName]);

      if ([v19 length])
      {
        id v20 = @"RCVCManualViaIRMenuItemTemplate";
LABEL_51:
        uint64_t v55 = TSKLocString(v20);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v55);
        goto LABEL_15;
      }

      BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (!v26)
      {
LABEL_25:
        id v20 = @"RCVCManualViaIRNoNameMenuItemTemplate";
        goto LABEL_51;
      }

- (TVSettingsSelectIRConfigurationViewController)selectIRConfigurationViewController
{
  return (TVSettingsSelectIRConfigurationViewController *)objc_loadWeakRetained((id *)&self->_selectIRConfigurationViewController);
}

- (void)setSelectIRConfigurationViewController:(id)a3
{
}

- (BOOL)isUpdatingPairedAppleRemoteState
{
  return self->_updatingPairedAppleRemoteState;
}

- (void)setUpdatingPairedAppleRemoteState:(BOOL)a3
{
  self->_updatingPairedAppleRemoteState = a3;
}

- (BOOL)isPairedWithAppleRemote
{
  return self->_pairedWithAppleRemote;
}

- (void)setPairedWithAppleRemote:(BOOL)a3
{
  self->_pairedWithAppleRemote = a3;
}

- (PBSExternalControlSystem)externalControlSystem
{
  return self->_externalControlSystem;
}

- (void)setExternalControlSystem:(id)a3
{
}

- (TVSettingsBluetoothFacade)bluetoothFacade
{
  return self->_bluetoothFacade;
}

- (void)setBluetoothFacade:(id)a3
{
}

- (TVSettingsRemotesFacade)remotesFacade
{
  return self->_remotesFacade;
}

- (void)setRemotesFacade:(id)a3
{
}

- (TVSettingsAudioVideoFacade)avFacade
{
  return self->_avFacade;
}

- (void)setAvFacade:(id)a3
{
}

- (TVSettingsContinuityCameraFacade)continuityCameraFacade
{
  return self->_continuityCameraFacade;
}

- (void)setContinuityCameraFacade:(id)a3
{
}

- (unsigned)cachedAudioOutputDeviceType
{
  return self->_cachedAudioOutputDeviceType;
}

- (void)setCachedAudioOutputDeviceType:(unsigned int)a3
{
  self->_cachedAudioOutputDeviceType = a3;
}

- (unsigned)cachedAudioOutputDeviceSubtype
{
  return self->_cachedAudioOutputDeviceSubtype;
}

- (void)setCachedAudioOutputDeviceSubtype:(unsigned int)a3
{
  self->_cachedAudioOutputDeviceSubtype = a3;
}

- (BOOL)cachedAudioOutputIsHomeTheater
{
  return self->_cachedAudioOutputIsHomeTheater;
}

- (void)setCachedAudioOutputIsHomeTheater:(BOOL)a3
{
  self->_cachedAudioOutputIsHomeTheater = a3;
}

- (void).cxx_destruct
{
}

@end