@interface AXTVBrailleBluetoothItemViewController
- (AXTVBluetoothDevice)bluetoothDevice;
- (id)loadSettingGroups;
- (void)_connectDevice:(id)a3;
- (void)_disconnectDevice:(id)a3;
- (void)_findInfoForAccessory:(id)a3;
- (void)_unpairDevice:(id)a3;
- (void)_updateDevice:(id)a3;
- (void)setBluetoothDevice:(id)a3;
@end

@implementation AXTVBrailleBluetoothItemViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice"));
  BOOL v4 = [v3 type] == (char *)&dword_0 + 1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice"));
  v70 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = TSKLocString(@"BluetoothConnectDeviceTitle", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v8,  0LL,  0LL,  0LL,  self,  "_connectDevice:"));

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_3B7F0;
  v85[3] = &unk_66DC8;
  id v10 = v5;
  id v86 = v10;
  BOOL v87 = v4;
  [v9 setUpdateBlock:v85];
  -[NSMutableArray addObject:](v70, "addObject:", v9);
  if (v4) {
    v12 = @"BluetoothDisconnectRemoteTitle";
  }
  else {
    v12 = @"BluetoothDisconnectDeviceTitle";
  }
  uint64_t v13 = TSKLocString(v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  0LL,  0LL,  self,  "_disconnectDevice:"));

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_3B844;
  v82[3] = &unk_66DC8;
  BOOL v84 = v4;
  id v16 = v10;
  id v83 = v16;
  [v15 setUpdateBlock:v82];
  -[NSMutableArray addObject:](v70, "addObject:", v15);
  if (v4) {
    v18 = @"BluetoothForgetRemoteTitle";
  }
  else {
    v18 = @"BluetoothForgetDeviceTitle";
  }
  uint64_t v19 = TSKLocString(v18, v17);
  v69 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v69,  0LL,  0LL,  0LL,  self,  "_unpairDevice:"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_3B8B8;
  v79[3] = &unk_66DC8;
  BOOL v81 = v4;
  id v21 = v16;
  id v80 = v21;
  [v20 setUpdateBlock:v79];
  -[NSMutableArray addObject:](v70, "addObject:", v20);
  objc_initWeak(&location, self);
  uint64_t v23 = TSKLocString(@"BluetoothFindAppForAccessory", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v24,  0LL,  0LL,  0LL,  self,  "_findInfoForAccessory:"));

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_3B920;
  v76[3] = &unk_65798;
  objc_copyWeak(&v77, &location);
  [v25 setUpdateBlock:v76];
  -[NSMutableArray addObject:](v70, "addObject:", v25);
  uint64_t v27 = TSKLocString(@"BluetoothUpdateDeviceTitle", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v28,  0LL,  0LL,  0LL,  self,  "_updateDevice:"));

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_3B980;
  v73[3] = &unk_66DC8;
  BOOL v75 = v4;
  id v30 = v21;
  id v74 = v30;
  [v29 setUpdateBlock:v73];
  -[NSMutableArray addObject:](v70, "addObject:", v29);
  uint64_t v32 = TSKLocString(@"BluetoothSetupSectionTitle", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v33,  v70));

  v35 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v37 = TSKLocString(@"BluetoothInfoManufacturerTitle", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v38,  0LL,  self->_bluetoothDevice,  @"manufacturer"));

  [v39 setUpdateBlock:&stru_66DE8];
  -[NSMutableArray addObject:](v35, "addObject:", v39);
  uint64_t v41 = TSKLocString(@"BluetoothInfoModelNumberTitle", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v42,  0LL,  self->_bluetoothDevice,  @"modelNumber"));

  [v43 setUpdateBlock:&stru_66E08];
  -[NSMutableArray addObject:](v35, "addObject:", v43);
  uint64_t v45 = TSKLocString(@"BluetoothInfoSerialNumberTitle", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v46,  0LL,  self->_bluetoothDevice,  @"serialNumber"));

  [v47 setUpdateBlock:&stru_66E28];
  -[NSMutableArray addObject:](v35, "addObject:", v47);
  uint64_t v49 = TSKLocString(@"BluetoothInfoFirmwareVersionTitle", v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v50,  0LL,  self->_bluetoothDevice,  @"firmwareVersion"));

  [v51 setUpdateBlock:&stru_66E48];
  -[NSMutableArray addObject:](v35, "addObject:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  @"MT Firmware Version (Internal)",  0LL,  self->_bluetoothDevice,  @"multitouchFirmwareVersion"));

  [v52 setUpdateBlock:&stru_66E68];
  -[NSMutableArray addObject:](v35, "addObject:", v52);
  uint64_t v54 = TSKLocString(@"BluetoothInfoHardwareVersionTitle", v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v55,  0LL,  self->_bluetoothDevice,  @"hardwareVersion"));

  [v56 setUpdateBlock:&stru_66E88];
  -[NSMutableArray addObject:](v35, "addObject:", v56);
  uint64_t v58 = TSKLocString(@"BluetoothInfoBatteryLevelTitle", v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v59,  0LL,  self->_bluetoothDevice,  @"batteryLevel"));

  v61 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v61, "setNumberStyle:", 3LL);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_3BB64;
  v71[3] = &unk_65228;
  v62 = v61;
  v72 = v62;
  [v60 setUpdateBlock:v71];
  -[NSMutableArray addObject:](v35, "addObject:", v60);
  uint64_t v64 = TSKLocString(@"BluetoothInfoSectionTitle", v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v65,  v35));

  [v66 setCanFocus:0];
  v88[0] = v34;
  v88[1] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 2LL));

  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);

  return v67;
}

- (void)_disconnectDevice:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController navigationController](self, "navigationController"));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (void)_unpairDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice"));
  uint64_t v7 = (char *)[v6 type];

  uint64_t v9 = TSKLocString(@"BluetoothDisconnectDeviceMessage", v8);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v7 == (_BYTE *)&dword_0 + 1)
  {
    uint64_t v12 = TSKLocString(@"BluetoothDisconnectRemoteMessage", v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice"));
    unsigned int v15 = [v14 isMagicPaired];

    if (!v15) {
      goto LABEL_6;
    }
    uint64_t v17 = TSKLocString(@"BluetoothUnpairMagicPairedDeviceMessage", v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v20));

    uint64_t v11 = (void *)v18;
  }

  uint64_t v11 = (void *)v13;
LABEL_6:
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v11,  1LL));
  if (v7 == (_BYTE *)&dword_0 + 1) {
    uint64_t v23 = @"BluetoothForgetRemoteTitle";
  }
  else {
    uint64_t v23 = @"BluetoothForgetDeviceTitle";
  }
  uint64_t v24 = TSKLocString(v23, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_initWeak(&location, self->_bluetoothDevice);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_3BF58;
  v31[3] = &unk_651D8;
  objc_copyWeak(&v32, &location);
  v31[4] = self;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  2LL,  v31));
  [v22 addAction:v26];
  uint64_t v28 = TSKLocString(@"Cancel", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  1LL,  0LL));

  [v22 addAction:v30];
  -[AXTVBrailleBluetoothItemViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v22,  1LL,  0LL);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)_connectDevice:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController navigationController](self, "navigationController"));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (void)_findInfoForAccessory:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothItemViewController bluetoothDevice](self, "bluetoothDevice", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvset_lookupURL"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_3C0DC;
  v7[3] = &unk_66EB0;
  id v8 = v4;
  id v6 = v4;
  [v5 openURL:v6 options:&__NSDictionary0__struct completionHandler:v7];
}

- (void)_updateDevice:(id)a3
{
}

- (AXTVBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end