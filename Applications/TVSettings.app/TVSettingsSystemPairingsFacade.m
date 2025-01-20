@interface TVSettingsSystemPairingsFacade
+ (id)sharedInstance;
- (BOOL)deviceStillPaired:(id)a3;
- (BOOL)didRegisterForRemotePairingDarwinNotifications;
- (BOOL)removeDeviceWithPairedPeer:(id)a3;
- (CUPairingManager)pairingManager;
- (NSArray)pairedDevicesInDisplayOrder;
- (NSMutableDictionary)identifierToDeviceMap;
- (SFService)pairingAdvertisingService;
- (TVSettingsSystemPairingsFacade)init;
- (_TtC10TVSettings27RemotePairingPairingManager)remotePairingPairingManager;
- (id)deviceWithPairedPeer:(id)a3 isDevicePairing:(BOOL)a4 createIfNecessary:(BOOL)a5;
- (id)deviceWithRemotePairingPairedHost:(id)a3 createIfNecessary:(BOOL)a4;
- (void)_clearDevices:(BOOL)a3;
- (void)_configurePairingManager;
- (void)_destroyPairingManager;
- (void)_peerAdded:(id)a3 options:(unint64_t)a4;
- (void)_peerChanged:(id)a3 options:(unint64_t)a4;
- (void)_peerRemoved:(id)a3 options:(unint64_t)a4;
- (void)_queryPairedPeers;
- (void)_updateDeviceDisplayFromDeviceMap;
- (void)_updateFromCoreUtilsPairedPeers:(id)a3 isDevice:(BOOL)a4;
- (void)_updateFromRemotePairingPairedHosts:(id)a3;
- (void)dealloc;
- (void)removeCoreUtilsPairingWithIdentifier:(id)a3 isDevice:(BOOL)a4 withCompletion:(id)a5;
- (void)setDidRegisterForRemotePairingDarwinNotifications:(BOOL)a3;
- (void)setIdentifierToDeviceMap:(id)a3;
- (void)setPairedDevicesInDisplayOrder:(id)a3;
- (void)setPairingAdvertisingService:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setRemotePairingPairingManager:(id)a3;
- (void)startAdvertising;
- (void)startScanningIfNeeded;
- (void)stopAdvertising;
- (void)unpairDevice:(id)a3 withCompletion:(id)a4;
@end

@implementation TVSettingsSystemPairingsFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C284;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1588 != -1) {
    dispatch_once(&qword_1001E1588, block);
  }
  return (id)qword_1001E1580;
}

- (TVSettingsSystemPairingsFacade)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsFacade;
  v2 = -[TVSettingsSystemPairingsFacade init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    pairedDevicesInDisplayOrder = v2->_pairedDevicesInDisplayOrder;
    v2->_pairedDevicesInDisplayOrder = (NSArray *)&__NSArray0__struct;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifierToDeviceMap = v3->_identifierToDeviceMap;
    v3->_identifierToDeviceMap = (NSMutableDictionary *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS____TtC10TVSettings27RemotePairingPairingManager);
    remotePairingPairingManager = v3->_remotePairingPairingManager;
    v3->_remotePairingPairingManager = v7;
  }

  return v3;
}

- (void)startScanningIfNeeded
{
  if (!self->_pairingManager) {
    -[TVSettingsSystemPairingsFacade _configurePairingManager](self, "_configurePairingManager");
  }
  if (!self->_didRegisterForRemotePairingDarwinNotifications)
  {
    self->_didRegisterForRemotePairingDarwinNotifications = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10000C3A4,  kRemotePairingTrustedHostsUpdatedNotificationName,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

- (void)startAdvertising
{
  v3 = objc_alloc_init(&OBJC_CLASS___SFService);
  pairingAdvertisingService = self->_pairingAdvertisingService;
  self->_pairingAdvertisingService = v3;

  -[SFService setDeviceActionType:](self->_pairingAdvertisingService, "setDeviceActionType:", 6LL);
  -[SFService setIdentifier:](self->_pairingAdvertisingService, "setIdentifier:", SFServiceIdentifierSetup);
  -[SFService setNeedsSetup:](self->_pairingAdvertisingService, "setNeedsSetup:", 1LL);
  -[SFService activateWithCompletion:](self->_pairingAdvertisingService, "activateWithCompletion:", &stru_10018E7E8);
}

- (void)stopAdvertising
{
  pairingAdvertisingService = self->_pairingAdvertisingService;
  self->_pairingAdvertisingService = 0LL;
}

- (void)_destroyPairingManager
{
  pairingManager = self->_pairingManager;
  self->_pairingManager = 0LL;
}

- (void)_configurePairingManager
{
  v3 = objc_alloc_init(&OBJC_CLASS___CUPairingManager);
  pairingManager = self->_pairingManager;
  self->_pairingManager = v3;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000C858;
  v16[3] = &unk_10018E810;
  objc_copyWeak(&v17, &location);
  -[CUPairingManager setInterruptionHandler:](self->_pairingManager, "setInterruptionHandler:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000C884;
  v14[3] = &unk_10018E810;
  objc_copyWeak(&v15, &location);
  -[CUPairingManager setInvalidationHandler:](self->_pairingManager, "setInvalidationHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000C8B0;
  v12[3] = &unk_10018E838;
  objc_copyWeak(&v13, &location);
  -[CUPairingManager setPairedPeerAddedHandler:](self->_pairingManager, "setPairedPeerAddedHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000C908;
  v10[3] = &unk_10018E838;
  objc_copyWeak(&v11, &location);
  -[CUPairingManager setPairedPeerRemovedHandler:](self->_pairingManager, "setPairedPeerRemovedHandler:", v10);
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_10000C960;
  v8 = &unk_10018E838;
  objc_copyWeak(&v9, &location);
  -[CUPairingManager setPairedPeerChangedHandler:](self->_pairingManager, "setPairedPeerChangedHandler:", &v5);
  -[CUPairingManager startMonitoringWithOptions:]( self->_pairingManager,  "startMonitoringWithOptions:",  0LL,  v5,  v6,  v7,  v8);
  -[TVSettingsSystemPairingsFacade _queryPairedPeers](self, "_queryPairedPeers");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_queryPairedPeers
{
  pairingManager = self->_pairingManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000CA88;
  v8[3] = &unk_10018E860;
  v8[4] = self;
  -[CUPairingManager getPairedPeersWithOptions:completion:]( pairingManager,  "getPairedPeersWithOptions:completion:",  4LL,  v8);
  v4 = self->_pairingManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CB5C;
  v7[3] = &unk_10018E860;
  v7[4] = self;
  -[CUPairingManager getPairedPeersWithOptions:completion:](v4, "getPairedPeersWithOptions:completion:", 0LL, v7);
  remotePairingPairingManager = self->_remotePairingPairingManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CC30;
  v6[3] = &unk_10018E860;
  v6[4] = self;
  -[RemotePairingPairingManager listPairedHostsInvokingCompletionHandlerOnQueue:completion:]( remotePairingPairingManager,  "listPairedHostsInvokingCompletionHandlerOnQueue:completion:",  &_dispatch_main_q,  v6);
}

- (BOOL)deviceStillPaired:(id)a3
{
  identifierToDeviceMap = self->_identifierToDeviceMap;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 key]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifierToDeviceMap, "objectForKeyedSubscript:", v4));
  LOBYTE(identifierToDeviceMap) = v5 != 0LL;

  return (char)identifierToDeviceMap;
}

- (void)unpairDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 source];
  if (v8 == (id)2)
  {
    remotePairingPairingManager = self->_remotePairingPairingManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000CF54;
    v16[3] = &unk_10018E8B0;
    objc_super v10 = &v17;
    void v16[4] = self;
    id v17 = v7;
    -[RemotePairingPairingManager removePairingWithIdentifier:invokingCompletionHandlerOnQueue:completion:]( remotePairingPairingManager,  "removePairingWithIdentifier:invokingCompletionHandlerOnQueue:completion:",  v9,  &_dispatch_main_q,  v16);
LABEL_8:

    goto LABEL_9;
  }

  if (v8 == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000CF24;
    v18[3] = &unk_10018E888;
    objc_super v10 = &v19;
    v18[4] = self;
    id v19 = v7;
    id v11 = v18;
    v12 = self;
    id v13 = v9;
    uint64_t v14 = 1LL;
    goto LABEL_7;
  }

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000CEF4;
    v20[3] = &unk_10018E888;
    objc_super v10 = &v21;
    v20[4] = self;
    id v21 = v7;
    id v11 = v20;
    v12 = self;
    id v13 = v9;
    uint64_t v14 = 0LL;
LABEL_7:
    -[TVSettingsSystemPairingsFacade removeCoreUtilsPairingWithIdentifier:isDevice:withCompletion:]( v12,  "removeCoreUtilsPairingWithIdentifier:isDevice:withCompletion:",  v13,  v14,  v11);
    goto LABEL_8;
  }

- (void)removeCoreUtilsPairingWithIdentifier:(id)a3 isDevice:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___CUPairedPeer);
  [v10 setIdentifier:v9];

  if (v5) {
    uint64_t v11 = 4LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  pairingManager = self->_pairingManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000D0F8;
  v14[3] = &unk_10018E8D8;
  id v15 = v8;
  id v13 = v8;
  -[CUPairingManager removePairedPeer:options:completion:]( pairingManager,  "removePairedPeer:options:completion:",  v10,  v11,  v14);
}

- (void)_updateFromRemotePairingPairedHosts:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 =  -[TVSettingsSystemPairingsFacade deviceWithRemotePairingPairedHost:createIfNecessary:]( self,  "deviceWithRemotePairingPairedHost:createIfNecessary:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  1LL);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  -[TVSettingsSystemPairingsFacade _updateDeviceDisplayFromDeviceMap](self, "_updateDeviceDisplayFromDeviceMap");
}

- (void)_updateFromCoreUtilsPairedPeers:(id)a3 isDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 =  -[TVSettingsSystemPairingsFacade deviceWithPairedPeer:isDevicePairing:createIfNecessary:]( self,  "deviceWithPairedPeer:isDevicePairing:createIfNecessary:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10),  v4,  1LL);
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  -[TVSettingsSystemPairingsFacade _updateDeviceDisplayFromDeviceMap](self, "_updateDeviceDisplayFromDeviceMap");
}

- (void)_updateDeviceDisplayFromDeviceMap
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_identifierToDeviceMap, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:&stru_10018E918]);
  -[TVSettingsSystemPairingsFacade setPairedDevicesInDisplayOrder:](self, "setPairedDevicesInDisplayOrder:", v3);
}

- (void)_peerAdded:(id)a3 options:(unint64_t)a4
{
  id v5 =  -[TVSettingsSystemPairingsFacade deviceWithPairedPeer:isDevicePairing:createIfNecessary:]( self,  "deviceWithPairedPeer:isDevicePairing:createIfNecessary:",  a3,  1LL,  1LL);
  -[TVSettingsSystemPairingsFacade _updateDeviceDisplayFromDeviceMap](self, "_updateDeviceDisplayFromDeviceMap");
}

- (void)_peerRemoved:(id)a3 options:(unint64_t)a4
{
}

- (void)_peerChanged:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsSystemPairingsFacade deviceWithPairedPeer:isDevicePairing:createIfNecessary:]( self,  "deviceWithPairedPeer:isDevicePairing:createIfNecessary:",  v5,  1LL,  1LL));
  [v6 updateWithCoreUtilsPeer:v5];

  -[TVSettingsSystemPairingsFacade _updateDeviceDisplayFromDeviceMap](self, "_updateDeviceDisplayFromDeviceMap");
}

- (void)_clearDevices:(BOOL)a3
{
  if (a3)
  {
    -[TVSettingsSystemPairingsFacade setPairedDevicesInDisplayOrder:]( self,  "setPairedDevicesInDisplayOrder:",  &__NSArray0__struct);
  }

  else
  {
    pairedDevicesInDisplayOrder = self->_pairedDevicesInDisplayOrder;
    self->_pairedDevicesInDisplayOrder = (NSArray *)&__NSArray0__struct;
  }

  -[NSMutableDictionary removeAllObjects](self->_identifierToDeviceMap, "removeAllObjects");
}

- (id)deviceWithPairedPeer:(id)a3 isDevicePairing:(BOOL)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  identifierToDeviceMap = self->_identifierToDeviceMap;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v11 = (TVSettingsSystemPairingsPairing *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifierToDeviceMap,  "objectForKeyedSubscript:",  v10));

  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v5;
  }
  if (!v12)
  {
    id v11 = -[TVSettingsSystemPairingsPairing initWithCoreUtilsPairedPeer:isDevicePairing:]( objc_alloc(&OBJC_CLASS___TVSettingsSystemPairingsPairing),  "initWithCoreUtilsPairedPeer:isDevicePairing:",  v8,  v6);
    -[TVSettingsSystemPairingsPairing setFacade:](v11, "setFacade:", self);
    __int128 v13 = self->_identifierToDeviceMap;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingsPairing key](v11, "key"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, v14);
  }

  return v11;
}

- (id)deviceWithRemotePairingPairedHost:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  identifierToDeviceMap = self->_identifierToDeviceMap;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v9 = (TVSettingsSystemPairingsPairing *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifierToDeviceMap,  "objectForKeyedSubscript:",  v8));

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    uint64_t v9 = -[TVSettingsSystemPairingsPairing initWithRemotePairingPairedHost:]( objc_alloc(&OBJC_CLASS___TVSettingsSystemPairingsPairing),  "initWithRemotePairingPairedHost:",  v6);
    -[TVSettingsSystemPairingsPairing setFacade:](v9, "setFacade:", self);
    id v11 = self->_identifierToDeviceMap;
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingsPairing key](v9, "key"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);
  }

  return v9;
}

- (BOOL)removeDeviceWithPairedPeer:(id)a3
{
  id v4 = a3;
  identifierToDeviceMap = self->_identifierToDeviceMap;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifierToDeviceMap, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    [v7 setFacade:0];
    id v8 = self->_identifierToDeviceMap;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0LL, v9);
  }

  return v7 != 0LL;
}

- (void)dealloc
{
  if (self->_didRegisterForRemotePairingDarwinNotifications)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kRemotePairingTrustedHostsUpdatedNotificationName, 0LL);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsFacade;
  -[TVSettingsSystemPairingsFacade dealloc](&v4, "dealloc");
}

- (NSArray)pairedDevicesInDisplayOrder
{
  return self->_pairedDevicesInDisplayOrder;
}

- (void)setPairedDevicesInDisplayOrder:(id)a3
{
}

- (NSMutableDictionary)identifierToDeviceMap
{
  return self->_identifierToDeviceMap;
}

- (void)setIdentifierToDeviceMap:(id)a3
{
}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (_TtC10TVSettings27RemotePairingPairingManager)remotePairingPairingManager
{
  return self->_remotePairingPairingManager;
}

- (void)setRemotePairingPairingManager:(id)a3
{
}

- (SFService)pairingAdvertisingService
{
  return self->_pairingAdvertisingService;
}

- (void)setPairingAdvertisingService:(id)a3
{
}

- (BOOL)didRegisterForRemotePairingDarwinNotifications
{
  return self->_didRegisterForRemotePairingDarwinNotifications;
}

- (void)setDidRegisterForRemotePairingDarwinNotifications:(BOOL)a3
{
  self->_didRegisterForRemotePairingDarwinNotifications = a3;
}

- (void).cxx_destruct
{
}

@end