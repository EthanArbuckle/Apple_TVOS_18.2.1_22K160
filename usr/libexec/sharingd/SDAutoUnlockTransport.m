@interface SDAutoUnlockTransport
+ (id)sharedTransport;
- (BOOL)activityServiceHasWatch;
- (BOOL)appleWatchExisted;
- (BOOL)canRetryCloudPairingForDeviceID:(id)a3 useShortDate:(BOOL)a4;
- (BOOL)deviceNearby;
- (BOOL)disableEncryption;
- (BOOL)isDeviceSatellitePaired;
- (BOOL)localDeviceIDSRegistered;
- (BOOL)macVersionEligibleForDeviceID:(id)a3;
- (BOOL)pairingRequestIsValidForDeviceID:(id)a3 messageContext:(id)a4;
- (BOOL)showIDInName;
- (BOOL)showOtherDevices;
- (BOOL)watchSeenRecently;
- (BOOL)watchVersionEligibleForDevice:(id)a3;
- (IDSService)activityService;
- (IDSService)idsService;
- (NSDate)lastSeenWatchDate;
- (NSDate)lastSendDate;
- (NSMapTable)clientMap;
- (NSMutableDictionary)autoUnlockDeviceCache;
- (NSMutableDictionary)cachedBluetoothIDToUniqueIDs;
- (NSMutableDictionary)cloudPairRetryRecords;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)sendDates;
- (NSMutableDictionary)sendIdentifierToSessionID;
- (NSNumber)watchCurrentlyInList;
- (NSNumber)watchExistedInUnlockList;
- (NSSet)cachedApproveBluetoothIDs;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)transportQueue;
- (SDAutoUnlockTransport)init;
- (SDAutoUnlockTransportClient)primaryClient;
- (id)activeDevice;
- (id)approveBluetoothIDs;
- (id)autoUnlockDeviceForBluetoothID:(id)a3;
- (id)autoUnlockDeviceForBluetoothID:(id)a3 cached:(BOOL)a4;
- (id)autoUnlockDeviceForDeviceID:(id)a3;
- (id)autoUnlockDeviceForIDSDevice:(id)a3;
- (id)autoUnlockDeviceForIDSDevice:(id)a3 cloudPaired:(BOOL)a4 cached:(BOOL)a5;
- (id)autoUnlockEligibleDevicesWithCloudPairing:(BOOL)a3 deviceType:(int64_t)a4;
- (id)autoUnlockEligibleWatches;
- (id)autoUnlockEligibleWatchesWithCloudPairing:(BOOL)a3;
- (id)autoUnlockService;
- (id)bluetoothDeviceIdentifiers;
- (id)bluetoothIDForIDSID:(id)a3;
- (id)cachedIDSDeviceIDsForBluetoothID:(id)a3;
- (id)connectionCacheDevices;
- (id)dataFromUUID:(id)a3;
- (id)deviceNameForDeviceID:(id)a3;
- (id)devicesWithLTKs;
- (id)enabledAutoUnlockDevices;
- (id)enabledAutoUnlockDevicesUsingCache:(BOOL)a3;
- (id)enabledAutoUnlockLockDevices;
- (id)idsDeviceForBluetoothID:(id)a3;
- (id)idsDeviceForUniqueID:(id)a3;
- (id)idsDeviceIDsForBluetoothID:(id)a3;
- (id)idsDevicesIDs;
- (id)idsMacDeviceIDs;
- (id)modelIdentifierForDeviceID:(id)a3;
- (id)modelNameForDevice:(id)a3;
- (id)nameForDevice:(id)a3;
- (id)onqueue_autoUnlockEligibleDevices:(BOOL)a3 deviceType:(int64_t)a4;
- (id)onqueue_bluetoothDeviceIdentifiers;
- (id)onqueue_bluetoothIDForIDSID:(id)a3;
- (id)onqueue_devicesWithLTKs;
- (id)onqueue_enabledAutoUnlockDevicesUsingCache:(BOOL)a3;
- (id)pairedAutoUnlockDevice;
- (id)pairedDeviceID;
- (id)placeholderDevice;
- (id)proxyBluetoothDeviceIDForDeviceID:(id)a3;
- (id)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 wantsACK:(BOOL)a8 timeout:(id)a9 completion:(id)a10;
- (id)stableBluetoothIdentifierForIDSDevice:(id)a3;
- (id)state;
- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4;
- (int64_t)deviceTypeForDevice:(id)a3;
- (int64_t)deviceTypeForDeviceID:(id)a3;
- (void)addClient:(id)a3 forIdentifer:(id)a4;
- (void)clearAutoUnlockDeviceCache;
- (void)handleSuccessfulMessageSentWithIdentifier:(id)a3 sessionID:(id)a4;
- (void)loadCloudPairRetries;
- (void)logBluetoothIDCache;
- (void)logDevices;
- (void)refreshAutoUnlockDeviceCache;
- (void)removeClientForIdentifier:(id)a3;
- (void)resetAppleWatchExisted;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 errorHandler:(id)a9;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 timeout:(id)a7 errorHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActivityService:(id)a3;
- (void)setAutoUnlockDeviceCache:(id)a3;
- (void)setCachedApproveBluetoothIDs:(id)a3;
- (void)setCachedBluetoothIDToUniqueIDs:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setCloudPairRetryRecords:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setLastSeenWatchDate:(id)a3;
- (void)setLastSendDate:(id)a3;
- (void)setPrimaryClient:(id)a3;
- (void)setSendDates:(id)a3;
- (void)setSendIdentifierToSessionID:(id)a3;
- (void)setTransportQueue:(id)a3;
- (void)setWatchCurrentlyInList:(id)a3;
- (void)setWatchExistedInUnlockList:(id)a3;
- (void)updateApproveBluetoothIDs;
- (void)updateBluetoothIDCache;
- (void)updateRetryDatesForDeviceIDs:(id)a3;
@end

@implementation SDAutoUnlockTransport

+ (id)sharedTransport
{
  if (qword_100657110 != -1) {
    dispatch_once(&qword_100657110, &stru_1005CE3B8);
  }
  return (id)qword_100657108;
}

- (SDAutoUnlockTransport)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SDAutoUnlockTransport;
  v2 = -[SDUnlockTransport init](&v24, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    sendDates = v2->_sendDates;
    v2->_sendDates = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    autoUnlockDeviceCache = v2->_autoUnlockDeviceCache;
    v2->_autoUnlockDeviceCache = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    sendIdentifierToSessionID = v2->_sendIdentifierToSessionID;
    v2->_sendIdentifierToSessionID = v9;

    v11 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0x10000LL,  5LL,  0LL);
    clientMap = v2->_clientMap;
    v2->_clientMap = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-client-queue", 0LL);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-queue", 0LL);
    transportQueue = v2->_transportQueue;
    v2->_transportQueue = (OS_dispatch_queue *)v15;

    v17 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.unlock");
    idsService = v2->_idsService;
    v2->_idsService = v17;

    v19 = v2->_idsService;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](v2, "transportQueue"));
    -[IDSService addDelegate:queue:](v19, "addDelegate:queue:", v2, v20);

    v21 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.activity");
    activityService = v2->_activityService;
    v2->_activityService = v21;

    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsService);
    -[SDAutoUnlockTransport loadCloudPairRetries](v2, "loadCloudPairRetries");
    -[SDAutoUnlockTransport updateBluetoothIDCache](v2, "updateBluetoothIDCache");
  }

  return v2;
}

- (void)addClient:(id)a3 forIdentifer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F94C8;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeClientForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F95A0;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)logDevices
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDS Devices: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)refreshAutoUnlockDeviceCache
{
  id v3 = -[SDAutoUnlockTransport enabledAutoUnlockDevicesUsingCache:](self, "enabledAutoUnlockDevicesUsingCache:", 0LL);
}

- (void)clearAutoUnlockDeviceCache
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing Auto Unlock device cache", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
  [v5 removeAllObjects];
}

- (id)bluetoothIDForIDSID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  dispatch_queue_t v15 = sub_1000F9A24;
  v16 = sub_1000F9A34;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F9A3C;
  block[3] = &unk_1005CE408;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)onqueue_bluetoothIDForIDSID:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 nsuuid]);

          id v9 = (void *)v15;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)bluetoothDeviceIdentifiers
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000F9A24;
  v11 = sub_1000F9A34;
  id v12 = &__NSArray0__struct;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F9CC8;
  v6[3] = &unk_1005CC7E0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_bluetoothDeviceIdentifiers
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nsuuid]);
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)pairedDeviceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIDOverride]);

  return v3;
}

- (id)pairedAutoUnlockDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:](self, "autoUnlockDeviceForIDSDevice:", v3));

  return v4;
}

- (id)activeDevice
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 isActive])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)isDeviceSatellitePaired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock]( &OBJC_CLASS___NRPairedDeviceRegistry,  "activePairedDeviceSelectorBlock"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:NRDevicePropertyIsAltAccount]);
  LOBYTE(v3) = [v6 BOOLValue];

  return (char)v3;
}

- (BOOL)deviceNearby
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (id)idsDevicesIDs
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) uniqueIDOverride]);
        -[NSMutableSet addObject:](v3, "addObject:", v10);

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)idsMacDeviceIDs
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 modelIdentifier]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);
        unsigned int v13 = [v12 containsString:@"mac"];

        if (v13)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
          -[NSMutableArray addObject:](v3, "addObject:", v14);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)deviceNameForDeviceID:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return v4;
}

- (int64_t)deviceTypeForDeviceID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  int64_t v5 = -[SDAutoUnlockTransport deviceTypeForDevice:](self, "deviceTypeForDevice:", v4);

  return v5;
}

- (int64_t)deviceTypeForDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  unsigned __int8 v6 = [v5 containsString:@"watch"];

  if ((v6 & 1) != 0)
  {
    int64_t v7 = 1LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);
    unsigned __int8 v10 = [v9 containsString:@"iphone"];

    if ((v10 & 1) != 0)
    {
      int64_t v7 = 2LL;
    }

    else
    {
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);
      unsigned int v13 = [v12 containsString:@"ipad"];

      if (v13) {
        int64_t v7 = 3LL;
      }
      else {
        int64_t v7 = 4LL;
      }
    }
  }

  return v7;
}

- (id)modelIdentifierForDeviceID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);

  return v4;
}

- (id)autoUnlockDeviceForDeviceID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  if (v4) {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:](self, "autoUnlockDeviceForIDSDevice:", v4));
  }
  else {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3
{
  return -[SDAutoUnlockTransport autoUnlockDeviceForBluetoothID:cached:]( self,  "autoUnlockDeviceForBluetoothID:cached:",  a3,  0LL);
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3 cached:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForBluetoothID:](self, "idsDeviceForBluetoothID:", a3));
  if (v6) {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:]( self,  "autoUnlockDeviceForIDSDevice:cloudPaired:cached:",  v6,  0LL,  v4));
  }
  else {
    int64_t v7 = 0LL;
  }

  return v7;
}

- (id)devicesWithLTKs
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned __int8 v10 = sub_1000F9A24;
  __int128 v11 = sub_1000F9A34;
  __int128 v12 = 0LL;
  __int128 v12 = objc_opt_new(&OBJC_CLASS___NSSet);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FA6B8;
  v6[3] = &unk_1005CC7E0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_devicesWithLTKs
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v9);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
        unsigned int v13 = [v11 ltkExistsForKeyDevice:v12];

        if (v13)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
          -[NSMutableSet addObject:](v3, "addObject:", v14);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)autoUnlockEligibleWatches
{
  return -[SDAutoUnlockTransport autoUnlockEligibleWatchesWithCloudPairing:]( self,  "autoUnlockEligibleWatchesWithCloudPairing:",  1LL);
}

- (id)autoUnlockEligibleWatchesWithCloudPairing:(BOOL)a3
{
  return -[SDAutoUnlockTransport autoUnlockEligibleDevicesWithCloudPairing:deviceType:]( self,  "autoUnlockEligibleDevicesWithCloudPairing:deviceType:",  a3,  1LL);
}

- (id)autoUnlockEligibleDevicesWithCloudPairing:(BOOL)a3 deviceType:(int64_t)a4
{
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = sub_1000F9A24;
  __int128 v16 = sub_1000F9A34;
  __int128 v17 = 0LL;
  __int128 v17 = objc_opt_new(&OBJC_CLASS___NSSet);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000FA990;
  v10[3] = &unk_1005CE430;
  v10[4] = self;
  v10[5] = &v12;
  BOOL v11 = a3;
  v10[6] = a4;
  dispatch_sync(v7, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)onqueue_autoUnlockEligibleDevices:(BOOL)a3 deviceType:(int64_t)a4
{
  BOOL v5 = a3;
  v58 = (void *)sub_10008E36C(@"AUDeviceBlackList");
  v57 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  -[SDAutoUnlockTransport clearAutoUnlockDeviceCache](self, "clearAutoUnlockDeviceCache");
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 devices]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:]( self,  "autoUnlockDeviceForIDSDevice:cloudPaired:cached:",  v13,  v5,  0LL));
        __int128 v15 = v14;
        if (v14)
        {
          if ([v14 type] == (id)a4
            || -[SDAutoUnlockTransport showOtherDevices](self, "showOtherDevices"))
          {
            if (a4 == 1
              && !(BOOL v16 = -[SDAutoUnlockTransport watchVersionEligibleForDevice:]( self,  "watchVersionEligibleForDevice:",  v13)))
            {
              uint64_t v27 = auto_unlock_log(v16);
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                sub_1000FF25C(&v60, v61, v21);
              }
            }

            else
            {
LABEL_11:
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
              unsigned int v18 = [v58 containsObject:v17];

              if (!v18)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
                id v24 = [v23 deviceKeyBagUnlocked];

                v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
                v26 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIDOverride]);
                objc_msgSend(v15, "setKeyExists:", objc_msgSend(v25, "ltkExistsForKeyDevice:updateLTKs:", v26, v24));

                -[NSMutableSet addObject:](v57, "addObject:", v15);
                goto LABEL_22;
              }

              uint64_t v20 = auto_unlock_log(v19);
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
                *(_DWORD *)buf = 138412290;
                v67 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Skipping device in blacklist (device ID: %@)",  buf,  0xCu);
              }
            }

            goto LABEL_22;
          }

          if (a4 == 5
            && [v15 type] == (id)3
            && (_os_feature_enabled_impl("Sharing", "auto_unlock_ipad_as_realitydevice") & 1) != 0)
          {
            goto LABEL_11;
          }
        }

- (id)enabledAutoUnlockDevices
{
  return -[SDAutoUnlockTransport enabledAutoUnlockDevicesUsingCache:](self, "enabledAutoUnlockDevicesUsingCache:", 0LL);
}

- (id)enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unsigned int v13 = sub_1000F9A24;
  uint64_t v14 = sub_1000F9A34;
  __int128 v15 = 0LL;
  __int128 v15 = objc_opt_new(&OBJC_CLASS___NSSet);
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB0A0;
  block[3] = &unk_1005CE458;
  block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)onqueue_enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  BOOL v28 = a3;
  uint64_t v27 = (void *)sub_10008E36C(@"AUDeviceBlackList");
  v26 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v30;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v25 = v7;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager",  v25));
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
        unsigned int v14 = [v12 ltkExistsForKeyDevice:v13 updateLTKs:0];

        if (v14)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:]( self,  "autoUnlockDeviceForIDSDevice:cloudPaired:cached:",  v11,  1LL,  v28));
          BOOL v16 = v15;
          if (v15 && [v15 unlockEnabled])
          {
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
            unsigned int v18 = [v27 containsObject:v17];

            if (v18)
            {
              uint64_t v20 = auto_unlock_log(v19);
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
                *(_DWORD *)buf = v25;
                v34 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Skipping enabled device in blacklist (device ID: %@)",  buf,  0xCu);
              }
            }

            else
            {
              -[NSMutableSet addObject:](v26, "addObject:", v16);
            }
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v8);
  }

  id v23 = -[NSMutableSet copy](v26, "copy");
  return v23;
}

- (id)enabledAutoUnlockLockDevices
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_1000FB3F8;
  uint64_t v11 = &unk_1005CB480;
  uint64_t v12 = self;
  unsigned int v13 = v3;
  BOOL v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = -[NSMutableSet copy](v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  return -[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:]( self,  "autoUnlockDeviceForIDSDevice:cloudPaired:cached:",  a3,  1LL,  0LL);
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3 cloudPaired:(BOOL)a4 cached:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockTransport stableBluetoothIdentifierForIDSDevice:]( self,  "stableBluetoothIdentifierForIDSDevice:",  v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport nameForDevice:](self, "nameForDevice:", v8));
  uint64_t v11 = (void *)v10;
  if (!v8
    || (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]), v12, !v12))
  {
    uint64_t v15 = auto_unlock_log(v10);
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000FF290(v14, v16, v17);
    }
    goto LABEL_9;
  }

  if (v6 && !v9)
  {
    uint64_t v13 = auto_unlock_log(v10);
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000FF2C4((uint64_t)v8, v14);
    }
LABEL_9:
    unsigned int v18 = 0LL;
LABEL_10:

    goto LABEL_11;
  }

  if (v5)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
    unsigned int v18 = (SFAutoUnlockDevice *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

    uint64_t v23 = auto_unlock_log(v22);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Using cached device: %@", buf, 0xCu);
    }

    if (v18) {
      goto LABEL_35;
    }
  }

  unsigned int v18 = objc_opt_new(&OBJC_CLASS___SFAutoUnlockDevice);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
  -[SFAutoUnlockDevice setUniqueID:](v18, "setUniqueID:", v25);

  -[SFAutoUnlockDevice setBluetoothID:](v18, "setBluetoothID:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 modelIdentifier]);
  -[SFAutoUnlockDevice setModelIdentifier:](v18, "setModelIdentifier:", v26);

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 productName]);
  -[SFAutoUnlockDevice setProductName:](v18, "setProductName:", v27);

  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v8 productVersion]);
  -[SFAutoUnlockDevice setProductVersion:](v18, "setProductVersion:", v28);

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v8 productBuildVersion]);
  -[SFAutoUnlockDevice setProductBuildVersion:](v18, "setProductBuildVersion:", v29);

  -[SFAutoUnlockDevice setName:](v18, "setName:", v11);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 enclosureColor]);
  -[SFAutoUnlockDevice setEnclosureColor:](v18, "setEnclosureColor:", v30);

  -[SFAutoUnlockDevice setDefaultPairedDevice:]( v18,  "setDefaultPairedDevice:",  [v8 isDefaultPairedDevice]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport modelNameForDevice:](self, "modelNameForDevice:", v8));
  -[SFAutoUnlockDevice setModelName:](v18, "setModelName:", v31);

  [v8 operatingSystemVersion];
  [v8 operatingSystemVersion];
  BOOL v32 = v55 > 3 && v56 == 7;
  unsigned int v33 = v56 > 7 || v32;
  -[SFAutoUnlockDevice setMajorOSVersion:](v18, "setMajorOSVersion:", v56);
  -[SFAutoUnlockDevice setSupportsAlwaysDirect:](v18, "setSupportsAlwaysDirect:", v56 > 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v8 modelIdentifier]);
  id v35 = sub_10008B39C(v34);
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  uint64_t v54 = (uint64_t)[v36 integerValue];

  uint64_t v37 = v54 > 2 ? v33 : 0LL;
  -[SFAutoUnlockDevice setSupportsApproveWithWatch:](v18, "setSupportsApproveWithWatch:", v37);
  int v38 = sub_10008E24C(@"AUForceApproveLabel", 0LL);
  unsigned int v39 = -[SFAutoUnlockDevice supportsApproveWithWatch](v18, "supportsApproveWithWatch");
  uint64_t v40 = v38 ? 0LL : v39;
  -[SFAutoUnlockDevice setSupportsApproveIcon:](v18, "setSupportsApproveIcon:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
  unsigned int v53 = [v41 sessionKeyExistsForDeviceID:v42];

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 deviceIDsMissingSessionKey]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
  unsigned int v46 = [v44 containsObject:v45] ^ 1;
  unsigned int v47 = v56 > 3 ? v46 : 0;

  -[SFAutoUnlockDevice setSupportsEncryption:]( v18,  "setSupportsEncryption:",  v53 & ~-[SDAutoUnlockTransport disableEncryption](self, "disableEncryption") & v47);
  id v48 = -[SFAutoUnlockDevice setSupportsAdvertisingUnlocked:](v18, "setSupportsAdvertisingUnlocked:", v56 > 4);
  unsigned int v50 = sub_10008A668((uint64_t)v48, v49);
  uint64_t v51 = v56 > 6 ? v50 : 0LL;
  -[SFAutoUnlockDevice setSupportsConnectionCache:](v18, "setSupportsConnectionCache:", v51);
  -[SFAutoUnlockDevice setSupportsHEIC:](v18, "setSupportsHEIC:", v54 > 3);
  if (v18)
  {
LABEL_35:
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[SFAutoUnlockDevice uniqueID](v18, "uniqueID"));
    -[os_log_s setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v52);

    goto LABEL_10;
  }

- (id)approveBluetoothIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));

  if (!v3) {
    -[SDAutoUnlockTransport updateApproveBluetoothIDs](v2, "updateApproveBluetoothIDs");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  objc_sync_exit(v2);

  return v4;
}

- (void)updateApproveBluetoothIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport enabledAutoUnlockDevices](v2, "enabledAutoUnlockDevices"));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "supportsApproveWithWatch", (void)v18))
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bluetoothID]);
          -[NSMutableSet addObject:](v3, "addObject:", v9);
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v5);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  -[SDAutoUnlockTransport setCachedApproveBluetoothIDs:](v2, "setCachedApproveBluetoothIDs:", v3);

  objc_sync_exit(v2);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  unsigned __int8 v12 = [v10 isEqualToSet:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = auto_unlock_log(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updated approve bluetooth IDs: %@",  buf,  0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 postNotificationName:@"ApproveBluetoothIDsChanged" object:0];
  }
}

- (id)modelNameForDevice:(id)a3
{
  int64_t v3 = -[SDAutoUnlockTransport deviceTypeForDevice:](self, "deviceTypeForDevice:", a3);
  else {
    return off_1005CE4A0[v3 - 1];
  }
}

- (BOOL)watchVersionEligibleForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = auto_unlock_log(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      [v3 operatingSystemVersion];
      int v6 = v10;
    }

    else
    {
      int v6 = 0;
    }

    *(_DWORD *)buf = 67109120;
    int v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device version: %d", buf, 8u);
  }

  if (v3)
  {
    [v3 operatingSystemVersion];
    BOOL v7 = v9 > 2;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)macVersionEligibleForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", v4));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 modelIdentifier]);
  int v7 = GestaltProductTypeStringToDeviceClass();

  if (!v5)
  {
    uint64_t v12 = auto_unlock_log(v8);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_1000FF338((uint64_t)v4, v13);
    }

    goto LABEL_19;
  }

  if (v7 == 1)
  {
    uint64_t v14 = auto_unlock_log(v8);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [v5 operatingSystemVersion];
      [v5 operatingSystemVersion];
      *(_DWORD *)buf = 67109376;
      int v30 = v23;
      __int16 v31 = 1024;
      int v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Remote iOS major version: %d and minor version: %d",  buf,  0xEu);
    }

    [v5 operatingSystemVersion];
    if (v21 <= 14)
    {
      [v5 operatingSystemVersion];
      if (v20 == 14)
      {
        [v5 operatingSystemVersion];
        BOOL v11 = v19 >= 0;
        goto LABEL_20;
      }

      goto LABEL_19;
    }

    goto LABEL_15;
  }

  if (v7 != 100)
  {
    uint64_t v16 = auto_unlock_log(v8);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_1000FF3AC((uint64_t)v4, v7, v17);
    }

    goto LABEL_19;
  }

  uint64_t v9 = auto_unlock_log(v8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v5 operatingSystemVersion];
    [v5 operatingSystemVersion];
    *(_DWORD *)buf = 67109376;
    int v30 = v28;
    __int16 v31 = 1024;
    int v32 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Remote MacOS major version: %d and minor version: %d",  buf,  0xEu);
  }

  [v5 operatingSystemVersion];
  if (v26 > 10)
  {
LABEL_15:
    BOOL v11 = 1;
    goto LABEL_20;
  }

  [v5 operatingSystemVersion];
  if (v25 != 10)
  {
LABEL_19:
    BOOL v11 = 0;
    goto LABEL_20;
  }

  [v5 operatingSystemVersion];
  BOOL v11 = v24 > 12;
LABEL_20:

  return v11;
}

- (id)nameForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  if (-[SDAutoUnlockTransport showIDInName](self, "showIDInName"))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v6, v7));

    id v5 = (void *)v8;
  }

  return v5;
}

- (id)proxyBluetoothDeviceIDForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 companionIDForWatchID:v4]);

  if (!v6)
  {
LABEL_6:
    int v7 = 0LL;
    goto LABEL_7;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport onqueue_bluetoothIDForIDSID:](self, "onqueue_bluetoothIDForIDSID:", v6));
  if (!v7)
  {
    uint64_t v8 = auto_unlock_log(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF444(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    goto LABEL_6;
  }

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)idsDeviceForBluetoothID:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nsuuid]);
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)idsDeviceIDsForBluetoothID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 nsuuid]);
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIDOverride]);
          -[NSMutableArray addObject:](v5, "addObject:", v15);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v5;
}

- (id)cachedIDSDeviceIDsForBluetoothID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)logBluetoothIDCache
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth ID cache %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)updateBluetoothIDCache
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[SDAutoUnlockTransport setCachedBluetoothIDToUniqueIDs:](self, "setCachedBluetoothIDToUniqueIDs:", v3);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockTransport stableBluetoothIdentifierForIDSDevice:]( self,  "stableBluetoothIdentifierForIDSDevice:",  v10));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
        uint64_t v13 = (void *)v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v11]);
          id v17 = [v16 mutableCopy];
          __int128 v18 = v17;
          if (v17) {
            id v19 = v17;
          }
          else {
            id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          }
          __int128 v20 = v19;

          [v20 addObject:v13];
          id v21 = [v20 copy];
          int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
          [v22 setObject:v21 forKeyedSubscript:v11];
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v7);
  }

  uint64_t v24 = auto_unlock_log(v23);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Updated bluetooth ID cache", buf, 2u);
  }
}

- (id)placeholderDevice
{
  v2 = objc_opt_new(&OBJC_CLASS___SFAutoUnlockDevice);
  -[SFAutoUnlockDevice setUniqueID:](v2, "setUniqueID:", @"5EAFD122-F291-4D56-B1F9-D856CBBC7E0C");
  -[SFAutoUnlockDevice setBluetoothID:](v2, "setBluetoothID:", 0LL);
  -[SFAutoUnlockDevice setModelIdentifier:](v2, "setModelIdentifier:", @"Watch0,0");
  -[SFAutoUnlockDevice setProductName:](v2, "setProductName:", @"Watch OS");
  -[SFAutoUnlockDevice setProductVersion:](v2, "setProductVersion:", @"0.0");
  -[SFAutoUnlockDevice setProductBuildVersion:](v2, "setProductBuildVersion:", @"14S000");
  -[SFAutoUnlockDevice setName:](v2, "setName:", @"Placeholder");
  -[SFAutoUnlockDevice setEnclosureColor:](v2, "setEnclosureColor:", @"0");
  -[SFAutoUnlockDevice setDefaultPairedDevice:](v2, "setDefaultPairedDevice:", 0LL);
  -[SFAutoUnlockDevice setModelName:](v2, "setModelName:", @"Apple Watch");
  -[SFAutoUnlockDevice setProxyBluetoothID:](v2, "setProxyBluetoothID:", 0LL);
  -[SFAutoUnlockDevice setUnlockEnabled:](v2, "setUnlockEnabled:", 0LL);
  -[SFAutoUnlockDevice setBluetoothCloudPaired:](v2, "setBluetoothCloudPaired:", 0LL);
  -[SFAutoUnlockDevice setPlaceholder:](v2, "setPlaceholder:", 1LL);
  return v2;
}

- (BOOL)activityServiceHasWatch
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activityService](self, "activityService"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4) {
    goto LABEL_14;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v15;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lowercaseString]);
      if (!v8)
      {
        uint64_t v13 = 0LL;
LABEL_11:

        continue;
      }

      [v8 operatingSystemVersion];

      if (v13 > 2)
      {
        BOOL v11 = 1;
        goto LABEL_15;
      }
    }

    id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }

  while (v5);
LABEL_14:
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)localDeviceIDSRegistered
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);

  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v9 accountType] == 1)
        {
          id v10 = v9;

          uint64_t v6 = v10;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v12 = auto_unlock_log(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v6 registrationStatus];
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS registration status: %d", buf, 8u);
  }

  BOOL v15 = [v6 registrationStatus] == 5;
  return v15;
}

- (id)connectionCacheDevices
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport enabledAutoUnlockDevices](self, "enabledAutoUnlockDevices"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)stableBluetoothIdentifierForIDSDevice:(id)a3
{
  return [a3 nsuuid];
}

- (void)handleSuccessfulMessageSentWithIdentifier:(id)a3 sessionID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientMap](self, "clientMap"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport sendIdentifierToSessionID](self, "sendIdentifierToSessionID"));
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
  }
}

- (void)updateRetryDatesForDeviceIDs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:86400.0]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:900.0]);

  v31[0] = @"CloudPairGeneralRetryDate";
  v31[1] = @"CloudPairShortRetryDate";
  v32[0] = v6;
  v32[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v14);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords", (void)v24));
        [v16 setObject:v9 forKeyedSubscript:v15];

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v12);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
  [v17 setObject:v18 forKey:@"AutoUnlockCloudPairRetries"];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v19 synchronize];

  uint64_t v21 = auto_unlock_log(v20);
  unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
    *(_DWORD *)buf = 138412290;
    __int128 v29 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Updated cloud pairing retry dates %@",  buf,  0xCu);
  }
}

- (BOOL)canRetryCloudPairingForDeviceID:(id)a3 useShortDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (v8)
  {
    if (v4) {
      id v9 = @"CloudPairShortRetryDate";
    }
    else {
      id v9 = @"CloudPairGeneralRetryDate";
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    if (v10
      && (id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
          [v11 timeIntervalSinceDate:v10],
          double v13 = v12,
          v11,
          v13 < 0.0))
    {
      uint64_t v15 = auto_unlock_log(v14);
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        if (v4) {
          __int128 v17 = @"YES";
        }
        else {
          __int128 v17 = @"NO";
        }
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CloudPairShortRetryDate"]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CloudPairGeneralRetryDate"]);
        int v22 = 138413058;
        id v23 = v6;
        __int16 v24 = 2112;
        __int128 v25 = v17;
        __int16 v26 = 2112;
        __int128 v27 = v18;
        __int16 v28 = 2112;
        __int128 v29 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Still backing off cloud pair retry (device ID: %@, use short: %@, short date: %@, general date: %@)",  (uint8_t *)&v22,  0x2Au);
      }

      BOOL v20 = 0;
    }

    else
    {
      BOOL v20 = 1;
    }
  }

  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (void)loadCloudPairRetries
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"AutoUnlockCloudPairRetries"]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)) {
    id v6 = (NSMutableDictionary *)[v4 mutableCopy];
  }
  else {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v7 = v6;
  -[SDAutoUnlockTransport setCloudPairRetryRecords:](self, "setCloudPairRetryRecords:", v6);
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 timeout:(id)a7 errorHandler:(id)a8
{
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 errorHandler:(id)a9
{
  uint64_t v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FD5AC;
  v17[3] = &unk_1005CE480;
  id v18 = a9;
  id v16 = v18;
  -[SDAutoUnlockTransport sendPayload:toDevice:type:sessionID:queueOneID:timeout:completion:]( self,  "sendPayload:toDevice:type:sessionID:queueOneID:timeout:completion:",  a3,  a4,  v12,  a6,  a7,  a8,  v17);
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  id v9 =  -[SDAutoUnlockTransport sendPayload:toDevice:type:sessionID:queueOneID:wantsACK:timeout:completion:]( self,  "sendPayload:toDevice:type:sessionID:queueOneID:wantsACK:timeout:completion:",  a3,  a4,  a5,  a6,  a7,  0LL,  a8,  a9);
}

- (id)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 wantsACK:(BOOL)a8 timeout:(id)a9 completion:(id)a10
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SDAutoUnlockTransport;
  id v10 = -[SDUnlockTransport sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:]( &v12,  "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:",  a3,  a4,  a5,  a6,  a7,  a9,  a10);
  return (id)objc_claimAutoreleasedReturnValue(v10);
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v8, "setVersion:", 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport dataFromUUID:](self, "dataFromUUID:", v6));

  -[SDAutoUnlockSessionWrapper setSessionID:](v8, "setSessionID:", v9);
  -[SDAutoUnlockSessionWrapper setPayload:](v8, "setPayload:", v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v8, "data"));
  return v10;
}

- (id)dataFromUUID:(id)a3
{
  v4[0] = 0LL;
  v4[1] = 0LL;
  [a3 getUUIDBytes:v4];
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v4,  16LL));
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD7BC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Nearby devices changed %@", buf, 0xCu);
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD940;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  double v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FDAA8;
  v17[3] = &unk_1005CC3F0;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, v17);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = auto_unlock_log(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport sendIdentifierToSessionID](self, "sendIdentifierToSessionID"));
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received IDS ACK (identifier: %@, mapping: %@)",  buf,  0x16u);
    }

    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000FE214;
    v13[3] = &unk_1005CB480;
    v13[4] = self;
    id v14 = v8;
    dispatch_async(v12, v13);
  }
}

- (BOOL)appleWatchExisted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport lastSeenWatchDate](self, "lastSeenWatchDate"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)resetAppleWatchExisted
{
  uint64_t v3 = auto_unlock_log(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting apple watch existed state", v5, 2u);
  }

  -[SDAutoUnlockTransport setLastSeenWatchDate:](self, "setLastSeenWatchDate:", 0LL);
  -[SDAutoUnlockTransport setWatchExistedInUnlockList:](self, "setWatchExistedInUnlockList:", &__kCFBooleanFalse);
  -[SDAutoUnlockTransport setWatchCurrentlyInList:](self, "setWatchCurrentlyInList:", &__kCFBooleanFalse);
}

- (BOOL)watchSeenRecently
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport lastSeenWatchDate](self, "lastSeenWatchDate"));
  uint64_t v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:2419200.0]);
    id v5 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v4);
    BOOL v7 = v6 < 0.0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDate)lastSeenWatchDate
{
  lastSeenWatchDate = self->_lastSeenWatchDate;
  if (lastSeenWatchDate) {
    return lastSeenWatchDate;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (NSDate *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AutoUnlockLastSeenWatchDate"]);
  double v6 = self->_lastSeenWatchDate;
  self->_lastSeenWatchDate = v5;

  if (!self->_lastSeenWatchDate)
  {
    lastSeenWatchDate = 0LL;
    return lastSeenWatchDate;
  }

  uint64_t v8 = auto_unlock_log(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_lastSeenWatchDate;
    int v12 = 138412290;
    double v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loaded lastSeenWatchDate %@",  (uint8_t *)&v12,  0xCu);
  }

  return self->_lastSeenWatchDate;
}

- (void)setLastSeenWatchDate:(id)a3
{
  id v9 = a3;
  p_lastSeenWatchDate = &self->_lastSeenWatchDate;
  objc_storeStrong((id *)p_lastSeenWatchDate, a3);
  double v6 = *p_lastSeenWatchDate;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:*p_lastSeenWatchDate forKey:@"AutoUnlockLastSeenWatchDate"];
  }
  else {
    [v7 removeObjectForKey:@"AutoUnlockLastSeenWatchDate"];
  }
}

- (NSNumber)watchExistedInUnlockList
{
  watchExistedInUnlockList = self->_watchExistedInUnlockList;
  if (!watchExistedInUnlockList)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 BOOLForKey:@"AutoUnlockWatchExistedInUnlockList"]));
    double v6 = self->_watchExistedInUnlockList;
    self->_watchExistedInUnlockList = v5;

    uint64_t v8 = auto_unlock_log(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = -[NSNumber BOOLValue](self->_watchExistedInUnlockList, "BOOLValue");
      id v11 = @"NO";
      if (v10) {
        id v11 = @"YES";
      }
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loaded watchExistedInUnlockList %@",  (uint8_t *)&v13,  0xCu);
    }

    watchExistedInUnlockList = self->_watchExistedInUnlockList;
  }

  return watchExistedInUnlockList;
}

- (void)setWatchExistedInUnlockList:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forKey:@"AutoUnlockWatchExistedInUnlockList"];
}

- (NSNumber)watchCurrentlyInList
{
  watchCurrentlyInList = self->_watchCurrentlyInList;
  if (!watchCurrentlyInList)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 BOOLForKey:@"AutoUnlockWatchCurrentlyInList"]));
    id v6 = self->_watchCurrentlyInList;
    self->_watchCurrentlyInList = v5;

    uint64_t v8 = auto_unlock_log(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = -[NSNumber BOOLValue](self->_watchCurrentlyInList, "BOOLValue");
      id v11 = @"NO";
      if (v10) {
        id v11 = @"YES";
      }
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loaded watchCurrentlyInList %@",  (uint8_t *)&v13,  0xCu);
    }

    watchCurrentlyInList = self->_watchCurrentlyInList;
  }

  return watchCurrentlyInList;
}

- (void)setWatchCurrentlyInList:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forKey:@"AutoUnlockWatchCurrentlyInList"];
}

- (BOOL)showIDInName
{
  return sub_10008E24C(@"AUShowIDInName", 0LL) != 0;
}

- (BOOL)showOtherDevices
{
  return sub_10008E24C(@"AUShowOtherDevices", 0LL) != 0;
}

- (BOOL)disableEncryption
{
  return sub_10008E24C(@"AUDisableEncryption", 0LL) != 0;
}

- (BOOL)pairingRequestIsValidForDeviceID:(id)a3 messageContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverReceivedTime]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 escrowSecretCreationDateForDeviceID:v5]);

  uint64_t v11 = auto_unlock_log(v10);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    __int16 v24 = v9;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Pairing request arrived (creation date: %@ server date: %@) from device: %@",  (uint8_t *)&v23,  0x20u);
  }

  if (v9 && v7 && (id v13 = [v7 timeIntervalSinceDate:v9], v14 < 0.0)
    || [v6 fromServerStorage]
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 serverReceivedTime]),
        [v15 timeIntervalSinceDate:v16],
        double v18 = v17,
        v16,
        v15,
        v18 >= 60.0))
  {
    uint64_t v20 = auto_unlock_log(v13);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      __int16 v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Pairing request arrived outside window (creation date: %@ server date: %@)",  (uint8_t *)&v23,  0x16u);
    }

    BOOL v19 = 0;
  }

  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (id)state
{
  id v38 = 0LL;
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v38, "%@\n", v5);
  id v6 = v38;

  id v37 = v6;
  NSAppendPrintF(&v37, "-------------\n");
  id v7 = v37;

  id v36 = v7;
  NSAppendPrintF(&v36, "\n");
  id v8 = v36;

  id v35 = v8;
  NSAppendPrintF(&v35, "Unlock IDS Devices\n");
  id v9 = v35;

  id v34 = v9;
  NSAppendPrintF(&v34, "-------------\n");
  id v10 = v34;

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 devices]);

  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    id v16 = v10;
    id obj = v12;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v29 = v16;
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 modelIdentifier]);
        int v22 = (void *)objc_claimAutoreleasedReturnValue([v18 productBuildVersion]);
        int v23 = (void *)objc_claimAutoreleasedReturnValue([v18 nsuuid]);
        NSAppendPrintF(&v29, "%''@, %@, %@, %@, BT=%@", v19, v20, v21, v22, v23);
        id v24 = v29;

        id v28 = v24;
        NSAppendPrintF(&v28, "\n");
        id v16 = v28;
      }

      id v14 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }

    while (v14);
    id v10 = obj;
  }

  else
  {

    id v27 = v10;
    NSAppendPrintF(&v27, "No devices registered\n");
    id v16 = v27;
  }

  return v16;
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (SDAutoUnlockTransportClient)primaryClient
{
  return (SDAutoUnlockTransportClient *)objc_loadWeakRetained((id *)&self->_primaryClient);
}

- (void)setPrimaryClient:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (NSMapTable)clientMap
{
  return self->_clientMap;
}

- (void)setClientMap:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableDictionary)sendIdentifierToSessionID
{
  return self->_sendIdentifierToSessionID;
}

- (void)setSendIdentifierToSessionID:(id)a3
{
}

- (NSMutableDictionary)sendDates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSendDates:(id)a3
{
}

- (NSDate)lastSendDate
{
  return self->_lastSendDate;
}

- (void)setLastSendDate:(id)a3
{
}

- (NSMutableDictionary)autoUnlockDeviceCache
{
  return self->_autoUnlockDeviceCache;
}

- (void)setAutoUnlockDeviceCache:(id)a3
{
}

- (NSMutableDictionary)cloudPairRetryRecords
{
  return self->_cloudPairRetryRecords;
}

- (void)setCloudPairRetryRecords:(id)a3
{
}

- (NSMutableDictionary)cachedBluetoothIDToUniqueIDs
{
  return self->_cachedBluetoothIDToUniqueIDs;
}

- (void)setCachedBluetoothIDToUniqueIDs:(id)a3
{
}

- (NSSet)cachedApproveBluetoothIDs
{
  return self->_cachedApproveBluetoothIDs;
}

- (void)setCachedApproveBluetoothIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end