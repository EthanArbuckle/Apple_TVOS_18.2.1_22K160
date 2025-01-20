@interface TVSettingsBluetoothViewController
+ (id)_genericErrorStringWithDevice:(id)a3;
+ (id)_genericPairingErrorStringWithDevice:(id)a3;
+ (id)_linkErrorStringWithDevice:(id)a3;
+ (id)_unsupportedDeviceErrorStringWithDevice:(id)a3;
- (TVSettingsBluetoothViewController)initWithFacade:(id)a3;
- (UIAlertController)errorAlert;
- (id)_devicePairingAction:(id)a3;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_connectDevice:(id)a3;
- (void)_postAlertWithErrorCode:(int64_t)a3 forDevice:(id)a4;
- (void)bluetoothManager:(id)a3 didAcceptPairingPINForDevice:(id)a4;
- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5;
- (void)bluetoothManager:(id)a3 didCompleteDeviceDisconnection:(id)a4 error:(id)a5;
- (void)bluetoothManager:(id)a3 didRejectPairingPINForDevice:(id)a4;
- (void)bluetoothManager:(id)a3 presentPairingPIN:(int64_t)a4 forDevice:(id)a5;
- (void)bluetoothManager:(id)a3 requestPairingPIN:(id)a4;
- (void)dealloc;
- (void)digitEntryViewControllerDidCancel:(id)a3;
- (void)digitEntryViewControllerDidFinish:(id)a3;
- (void)setErrorAlert:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsBluetoothViewController

- (TVSettingsBluetoothViewController)initWithFacade:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothViewController;
  v6 = -[TVSettingsBluetoothViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bluetoothFacade, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    [v8 setDelegate:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v7 selector:"deviceInfoDidUpdate:" name:@"TVSettingsBluetoothDeviceInfoDidUpdateNotification" object:v7->_bluetoothFacade];
  }

  return v7;
}

- (void)dealloc
{
  if (self->_startedScanning) {
    -[TVSettingsBluetoothFacade stopScanning](self->_bluetoothFacade, "stopScanning");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothViewController;
  -[TVSettingsBluetoothViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothViewController;
  -[TVSettingsBluetoothViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];

  self->_startedScanning = 1;
  -[TVSettingsBluetoothFacade startScanning](self->_bluetoothFacade, "startScanning");
}

- (id)loadSettingGroups
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"BluetoothGameControllerHelpItemTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  &stru_100194660));

  [v6 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v3, "addObject:", v6);
  uint64_t v7 = TSKLocString(@"BluetoothAirPodsRoutingSuggestionTitle");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  bluetoothFacade = self->_bluetoothFacade;
  uint64_t v10 = TSKLocString(@"BluetoothAirPodsRoutingSuggestionOn");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = TSKLocString(@"BluetoothAirPodsRoutingSuggestionOff");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v8,  0LL,  bluetoothFacade,  @"isAirPodsRoutingSuggestionEnabled",  v11,  v13));

  -[NSMutableArray addObject:](v3, "addObject:", v14);
  v15 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  -[TSKSettingGroup setSettingItems:](v15, "setSettingItems:", v3);
  uint64_t v16 = TSKLocString(@"BluetoothMyDevicesSectionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v17,  self->_bluetoothFacade,  @"myDevices",  &stru_1001946A0));

  [v18 setComparesArrayDeeply:0];
  uint64_t v19 = TSKLocString(@"BluetoothOtherDevicesSectionTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = self->_bluetoothFacade;
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_1000D3654;
  v28 = &unk_100194728;
  objc_copyWeak(&v29, &location);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v20,  v21,  @"otherDevices",  &v25));

  objc_msgSend(v22, "setAutoHide:", 0, v25, v26, v27, v28);
  [v22 setAccessoryTypes:4];
  [v22 setComparesArrayDeeply:0];
  v31[0] = v15;
  v31[1] = v18;
  v31[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  return v23;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsBluetoothViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v7 section]));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothCell);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v15 forIndexPath:v7]);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    [v16 setBluetoothDevice:v17];

    [v16 settingItem:v9 didUpdateMetadataWithGroup:v8];
    [v9 setDirty:0];
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothViewController;
    id v18 = -[TVSettingsBluetoothViewController tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  return v16;
}

- (void)digitEntryViewControllerDidCancel:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", a3));
  [v4 cancelPINPairing];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController navigationController](self, "navigationController"));
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)digitEntryViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 digitGroupView]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 text]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingDevice]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController navigationController](self, "navigationController"));
  id v8 = [v7 popToViewController:self animated:1];

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    [v9 enteredPIN:v5 forDevice:v6];
  }
}

- (void)bluetoothManager:(id)a3 presentPairingPIN:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController _devicePairingAction:](self, "_devicePairingAction:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  uint64_t v11 = TSKLocString(@"SettingsBTRequestHeader");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[TVSUIEditableDigitEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___TVSUIEditableDigitEntryViewController),  "initWithNumberOfDigits:",  4LL);
  -[TVSUIEditableDigitEntryViewController setDelegate:](v13, "setDelegate:", self);
  -[TVSUIEditableDigitEntryViewController setEditable:](v13, "setEditable:", 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController titleLabel](v13, "titleLabel"));
  [v14 setText:v12];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController promptLabel](v13, "promptLabel"));
  [v15 setText:v10];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController digitGroupView](v13, "digitGroupView"));
  [v16 setSecure:0];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController digitGroupView](v13, "digitGroupView"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
  [v17 setText:v19];

  -[TVSUIEditableDigitEntryViewController setPairingDevice:](v13, "setPairingDevice:", 0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Presenting PIN for device: %@",  buf,  0xCu);
  }

  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController navigationController](self, "navigationController"));
  [v20 pushViewController:v13 animated:1];
}

- (void)bluetoothManager:(id)a3 requestPairingPIN:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController _devicePairingAction:](self, "_devicePairingAction:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));

  uint64_t v9 = TSKLocString(@"SettingsBTRequestHeader");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = -[TVSUIEditableDigitEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___TVSUIEditableDigitEntryViewController),  "initWithNumberOfDigits:",  4LL);
  -[TVSUIEditableDigitEntryViewController setDelegate:](v11, "setDelegate:", self);
  -[TVSUIEditableDigitEntryViewController setEditable:](v11, "setEditable:", 1LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController titleLabel](v11, "titleLabel"));
  [v12 setText:v10];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController promptLabel](v11, "promptLabel"));
  [v13 setText:v8];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIEditableDigitEntryViewController digitGroupView](v11, "digitGroupView"));
  [v14 setSecure:0];

  -[TVSUIEditableDigitEntryViewController setPairingDevice:](v11, "setPairingDevice:", v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Requesting PIN for device: %@",  buf,  0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController navigationController](self, "navigationController"));
  [v15 pushViewController:v11 animated:1];
}

- (void)bluetoothManager:(id)a3 didAcceptPairingPINForDevice:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController navigationController](self, "navigationController", a3, a4));
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)bluetoothManager:(id)a3 didRejectPairingPINForDevice:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController errorAlert](self, "errorAlert"));

  if (!v5) {
    -[TVSettingsBluetoothViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  156LL,  v6);
  }
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    -[TVSettingsBluetoothViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  [v10 code],  v9);
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v12 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v5, &_os_log_default, 65LL, 0LL, 3LL, v12);
    }
  }
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceDisconnection:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    -[TVSettingsBluetoothViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  [v10 code],  v9);
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v12 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v5, &_os_log_default, 65LL, 0LL, 3LL, v12);
    }
  }
}

- (void)_connectDevice:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  unsigned __int8 v5 = [v4 isPairing];

  if ((v5 & 1) != 0)
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v6 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v6);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    [v7 connectDevice:v8];
  }
}

- (void)_postAlertWithErrorCode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothViewController errorAlert](self, "errorAlert"));

  if (v7) {
    goto LABEL_23;
  }
  objc_initWeak(&location, self);
  if (a3 > 150)
  {
    if (a3 != 151)
    {
      if (a3 != 156) {
        goto LABEL_10;
      }
      uint64_t v14 = TSKLocString(@"BTErrorWrongPincode");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
LABEL_18:
      id v9 = (void *)v15;
      goto LABEL_19;
    }

+ (id)_genericErrorStringWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if (v4 == (id)2)
  {
    id v6 = @"BTErrorKeyboardGenericFormat";
  }

  else if (v4 == (id)4)
  {
    id v6 = @"BTErrorGameControllerGenericFormat";
  }

  else if (v4 == (id)3)
  {
    unsigned __int8 v5 = (char *)[v3 headsetType] - 1;
    else {
      id v6 = *(&off_100194748 + (void)v5);
    }
  }

  else
  {
    id v6 = @"BTErrorGenericFormat";
  }

  uint64_t v7 = TSKLocString(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  return v10;
}

+ (id)_genericPairingErrorStringWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if (v4 == (id)2)
  {
    id v6 = @"BTErrorKeyboardGenericPairingFormat";
  }

  else if (v4 == (id)4)
  {
    id v6 = @"BTErrorGameControllerGenericPairingFormat";
  }

  else if (v4 == (id)3)
  {
    unsigned __int8 v5 = (char *)[v3 headsetType] - 1;
    else {
      id v6 = *(&off_1001947B8 + (void)v5);
    }
  }

  else
  {
    id v6 = @"BTErrorGenericPairingFormat";
  }

  uint64_t v7 = TSKLocString(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  return v10;
}

+ (id)_linkErrorStringWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if (v4 == (id)2)
  {
    id v6 = @"BTErrorKeyboardLinkKey";
  }

  else if (v4 == (id)4)
  {
    id v6 = @"BTErrorGameControllerLinkKey";
  }

  else if (v4 == (id)3)
  {
    unsigned __int8 v5 = (char *)[v3 headsetType] - 1;
    else {
      id v6 = *(&off_100194828 + (void)v5);
    }
  }

  else
  {
    id v6 = @"BTErrorLinkKey";
  }

  uint64_t v7 = TSKLocString(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  return v10;
}

+ (id)_unsupportedDeviceErrorStringWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if (v4 == (id)2)
  {
    id v6 = @"BTErrorKeyboardUnsupportedDeviceFormat";
  }

  else if (v4 == (id)4)
  {
    id v6 = @"BTErrorGameControllerUnsupportedDeviceFormat";
  }

  else if (v4 == (id)3)
  {
    unsigned __int8 v5 = (char *)[v3 headsetType] - 1;
    else {
      id v6 = *(&off_100194898 + (void)v5);
    }
  }

  else
  {
    id v6 = @"BTErrorUnsupportedDeviceFormat";
  }

  uint64_t v7 = TSKLocString(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

  return v10;
}

- (id)_devicePairingAction:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)3) {
    id v4 = @"SettingsAudioBTPairingInstructionsFormat";
  }
  else {
    id v4 = @"SettingsKeyBoardBTPairingInstructionsFormat";
  }
  uint64_t v5 = TSKLocString(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));
  return v8;
}

- (UIAlertController)errorAlert
{
  return self->_errorAlert;
}

- (void)setErrorAlert:(id)a3
{
}

- (void).cxx_destruct
{
}

@end