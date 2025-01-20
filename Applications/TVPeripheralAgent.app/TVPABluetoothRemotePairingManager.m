@interface TVPABluetoothRemotePairingManager
+ (id)sharedInstance;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
@end

@implementation TVPABluetoothRemotePairingManager

+ (id)sharedInstance
{
  v4 = (dispatch_once_t *)&unk_100040388;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100038768);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100040380;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = 0LL;
  objc_storeStrong(&v29, a4);
  int64_t v28 = a5;
  id v27 = 0LL;
  objc_storeStrong(&v27, a6);
  id v16 = v29;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CBPeripheral);
  if ((objc_opt_isKindOfClass(v16, v6) & 1) != 0)
  {
    id v26 = v29;
    if (objc_msgSend(v26, "tvs_isBluetoothRemote"))
    {
      id v25 = sub_10000AD60();
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v25;
        os_log_type_t type = v24;
        sub_100009998(v23);
        _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Bluetooth remote is requesting pairing. Insta-accept it!",  v23,  2u);
      }

      objc_storeStrong(&v25, 0LL);
      [location[0] respondToPairingRequest:v29 type:v28 accept:1 data:0];
    }

    else
    {
      id v22 = sub_10000AD60();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (os_log_s *)v22;
        os_log_type_t v10 = v21;
        sub_100009998(v20);
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Non-remote peer is requesting pairing in Peripheral Agent. Do not accept it!",  v20,  2u);
      }

      objc_storeStrong(&v22, 0LL);
      [location[0] respondToPairingRequest:v29 type:v28 accept:0 data:0];
    }

    objc_storeStrong(&v26, 0LL);
  }

  else
  {
    id v19 = sub_10000AD60();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (os_log_s *)v19;
      os_log_type_t v8 = v18;
      sub_100009998(v17);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Non-peripheral peer is requesting pairing in Peripheral Agent. Do not accept it!",  v17,  2u);
    }

    objc_storeStrong(&v19, 0LL);
    [location[0] respondToPairingRequest:v29 type:v28 accept:0 data:0];
  }

  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
}

@end