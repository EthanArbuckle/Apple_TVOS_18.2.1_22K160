@interface AXTVBrailleBluetoothListViewController
- (AXTVBrailleBluetoothListViewController)initWithStyle:(int64_t)a3;
- (AXTVBrailleManager)brailleManager;
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
- (void)bluetoothManager:(id)a3 presentBuiltInPairingPinForDevice:(id)a4;
- (void)bluetoothManager:(id)a3 presentGeneratedPairingPIN:(int64_t)a4 forDevice:(id)a5;
- (void)dealloc;
- (void)digitEntryViewControllerDidCancel:(id)a3;
- (void)digitEntryViewControllerDidFinish:(id)a3;
- (void)setBrailleManager:(id)a3;
- (void)setErrorAlert:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVBrailleBluetoothListViewController

- (AXTVBrailleBluetoothListViewController)initWithStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AXTVBrailleBluetoothListViewController;
  v3 = -[AXTVBrailleBluetoothListViewController initWithStyle:](&v10, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AXTVBluetoothFacade);
    bluetoothFacade = v3->_bluetoothFacade;
    v3->_bluetoothFacade = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
    [v6 setDelegate:v3];
    v7 = objc_alloc_init(&OBJC_CLASS___AXTVBrailleManager);
    -[AXTVBrailleBluetoothListViewController setBrailleManager:](v3, "setBrailleManager:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v3 selector:"deviceInfoDidUpdate:" name:@"AXTVBluetoothDeviceInfoDidUpdateNotification" object:v3->_bluetoothFacade];
  }

  return v3;
}

- (void)dealloc
{
  if (self->_startedScanning) {
    -[AXTVBluetoothFacade stopScanning](self->_bluetoothFacade, "stopScanning");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController brailleManager](self, "brailleManager"));
  [v4 disconnectFromBrailleServer];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVBrailleBluetoothListViewController;
  -[AXTVBrailleBluetoothListViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXTVBrailleBluetoothListViewController;
  -[AXTVBrailleBluetoothListViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AXTVBluetoothCell);
  objc_super v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AXTVBluetoothCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];

  self->_startedScanning = 1;
  -[AXTVBluetoothFacade startScanning](self->_bluetoothFacade, "startScanning");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController brailleManager](self, "brailleManager"));
  [v8 connectToBrailleServer];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AXTVBrailleBluetoothListViewController;
  -[AXTVBrailleBluetoothListViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  id v11 = AXTVLocString(@"AXBrailleChooseDisplayDescription", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v13.receiver);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[AXTVBrailleBluetoothListViewController setTitle:](self, "setTitle:", v12);
}

- (id)loadSettingGroups
{
  uint64_t v4 = TSKLocString(@"BluetoothMyDevicesSectionTitle", v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  self->_bluetoothFacade,  @"myDevices",  &stru_66CB0));

  [v6 setComparesArrayDeeply:0];
  uint64_t v8 = TSKLocString(@"BluetoothOtherDevicesSectionTitle", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  bluetoothFacade = self->_bluetoothFacade;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_389A4;
  v14[3] = &unk_66D38;
  objc_copyWeak(&v15, &location);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v9,  bluetoothFacade,  @"otherDevices",  v14));

  [v11 setAutoHide:0];
  [v11 setAccessoryTypes:4];
  [v11 setComparesArrayDeeply:0];
  v17[0] = v6;
  v17[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBrailleBluetoothListViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
  uint64_t v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___AXTVBluetoothCell);
  id v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v12 forIndexPath:v6]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  [v13 setBluetoothDevice:v14];

  [v13 settingItem:v9 didUpdateMetadataWithGroup:v8];
  [v9 setDirty:0];

  return v13;
}

- (void)digitEntryViewControllerDidCancel:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance", a3));
  [v4 cancelPINPairing];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController"));
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)digitEntryViewControllerDidFinish:(id)a3
{
  id v11 = a3;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___AXTVBrailleBuiltInPINEntryViewController);
  if ((objc_opt_isKindOfClass(v11, v3) & 1) != 0)
  {
    id v4 = v11;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 digitGroupView]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
    [v7 continuePINPairing];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 device]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bluetoothDeviceObject]);
    [v8 setPincode:v6 forDevice:v10];
  }
}

- (void)bluetoothManager:(id)a3 presentBuiltInPairingPinForDevice:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController _devicePairingAction:](self, "_devicePairingAction:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));

  uint64_t v9 = TSKLocString(@"SettingsBTRequestHeader", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = -[AXTVBrailleBuiltInPINEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___AXTVBrailleBuiltInPINEntryViewController),  "initWithNumberOfDigits:",  4LL);
  -[AXTVBrailleBuiltInPINEntryViewController setDevice:](v11, "setDevice:", v5);

  -[AXTVBrailleBuiltInPINEntryViewController setDelegate:](v11, "setDelegate:", self);
  -[AXTVBrailleBuiltInPINEntryViewController setEditable:](v11, "setEditable:", 1LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBuiltInPINEntryViewController titleLabel](v11, "titleLabel"));
  [v12 setText:v10];

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBuiltInPINEntryViewController promptLabel](v11, "promptLabel"));
  [v13 setText:v17];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBuiltInPINEntryViewController digitGroupView](v11, "digitGroupView"));
  [v14 setSecure:1];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController"));
  [v15 pushViewController:v11 animated:1];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v16 startedPINPairing];
}

- (void)bluetoothManager:(id)a3 presentGeneratedPairingPIN:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController _devicePairingAction:](self, "_devicePairingAction:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);

  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));
  uint64_t v11 = TSKLocString(@"SettingsBTRequestHeader", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = -[TVSUIDigitEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___TVSUIDigitEntryViewController),  "initWithNumberOfDigits:",  4LL);
  -[TVSUIDigitEntryViewController setDelegate:](v13, "setDelegate:", self);
  -[TVSUIDigitEntryViewController setEditable:](v13, "setEditable:", 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController titleLabel](v13, "titleLabel"));
  [v14 setText:v12];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController promptLabel](v13, "promptLabel"));
  [v15 setText:v22];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController digitGroupView](v13, "digitGroupView"));
  [v16 setSecure:0];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController digitGroupView](v13, "digitGroupView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
  [v17 setText:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController"));
  [v20 pushViewController:v13 animated:1];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v21 startedPINPairing];
}

- (void)bluetoothManager:(id)a3 didAcceptPairingPINForDevice:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController", a3, a4));
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)bluetoothManager:(id)a3 didRejectPairingPINForDevice:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController errorAlert](self, "errorAlert"));

  if (!v5) {
    -[AXTVBrailleBluetoothListViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  156LL,  v6);
  }
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    -[AXTVBrailleBluetoothListViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  [v8 code],  v7);
    _AXTVBTLog(16LL, 5LL, @"Bluetooth connection error:  %@", v10, v11, v12, v13, v14, (uint64_t)v9);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController brailleManager](self, "brailleManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_391F4;
    v16[3] = &unk_66D60;
    id v17 = v7;
    [v15 loadDisplayForDevice:v17 errorHandler:v16];
  }
}

- (void)bluetoothManager:(id)a3 didCompleteDeviceDisconnection:(id)a4 error:(id)a5
{
  if (a5)
  {
    id v13 = a5;
    id v7 = a4;
    -[AXTVBrailleBluetoothListViewController _postAlertWithErrorCode:forDevice:]( self,  "_postAlertWithErrorCode:forDevice:",  [v13 code],  v7);

    _AXTVBTLog(16LL, 5LL, @"Bluetooth disconnection error:  %@", v8, v9, v10, v11, v12, (uint64_t)v13);
  }

- (void)_connectDevice:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);

  [v5 connectDevice:v4];
}

- (void)_postAlertWithErrorCode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController errorAlert](self, "errorAlert"));

  if (v7) {
    goto LABEL_19;
  }
  objc_initWeak(&location, self);
  if (a3 == 1)
  {
    if (([v6 isPaired] & 1) == 0)
    {
      uint64_t v21 = TSKLocString(@"BTErrorPairingTimeout", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v23 = TSKLocString(@"BTErrorGenericPairingFormat", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v24));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v19,  v25));

LABEL_14:
      id v15 = 0LL;
      goto LABEL_15;
    }

- (id)_devicePairingAction:(id)a3
{
  id v3 = a3;
  uint64_t v5 = TSKLocString(@"SettingsKeyBoardBTPairingInstructionsFormat", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));
  return v8;
}

- (UIAlertController)errorAlert
{
  return self->_errorAlert;
}

- (void)setErrorAlert:(id)a3
{
}

- (AXTVBrailleManager)brailleManager
{
  return self->_brailleManager;
}

- (void)setBrailleManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end