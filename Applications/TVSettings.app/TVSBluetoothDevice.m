@interface TVSBluetoothDevice
- (BOOL)tvset_supportsIAP;
- (id)_accessory;
- (id)tvset_BTLEMAC;
- (id)tvset_pairedDeviceDisplayName;
- (void)tvset_fetchBTLEMAC;
@end

@implementation TVSBluetoothDevice

- (BOOL)tvset_supportsIAP
{
  if (-[TVSBluetoothDevice transportType](self, "transportType")) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSBluetoothDevice _accessory](self, "_accessory"));
  unsigned __int8 v5 = [v4 supportsPublicIap];

  return v5;
}

- (id)tvset_pairedDeviceDisplayName
{
  if (((-[TVSBluetoothDevice hasPoorBehavior](self, "hasPoorBehavior") & 1) != 0
     || -[TVSBluetoothDevice requiresFirmwareUpdate](self, "requiresFirmwareUpdate"))
    && -[TVSBluetoothDevice state](self, "state") == (id)2)
  {
    uint64_t v3 = TSKLocString(@"BluetoothDevicePoorBehaviorTitleFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSBluetoothDevice name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSBluetoothDevice name](self, "name"));
  }

  return v6;
}

- (id)tvset_BTLEMAC
{
  return objc_getAssociatedObject(self, "tvset_BTLEMAC");
}

- (void)tvset_fetchBTLEMAC
{
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild"))
  {
    if (-[TVSBluetoothDevice transportType](self, "transportType") == (id)1)
    {
      objc_initWeak(&location, self);
      id v3 = objc_alloc_init(&OBJC_CLASS___CBController);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_1000A833C;
      v5[3] = &unk_1001931B8;
      objc_copyWeak(&v7, &location);
      id v4 = v3;
      id v6 = v4;
      [v4 getDevicesWithFlags:0 completionHandler:v5];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }

- (id)_accessory
{
  if (-[TVSBluetoothDevice transportType](self, "transportType")) {
    return 0LL;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[EAAccessoryManager sharedAccessoryManager]( &OBJC_CLASS___EAAccessoryManager,  "sharedAccessoryManager"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 availableAccessories]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 macAddress]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uppercaseString]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSBluetoothDevice identifier](self, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uppercaseString]);
        unsigned int v15 = [v12 isEqual:v14];

        if (v15)
        {
          id v16 = v10;
          goto LABEL_13;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_13:

  return v16;
}

@end