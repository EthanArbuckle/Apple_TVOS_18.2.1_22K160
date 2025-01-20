@interface IDSDevicePropertiesStateNotifier
+ (id)sharedInstance;
- (IDSDevicePropertiesStateNotifier)init;
- (IDSDevicePropertiesStateNotifier)initWithUTunDeliveryController:(id)a3 pairingManager:(id)a4;
- (IDSPairingManager)pairingManager;
- (IDSUTunDeliveryController)deliveryController;
- (NSMutableDictionary)notifyDict;
- (unint64_t)_getCurrentState:(id)a3;
- (void)dealloc;
- (void)setDeliveryController:(id)a3;
- (void)setNotifyDict:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setState:(unint64_t)a3 forProperty:(unint64_t)a4 deviceUniqueID:(id)a5;
- (void)updateStateForDeviceWithUniqueID:(id)a3;
@end

@implementation IDSDevicePropertiesStateNotifier

+ (id)sharedInstance
{
  if (qword_1009C0D18 != -1) {
    dispatch_once(&qword_1009C0D18, &stru_100904218);
  }
  return (id)qword_1009C0D20;
}

- (IDSDevicePropertiesStateNotifier)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v5 = -[IDSDevicePropertiesStateNotifier initWithUTunDeliveryController:pairingManager:]( self,  "initWithUTunDeliveryController:pairingManager:",  v3,  v4);

  return v5;
}

- (IDSDevicePropertiesStateNotifier)initWithUTunDeliveryController:(id)a3 pairingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSDevicePropertiesStateNotifier;
  v9 = -[IDSDevicePropertiesStateNotifier init](&v13, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notifyDict = v9->_notifyDict;
    v9->_notifyDict = v10;

    objc_storeStrong((id *)&v9->_deliveryController, a3);
    objc_storeStrong((id *)&v9->_pairingManager, a4);
  }

  return v9;
}

- (void)dealloc
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier notifyDict](self, "notifyDict"));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier notifyDict](self, "notifyDict"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);
        id v11 = [v10 pointerValue];

        free(v11);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSDevicePropertiesStateNotifier;
  -[IDSDevicePropertiesStateNotifier dealloc](&v12, "dealloc");
}

- (unint64_t)_getCurrentState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier pairingManager](self, "pairingManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedDeviceUniqueID]);

  LODWORD(v5) = [v6 isEqualToIgnoringCase:v4];
  if ((_DWORD)v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier deliveryController](self, "deliveryController"));
    unsigned int v8 = [v7 defaultPeerIsConnected];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier deliveryController](self, "deliveryController"));
    unsigned int v10 = [v9 defaultPeerIsNearby];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier deliveryController](self, "deliveryController"));
    unsigned int v12 = [v11 defaultPeerIsCloudConnected];

    if (v8)
    {
      unint64_t v13 = kIDSDeviceStatePropertiesIsConnected;
      if ((v10 & 1) != 0)
      {
        unint64_t v13 = kIDSDeviceStatePropertiesIsNearby | kIDSDeviceStatePropertiesIsConnected;
        if ((v12 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }

    else
    {
      if (v10)
      {
        unint64_t v13 = kIDSDeviceStatePropertiesIsNearby;
        if ((v12 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }

      unint64_t v13 = 0LL;
    }

    if (v12) {
LABEL_12:
    }
      v13 |= kIDSDeviceStatePropertiesIsCloudConnected;
  }

  else
  {
    unint64_t v13 = 0LL;
  }

- (void)updateStateForDeviceWithUniqueID:(id)a3
{
  id v5 = a3;
  unint64_t v4 = -[IDSDevicePropertiesStateNotifier _getCurrentState:](self, "_getCurrentState:", v5);
  -[IDSDevicePropertiesStateNotifier setState:forProperty:deviceUniqueID:]( self,  "setState:forProperty:deviceUniqueID:",  v4,  kIDSDeviceStatePropertiesIsNearby | kIDSDeviceStatePropertiesIsConnected | kIDSDeviceStatePropertiesIsCloudConnected,  v5);
}

- (void)setState:(unint64_t)a3 forProperty:(unint64_t)a4 deviceUniqueID:(id)a5
{
  id v8 = a5;
  if ([v8 length])
  {
    if ([v8 isEqualToIgnoringCase:IDSDeviceDefaultPairedDeviceUniqueID])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier pairingManager](self, "pairingManager"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pairedDeviceUniqueID]);

      if (![v10 length])
      {
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1006AC558(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        goto LABEL_32;
      }

      id v8 = v10;
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  IDSDeviceStateTokenPrefix,  v8));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier notifyDict](self, "notifyDict"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);
    unint64_t v13 = (int *)[v12 pointerValue];

    uint64_t state64 = 0LL;
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        int v16 = *v13;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v45 = v16;
        *(_WORD *)&v45[4] = 2112;
        *(void *)&v45[6] = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found existing notify token %d for name %@",  buf,  0x12u);
      }

      notify_get_state(*v13, &state64);
      unint64_t v17 = state64;
      v18 = v13;
    }

    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v45 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We didn't find a notify token for %@, adding one...",  buf,  0xCu);
      }

      v18 = (int *)malloc(4uLL);
      int *v18 = 0;
      id v26 = v10;
      notify_register_check((const char *)[v26 UTF8String], v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevicePropertiesStateNotifier notifyDict](self, "notifyDict"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v18));
      [v27 setValue:v28 forKey:v26];

      unint64_t v17 = -[IDSDevicePropertiesStateNotifier _getCurrentState:](self, "_getCurrentState:", v8);
      uint64_t state64 = v17;
    }

    uint64_t v29 = v17 & ~a4 | a4 & a3;
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = @"YES";
      if ((kIDSDeviceStatePropertiesIsNearby & v29) != 0) {
        v32 = @"YES";
      }
      else {
        v32 = @"NO";
      }
      if ((kIDSDeviceStatePropertiesIsConnected & v29) != 0) {
        v33 = @"YES";
      }
      else {
        v33 = @"NO";
      }
      if ((kIDSDeviceStatePropertiesIsCloudConnected & v29) == 0) {
        v31 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      *(void *)v45 = v10;
      *(_WORD *)&v45[8] = 2112;
      *(void *)&v45[10] = v32;
      __int16 v46 = 2112;
      v47 = v33;
      __int16 v48 = 2112;
      v49 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received device properties state change for device with uniqueID %@ - nearby %@  connected %@  cloud connected %@",  buf,  0x2Au);
    }

    if (!v13 || v17 != v29)
    {
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v45 = v17;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Connectivity state changed (old: 0x%x) (new: 0x%x)",  buf,  0xEu);
      }

      notify_set_state(*v18, v29);
      notify_post((const char *)[v10 UTF8String]);
      if ((kIDSDeviceStatePropertiesIsNearby & (v29 ^ v17)) != 0)
      {
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        -[os_log_s launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged]( v35,  "launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged");
LABEL_32:
      }
    }
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_1006AC524((os_log_s *)v10, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (NSMutableDictionary)notifyDict
{
  return self->_notifyDict;
}

- (void)setNotifyDict:(id)a3
{
}

- (IDSUTunDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (void)setDeliveryController:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end