@interface SDUnlockIDSController
+ (SDUnlockIDSController)sharedController;
- (BOOL)hasDefaultDevice;
- (BOOL)isDefaultPairedDeviceNearby;
- (IDSService)idsService;
- (IDSService)idsServiceClassA;
- (NSHashTable)delegates;
- (NSMutableDictionary)errorHandlers;
- (NSSet)autoUnlockEligibleDevices;
- (OS_dispatch_queue)serviceQueue;
- (SDUnlockIDSController)init;
- (id)activeIDSDevice;
- (id)autoUnlockDeviceForIDSDevice:(id)a3;
- (id)autoUnlockService;
- (id)dataClassStringForDataClass:(int64_t)a3;
- (void)addDelegate:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 dataClass:(int64_t)a7 queueOneID:(id)a8 errorHandler:(id)a9;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 errorHandler:(id)a7;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 queueOneID:(id)a7 errorHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setErrorHandlers:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIdsServiceClassA:(id)a3;
- (void)updateSendOptions:(id)a3;
@end

@implementation SDUnlockIDSController

- (SDUnlockIDSController)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SDUnlockIDSController;
  v2 = -[SDUnlockTransport init](&v22, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    errorHandlers = v2->_errorHandlers;
    v2->_errorHandlers = v3;

    uint64_t v7 = SFMainQueue(v5, v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v8;

    v10 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.auth");
    idsService = v2->_idsService;
    v2->_idsService = v10;

    id v12 = -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_serviceQueue);
    uint64_t v14 = paired_unlock_log(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v2->_idsService;
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Created continuity.auth service %@",  buf,  0xCu);
    }

    v17 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.auth.classa");
    idsServiceClassA = v2->_idsServiceClassA;
    v2->_idsServiceClassA = v17;

    -[IDSService addDelegate:queue:](v2->_idsServiceClassA, "addDelegate:queue:", v2, v2->_serviceQueue);
    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsServiceClassA);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v19;
  }

  return v2;
}

+ (SDUnlockIDSController)sharedController
{
  if (qword_100656CE8 != -1) {
    dispatch_once(&qword_100656CE8, &stru_1005CB430);
  }
  return (SDUnlockIDSController *)(id)qword_100656CE0;
}

- (BOOL)hasDefaultDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) isDefaultPairedDevice];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isDefaultPairedDeviceNearby
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v6 isDefaultPairedDevice]
          && ([v6 isNearby] & 1) != 0)
        {
          LODWORD(v3) = 1;
          goto LABEL_12;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)activeIDSDevice
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 isActive])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 errorHandler:(id)a7
{
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 queueOneID:(id)a7 errorHandler:(id)a8
{
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 dataClass:(int64_t)a7 queueOneID:(id)a8 errorHandler:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001DE10;
  v24[3] = &unk_1005CB458;
  id v25 = v16;
  id v26 = v17;
  unsigned __int16 v32 = a4;
  id v27 = v15;
  v28 = self;
  int64_t v30 = a6;
  int64_t v31 = a7;
  id v29 = v18;
  id v20 = v18;
  id v21 = v15;
  id v22 = v17;
  id v23 = v16;
  dispatch_async(v19, v24);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E220;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E2F8;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateSendOptions:(id)a3
{
}

- (NSSet)autoUnlockEligibleDevices
{
  id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController idsService](self, "idsService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devices]);

  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    id v8 = &_mh_execute_header;
    __int128 v9 = "Skipping unpaired device: %@";
    unsigned __int16 v32 = v4;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "isLocallyPaired", v32);
        if ((v12 & 1) == 0)
        {
          uint64_t v26 = auto_unlock_log(v12);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          id v27 = (mach_header_64 *)v8;
          v28 = v17;
          id v29 = v9;
LABEL_15:
          _os_log_impl(v27, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
          goto LABEL_16;
        }

        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]);
        char v14 = sub_10008B394();

        if ((v14 & 1) == 0)
        {
          uint64_t v30 = auto_unlock_log(v15);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          id v27 = (mach_header_64 *)v8;
          v28 = v17;
          id v29 = "Skipping Unsupported hardware: %@";
          goto LABEL_15;
        }

        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SDUnlockIDSController autoUnlockDeviceForIDSDevice:]( self,  "autoUnlockDeviceForIDSDevice:",  v11));
        id v17 = v16;
        if (v16 && -[os_log_s type](v16, "type") == (id)1)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
          uint64_t v19 = self;
          id v20 = v8;
          id v21 = v9;
          id v22 = [v18 deviceKeyBagUnlocked];

          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
          id v25 = v22;
          __int128 v9 = v21;
          id v8 = v20;
          self = v19;
          id v4 = v32;
          -[os_log_s setKeyExists:]( v17,  "setKeyExists:",  [v23 ltkExistsForKeyDevice:v24 updateLTKs:v25]);

          [v33 addObject:v17];
        }

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nsuuid]);

  if (v4)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___SFAutoUnlockDevice);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIDOverride]);
    -[SFAutoUnlockDevice setUniqueID:](v6, "setUniqueID:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 nsuuid]);
    -[SFAutoUnlockDevice setBluetoothID:](v6, "setBluetoothID:", v8);

    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
    -[SFAutoUnlockDevice setModelIdentifier:](v6, "setModelIdentifier:", v9);

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 productName]);
    -[SFAutoUnlockDevice setProductName:](v6, "setProductName:", v10);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
    -[SFAutoUnlockDevice setProductVersion:](v6, "setProductVersion:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);
    -[SFAutoUnlockDevice setProductBuildVersion:](v6, "setProductBuildVersion:", v12);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    -[SFAutoUnlockDevice setName:](v6, "setName:", v13);

    char v14 = (void *)objc_claimAutoreleasedReturnValue([v3 enclosureColor]);
    -[SFAutoUnlockDevice setEnclosureColor:](v6, "setEnclosureColor:", v14);

    -[SFAutoUnlockDevice setDefaultPairedDevice:]( v6,  "setDefaultPairedDevice:",  [v3 isDefaultPairedDevice]);
    -[SFAutoUnlockDevice setModelName:](v6, "setModelName:", @"Apple Watch");
    if (v3)
    {
      [v3 operatingSystemVersion];
      uint64_t v15 = v47;
      [v3 operatingSystemVersion];
      BOOL v16 = v45 > 3;
    }

    else
    {
      BOOL v16 = 0;
      uint64_t v15 = 0LL;
      uint64_t v47 = 0LL;
      uint64_t v48 = 0LL;
      uint64_t v49 = 0LL;
      uint64_t v45 = 0LL;
      uint64_t v46 = 0LL;
      uint64_t v44 = 0LL;
    }

    -[SFAutoUnlockDevice setMajorOSVersion:](v6, "setMajorOSVersion:", v15, v44, v45, v46, v47, v48, v49);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
    id v26 = sub_10008B39C(v25);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = (uint64_t)[v27 integerValue];

    unsigned int v29 = v15 == 7 && v16;
    if (v15 > 7) {
      unsigned int v29 = 1;
    }
    if (v28 > 2) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0LL;
    }
    -[SFAutoUnlockDevice setSupportsApproveWithWatch:](v6, "setSupportsApproveWithWatch:", v30);
    -[SFAutoUnlockDevice setSupportsApproveIcon:]( v6,  "setSupportsApproveIcon:",  -[SFAutoUnlockDevice supportsApproveWithWatch](v6, "supportsApproveWithWatch"));
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    unsigned __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIDOverride]);
    unsigned int v33 = [v31 sessionKeyExistsForDeviceID:v32];

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceIDsMissingSessionKey]);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIDOverride]);
    unsigned int v37 = [v35 containsObject:v36];

    -[SFAutoUnlockDevice setSupportsEncryption:](v6, "setSupportsEncryption:", v33 & (v37 ^ 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIDOverride]);
    id v40 = [v38 deviceEnabledAsKey:v39];

    -[SFAutoUnlockDevice setUnlockEnabled:](v6, "setUnlockEnabled:", v40);
    uint64_t v41 = objc_claimAutoreleasedReturnValue([v3 nsuuid]);
    id v18 = (os_log_s *)v41;
    if (v41 && (v40 & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SFAutoUnlockDevice proxyBluetoothID](v6, "proxyBluetoothID"));
      -[SFAutoUnlockDevice setBluetoothCloudPaired:](v6, "setBluetoothCloudPaired:", v42 != 0LL);
    }

    else
    {
      -[SFAutoUnlockDevice setBluetoothCloudPaired:](v6, "setBluetoothCloudPaired:", v41 != 0);
    }
  }

  else
  {
    uint64_t v17 = auto_unlock_log(v5);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001F39C((uint64_t)v3, v18, v19, v20, v21, v22, v23, v24);
    }
    id v6 = 0LL;
  }

  return v6;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  uint64_t v7 = paired_unlock_log(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKeyPath:@"@unionOfObjects.uniqueID"]);
    uint64_t v10 = SFCompactStringFromCollection(v9);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nearbyDevicesChanged %@", buf, 0xCu);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v17, "idsControllerNearbyStateChanged:") & 1) != 0) {
          [v17 idsControllerNearbyStateChanged:self];
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Space became avaliable", buf, 2u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "idsControllerSpaceDidBecomeAvailable:") & 1) != 0) {
          [v11 idsControllerSpaceDidBecomeAvailable:self];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v8);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  uint64_t v17 = paired_unlock_log(v15, v16);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v19 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v8) {
      __int128 v19 = @"YES";
    }
    __int128 v34 = v19;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "success = %@, identifier = %@, error = %@",  buf,  0x20u);
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SDUnlockIDSController;
  -[SDUnlockTransport service:account:identifier:didSendWithSuccess:error:]( &v32,  "service:account:identifier:didSendWithSuccess:error:",  v15,  v14,  v12,  v8,  v13);

  if (!v8)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_errorHandlers, "objectForKeyedSubscript:", v12));
    uint64_t v22 = (void *)v20;
    if (v20)
    {
      (*(void (**)(uint64_t, id))(v20 + 16))(v20, v13);
    }

    else
    {
      uint64_t v23 = paired_unlock_log(0LL, v21);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10001F404(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = paired_unlock_log(v12, v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [v11 type];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
    unsigned int v18 = [v17 length];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
    *(_DWORD *)buf = 67109634;
    unsigned int v48 = v16;
    __int16 v49 = 1024;
    unsigned int v50 = v18;
    __int16 v51 = 2112;
    v52 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Incoming protobuf (type = %d, size = %u, data = %@)",  buf,  0x18u);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceForFromID:v12]);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueIDOverride]);

  if (v11)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates"));
    id v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v24)
    {
      id v25 = v24;
      id v39 = v12;
      id v40 = v10;
      uint64_t v26 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v28, "idsController:didReceiveProtoData:forType:") & 1) != 0)
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
            objc_msgSend(v28, "idsController:didReceiveProtoData:forType:", self, v29, objc_msgSend(v11, "type"));
          }

          if ((objc_opt_respondsToSelector(v28, "idsController:didReceiveProtoData:forType:deviceID:") & 1) != 0)
          {
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
            objc_msgSend( v28,  "idsController:didReceiveProtoData:forType:deviceID:",  self,  v30,  objc_msgSend(v11, "type"),  v41);
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }

      while (v25);
      id v12 = v39;
      id v10 = v40;
    }
  }

  else
  {
    uint64_t v31 = paired_unlock_log(v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      sub_10001F438((os_log_s *)v23, v32, v33, v34, v35, v36, v37, v38);
    }
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(void))a5;
  uint64_t v8 = paired_unlock_log();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "didSwitchActivePairedDevice %@",  (uint8_t *)&v10,  0xCu);
  }

  v7[2](v7);
}

- (id)dataClassStringForDataClass:(int64_t)a3
{
  id v3 = @"Unknown";
  if (a3 == 2) {
    id v3 = @"SDUnlockSendDataClassClassA";
  }
  if (a3 == 1) {
    return @"SDUnlockSendDataClassClassD";
  }
  else {
    return (id)v3;
  }
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)idsServiceClassA
{
  return (IDSService *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setIdsServiceClassA:(id)a3
{
}

- (NSMutableDictionary)errorHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setErrorHandlers:(id)a3
{
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
}

@end