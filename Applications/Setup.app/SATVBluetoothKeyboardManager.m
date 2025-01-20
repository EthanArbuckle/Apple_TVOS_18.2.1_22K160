@interface SATVBluetoothKeyboardManager
- (SATVBluetoothKeyboardManagerDelegate)delegate;
- (TVSBluetoothDevice)pairingDevice;
- (id)_pairedKeyboard;
- (void)_removeSelfFromBluetoothManager;
- (void)bluetoothManager:(id)a3 didAcceptPairingPINForDevice:(id)a4;
- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5;
- (void)bluetoothManager:(id)a3 didRejectPairingPINForDevice:(id)a4;
- (void)bluetoothManager:(id)a3 presentPairingPIN:(int64_t)a4 forDevice:(id)a5;
- (void)bluetoothManagerDidUpdateDiscoveredDevices:(id)a3;
- (void)cancelPINPairing;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setPairingDevice:(id)a3;
- (void)startPairing;
- (void)stopPairing;
@end

@implementation SATVBluetoothKeyboardManager

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVBluetoothKeyboardManager;
  -[SATVBluetoothKeyboardManager dealloc](&v3, "dealloc");
}

- (void)startPairing
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v3 setDelegate:self];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v4 addScanObserver:self];
}

- (void)cancelPINPairing
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v2 cancelPINPairing];
}

- (void)stopPairing
{
}

- (void)bluetoothManagerDidUpdateDiscoveredDevices:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager _pairedKeyboard](self, "_pairedKeyboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager delegate](self, "delegate"));
  if (v5)
  {
    id v7 = sub_10002AF94();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager pairingDevice](self, "pairingDevice"));
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Already pairing: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v11 = [v10 copy];
    [v6 didPairBluetoothKeyboardWithName:v11];
    goto LABEL_5;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager pairingDevice](self, "pairingDevice"));

  if (v13) {
    goto LABEL_8;
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v4;
  id v14 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v14) {
    goto LABEL_6;
  }
  id v15 = v14;
  v10 = 0LL;
  uint64_t v16 = *(void *)v23;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
      if (objc_msgSend(v18, "type", (void)v22) == (id)2)
      {
        id v19 = v18;

        v10 = v19;
      }
    }

    id v15 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
  }

  while (v15);

  if (v10)
  {
    -[SATVBluetoothKeyboardManager setPairingDevice:](self, "setPairingDevice:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    id v21 = [v20 copy];
    [v6 willAttemptToPairBluetoothKeyboardWithName:v21];

    id v11 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    [v11 connectDevice:v10];
LABEL_5:

    id v12 = v10;
LABEL_6:
  }

- (void)bluetoothManager:(id)a3 didCompleteDeviceConnection:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && [v8 type] == (id)2)
  {
    -[SATVBluetoothKeyboardManager setPairingDevice:](self, "setPairingDevice:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager delegate](self, "delegate"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    id v12 = [v11 copy];
    [v10 didFailToPairBluetoothKeyboardWithName:v12];
  }
}

- (void)bluetoothManager:(id)a3 presentPairingPIN:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager delegate](self, "delegate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);

  id v9 = [v8 copy];
  [v10 presentPIN:a4 forKeyboardWithName:v9];
}

- (void)bluetoothManager:(id)a3 didRejectPairingPINForDevice:(id)a4
{
  id v5 = a4;
  -[SATVBluetoothKeyboardManager setPairingDevice:](self, "setPairingDevice:", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v6 cancelPINPairing];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVBluetoothKeyboardManager delegate](self, "delegate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v8 = [v7 copy];
  [v9 didFailToPairBluetoothKeyboardWithName:v8];
}

- (void)bluetoothManager:(id)a3 didAcceptPairingPINForDevice:(id)a4
{
}

- (void)_removeSelfFromBluetoothManager
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v3 removeScanObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  id v5 = (SATVBluetoothKeyboardManager *)objc_claimAutoreleasedReturnValue([v4 delegate]);

  if (v5 == self)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    [v6 setDelegate:0];
  }

- (id)_pairedKeyboard
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", 0LL));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pairedDevices]);

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 type] == (id)2)
        {
          id v10 = v9;

          id v6 = v10;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (SATVBluetoothKeyboardManagerDelegate)delegate
{
  return (SATVBluetoothKeyboardManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSBluetoothDevice)pairingDevice
{
  return self->_pairingDevice;
}

- (void)setPairingDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end