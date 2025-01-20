@interface EAManager
+ (id)newPlistForAccessory:(id)a3;
+ (id)sharedManager;
+ (id)stringForClientID:(unsigned int)a3;
+ (void)_updatePlistWithAccessoryProtocolsInternal:(id)a3;
- (BOOL)_isProtocolContainedInWhitelist:(id)a3;
- (BOOL)closeSessionForConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4 notifyApp:(BOOL)a5;
- (BOOL)fakedLocationDeviceFilteringSupport;
- (BOOL)isFakedLocationDeviceEnabled;
- (BOOL)openSessionForClientID:(unsigned int)a3 connetionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6;
- (BOOL)sessionsOpenForDisplayIdentifer:(const char *)a3;
- (EAManager)init;
- (id).cxx_construct;
- (id)accessoryForConnectionID:(id)a3;
- (id)connectedAccessories;
- (id)connectedAccessoriesForEAClient:(unsigned int)a3;
- (id)connectionIDObjectForConnectionID:(unsigned int)a3;
- (id)sessionForAccessoryWithConnectionID:(unsigned int)a3 andSessionID:(unsigned __int16)a4;
- (id)valueForProperty:(id)a3 forAccessory:(unsigned int)a4;
- (unsigned)addClient:(unsigned int)a3 withAuditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9;
- (unsigned)clientIDForDisplayIdentifier:(const char *)a3;
- (unsigned)generateClientID;
- (void)_dpServiceWithFirmwareVersionFound:(id)a3;
- (void)_takeClientAssertionsForAccessoryConnection;
- (void)_takeClientAssertionsForAccessoryDisconnection;
- (void)_unregisteredClientAssertionTimerFired:(id)a3;
- (void)applicationStateChanged:(id)a3;
- (void)attachAccessory:(const IPodAccessoryDetails *)a3 forTransport:(void *)a4;
- (void)dealloc;
- (void)detachAccessory:(unsigned int)a3;
- (void)fakedLocationDeviceEphemerisMaxIntervalAvailable;
- (void)fakedLocationDeviceEphemerisRefreshIntervalAvailable;
- (void)fakedLocationDeviceEphemerisURLAvailable;
- (void)fakedLocationDeviceFilteringSupport:(BOOL)a3;
- (void)fakedLocationDeviceNMEAAvailable;
- (void)fakedLocationDevicePointDataAvailable;
- (void)fakedLocationDeviceSetFilter:(id)a3;
- (void)fakedLocationRequestGPSTime;
- (void)logAccessoryAttach:(id)a3 reason:(id)a4;
- (void)logAccessoryDetach:(id)a3 reason:(id)a4;
- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5;
- (void)notifyEAClient:(id)a3 ofNotificationName:(const char *)a4 withPayload:(id)a5;
- (void)notifyEAClientsOfAccessoryConnection:(id)a3;
- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3;
- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4;
- (void)notifyEAClientsOfAccessoryPortPropertyChanged:(id)a3;
- (void)notifyEAClientsOfAccessoryReconnection:(id)a3;
- (void)notifyEAClientsOfAccessoryUpdated:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:(id)a3;
- (void)openCompleteForSessionWithConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4;
- (void)removeAllClients;
- (void)removeClientForXPCConnection:(id)a3;
- (void)reset;
- (void)sendToEALocationClientsNotification:(const char *)a3 withPayload:(id)a4;
- (void)setFakedLocationDeviceEnabled:(BOOL)a3 forClientID:(unsigned int)a4;
- (void)setFakedLocationDeviceFilteringSupport:(BOOL)a3;
- (void)takeProcessAssertionForBundleID:(id)a3;
- (void)updateAccessoryInfo:(const IPodAccessoryDetails *)a3;
- (void)updateAccessoryProtocols:(const IPodAccessoryDetails *)a3;
- (void)updateLocationSupport:(unsigned int)a3 isReady:(BOOL)a4;
- (void)updatePlistWithProtocolsForAccessory:(id)a3;
- (void)updateSpeakerEqIndex:(unsigned int)a3 eqIndex:(unsigned int)a4;
- (void)updateSpeakerMenu:(unsigned int)a3 withEqNames:(id)a4 andSelection:(unsigned int)a5;
- (void)updateValueFromApp:(id)a3;
- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6;
- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6 updateApp:(BOOL)a7;
@end

@implementation EAManager

- (EAManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___EAManager;
  v2 = -[EAManager init](&v4, "init");
  if (!v2) {
    return v2;
  }
  result = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ((((_BYTE)v2 + 8) & 7) == 0)
  {
    v2->_connectedAccessories = (NSMutableDictionary *)result;
    result = objc_alloc_init(&OBJC_CLASS___NSLock);
    if ((((_BYTE)v2 + 40) & 7) == 0)
    {
      v2->_connectedAccessoriesLock = (NSLock *)result;
      result = objc_alloc_init(&OBJC_CLASS___NSLock);
      if ((((_BYTE)v2 + 64) & 7) == 0)
      {
        v2->_clientLock = (NSLock *)result;
        signal(13, (void (__cdecl *)(int))1);
        result = objc_alloc_init(&OBJC_CLASS___IAPApplicationStateMonitor);
        if ((((int)v2 + 72) & 7LL) == 0)
        {
          v2->_appStateMonitor = (IAPApplicationStateMonitor *)result;
          -[EAManager setDelegate:](result, "setDelegate:", v2);
          -[IAPApplicationStateMonitor startObserving](v2->_appStateMonitor, "startObserving");
          -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_dpServiceWithFirmwareVersionFound:",  @"dpWithFwVer",  0LL);
          return v2;
        }
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 8) & 7) != 0) {
    goto LABEL_13;
  }

  if ((((_BYTE)self + 40) & 7) != 0) {
    goto LABEL_13;
  }

  if ((((_BYTE)self + 64) & 7) != 0) {
    goto LABEL_13;
  }

  begin_node = (EAManager *)0xAAAAAAAAAAAAAAAALL;
  begin_node = (EAManager *)self->_connectionIDMap.__tree_.__begin_node_;
  while (begin_node != (EAManager *)&self->_connectionIDMap.__tree_.__pair1_)
  {
    v3 = sub_100003154((uint64_t *)&begin_node);

    sub_100008A4C((uint64_t *)&begin_node);
  }

  sub_100008B2C((uint64_t)&self->_connectionIDMap);
  if ((((int)self + 72) & 7LL) != 0)
  {
LABEL_13:
    __break(0x5516u);
  }

  else
  {
    -[IAPApplicationStateMonitor stopObserving](self->_appStateMonitor, "stopObserving");

    self->_appStateMonitor = 0LL;
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___EAManager;
    -[EAManager dealloc](&v4, "dealloc");
  }

+ (id)sharedManager
{
  id result = (id)qword_10011BAB8;
  if (!qword_10011BAB8)
  {
    v3 = opendir((const char *)&kEAPipePath);
    if (v3)
    {
      objc_super v4 = v3;
      *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v23 = v5;
      __int128 v24 = v5;
      __int128 v21 = v5;
      __int128 v22 = v5;
      __int128 v19 = v5;
      __int128 v20 = v5;
      __int128 v17 = v5;
      __int128 v18 = v5;
      __int128 v15 = v5;
      __int128 v16 = v5;
      __int128 v13 = v5;
      __int128 v14 = v5;
      __int128 v11 = v5;
      __int128 v12 = v5;
      *(_OWORD *)__str = v5;
      __int128 v10 = v5;
      v6 = readdir(v3);
      if (v6)
      {
        while ((v6 & 7) == 0)
        {
          d_name = v6->d_name;
          if (strncmp(v6->d_name, ".", 0x100uLL))
          {
            if (strncmp(d_name, "..", 0x100uLL))
            {
              snprintf(__str, 0x100uLL, "%s/%s", (const char *)&kEAPipePath, d_name);
              if (unlink(__str) == -1)
              {
                v8 = __error();
                NSLog( @"ERROR - %s:%s - %d couldn't delete %s errno = %d",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "+[EAManager sharedManager]",  167LL,  __str,  *v8);
              }
            }
          }

          v6 = readdir(v4);
          if (!v6) {
            goto LABEL_12;
          }
        }

        __break(0x5516u);
      }

+ (id)stringForClientID:(unsigned int)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", *(void *)&a3);
}

+ (id)newPlistForAccessory:(id)a3
{
  v3 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", @"EAManagerAccessorySessions");
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", @"OptionalSDKProtocolsShownKey");
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", IAPAppAccessoryConnectionTimeInSecKey);
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", IAPEASessionOpenedTimesKey);
  return v3;
}

- (unsigned)generateClientID
{
  p_clients = &self->_clients;
  unint64_t v3 = (unint64_t)&self->_clients & 7;
  while (1)
  {
    uint64_t v4 = arc4random_uniform(0xFFFFFFFF);
    if (v3) {
      break;
    }
    int v5 = v4;
    id v6 = -[NSMutableDictionary objectForKey:]( *p_clients,  "objectForKey:",  +[EAManager stringForClientID:](&OBJC_CLASS___EAManager, "stringForClientID:", v4));
    if (v5 && !v6)
    {
      LODWORD(v4) = v5;
      return v4;
    }
  }

  __break(0x5516u);
  return v4;
}

- (void)logAccessoryAttach:(id)a3 reason:(id)a4
{
  uint64_t v5 = IAPAppAccessoryManufacturerKey;
  uint64_t v6 = IAPAppAccessoryModelNumberKey;
  +[IAPEventLogger LogMsg:WithDictionary:andKeys:]( &OBJC_CLASS___IAPEventLogger,  "LogMsg:WithDictionary:andKeys:",  2LL,  a3,  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  IAPAppAccessoryNameKey,  IAPAppAccessoryManufacturerKey,  IAPAppAccessoryModelNumberKey,  IAPAppAccessoryFirmwareRevisionKey,  IAPAppAccessoryHardwareRevisionKey,  0LL));
  +[IAPDataLogger PowerlogAccAttach:](&OBJC_CLASS___IAPDataLogger, "PowerlogAccAttach:", a3);
  if (sub_1000D1E60()) {
    +[IAPDataLogger AggAccAttach:WithManufacturer:]( IAPDataLogger,  "AggAccAttach:WithManufacturer:",  [a3 valueForKey:v6],  objc_msgSend(a3, "valueForKey:", v5));
  }
}

- (void)logAccessoryDetach:(id)a3 reason:(id)a4
{
  id v5 = [a3 objectForKey:IAPAppAccessoryConnectionTimeInSecKey];
  +[IAPDataLogger PowerlogAccDetach:AndConnectionTime:]( IAPDataLogger,  "PowerlogAccDetach:AndConnectionTime:",  a3,  [v5 unsignedLongValue]);
  BOOL v6 = sub_1000D1E60();
  if (v5) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = [a3 valueForKey:IAPAppAccessoryModelNumberKey];
    +[IAPDataLogger AggAccDetach:WithManufacturer:AndConnectionTime:]( IAPDataLogger,  "AggAccDetach:WithManufacturer:AndConnectionTime:",  v8,  [a3 valueForKey:IAPAppAccessoryManufacturerKey],  objc_msgSend(v5, "unsignedLongValue"));
  }

- (id)connectionIDObjectForConnectionID:(unsigned int)a3
{
  unsigned int v6 = a3;
  id v5 = (id)0xAAAAAAAAAAAAAAAALL;
  id result = &self->_connectionIDMap;
  if ((result & 7) != 0
    || (id result = (id)sub_100008C50((uint64_t)result, &v6),
        id v5 = result,
        ((unint64_t)&self->_connectionIDMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_10:
    __break(0x5516u);
    return result;
  }

  if (&self->_connectionIDMap.__tree_.__pair1_ != result)
  {
    id result = sub_100003154((uint64_t *)&v5);
    goto LABEL_10;
  }

  return 0LL;
}

- (unsigned)addClient:(unsigned int)a3 withAuditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9
{
  BOOL v46 = a8;
  p_clientLock = &self->_clientLock;
  -[NSLock lock](self->_clientLock, "lock");
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  p_clients = (id *)&self->_clients;
  v47 = self;
  unsigned int v49 = a5;
  id v15 = *p_clients;
  id v16 = [*p_clients countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v16) {
    goto LABEL_18;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v61;
  while (2)
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v61 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = [*p_clients objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * (void)i)];
      id v21 = v20;
      if (a9)
      {
        if (objc_msgSend(objc_msgSend(v20, "bundleId"), "isEqualToString:", a9))
        {
          sub_1000CEA98(3u, @"Found client by bundleID %@", a9);
LABEL_16:
          if (!v21) {
            goto LABEL_18;
          }
          NSLog( @"ERROR - %s:%s - %d already have client for mach port bundleID %@ and xpc connection %@",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager addClient:withAuditToken:currentClientID:xpcConnection:eaProtocols:notifyOfAlreadyConnectedAcces sories:andBundleId:]",  357LL,  a9,  a6);
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }

      else if ([v20 xpcConnection] == a6)
      {
        sub_1000CEA98(3u, @"Found client by xpcConnection %@, bundleID is %@", a6, 0LL);
        goto LABEL_16;
      }
    }

    id v17 = [v15 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v17) {
      continue;
    }
    break;
  }

- (void)removeClientForXPCConnection:(id)a3
{
  p_clientLock = &self->_clientLock;
  -[NSLock lock](self->_clientLock, "lock");
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  p_clients = (id *)&self->_clients;
  id v7 = *p_clients;
  id v8 = [*p_clients countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (!v8) {
    goto LABEL_36;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v37;
LABEL_5:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v37 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = [*p_clients objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * v11)];
    if ([v12 xpcConnection] == a3) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (!v9)
      {
LABEL_36:
        NSLog(@"Didn't find client to remove");
        NSLog( @"ERROR - %s:%s - %d couldn't find client for xpc client %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager removeClientForXPCConnection:]",  416LL,  a3);
        goto LABEL_37;
      }

      goto LABEL_5;
    }
  }

  NSLog(@"Found client to remove, client bundleID is %@", [v12 bundleId]);
  if (!v12) {
    goto LABEL_36;
  }
  unsigned int v27 = [v12 clientID];
  if ([v12 locationSupportedByClient])
  {
    [v12 setLocationSupportedByClient:0];
    self->_fakedLocationDeviceEnabled = 0;
  }

  if (([v12 capabilities] & 4) != 0)
  {
    uint64_t v13 = sub_1000C7788();
    if (v13 && (v13 & 7) == 0)
    {
      (*(void (**)(uint64_t, void))(*(void *)v13 + 160LL))(v13, 0LL);
      goto LABEL_19;
    }

- (void)removeAllClients
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (-[NSLock lock](self->_clientLock, "lock"),
        __int128 v38 = 0u,
        __int128 v39 = 0u,
        __int128 v36 = 0u,
        __int128 v37 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_35:
    __break(0x5516u);
  }

  id obj = *p_clients;
  id v21 = [*p_clients countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v21)
  {
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    uint64_t v19 = *(void *)v37;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        id v4 = objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v36 + 1) + 8 * v3), p_clientLock);
        unsigned int v25 = [v4 clientID];
        id v5 = (_xpc_connection_s *)[v4 xpcConnection];
        if (!v5) {
          goto LABEL_34;
        }
        xpc_connection_set_event_handler(v5, &stru_100101AD0);
        if ([v4 locationSupportedByClient])
        {
          [v4 setLocationSupportedByClient:0];
          self->_fakedLocationDeviceEnabled = 0;
        }

        if (([v4 capabilities] & 4) != 0)
        {
          uint64_t v6 = sub_1000C7788();
          if (!v6 || (v6 & 7) != 0) {
            goto LABEL_35;
          }
          (*(void (**)(uint64_t, void))(*(void *)v6 + 160LL))(v6, 0LL);
        }

        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        uint64_t v22 = v3;
        id v23 = *p_connectedAccessories;
        id v7 = [*p_connectedAccessories countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v33;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v33 != v9) {
                objc_enumerationMutation(v23);
              }
              id v11 = objc_msgSend( objc_msgSend( objc_msgSend( *p_connectedAccessories,  "objectForKey:",  *(void *)(*((void *)&v32 + 1) + 8 * (void)i)),  "objectForKey:",  @"EAManagerAccessorySessions"),  "sessionsForClientID:",  v25);
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              __int128 v30 = 0u;
              __int128 v31 = 0u;
              id v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v29;
                do
                {
                  for (j = 0LL; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v29 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    -[EAManager closeSessionForConnectionID:sessionID:notifyApp:]( self,  "closeSessionForConnectionID:sessionID:notifyApp:",  [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) connectionID],  objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)j), "sessionID"),  0);
                  }

                  id v13 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
                }

                while (v13);
              }
            }

            id v8 = [v23 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }

          while (v8);
        }

        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        if (!global_queue)
        {
LABEL_34:
          __break(0x5510u);
          goto LABEL_35;
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000421C;
        block[3] = &unk_100101AF8;
        block[4] = self;
        unsigned int v27 = v25;
        dispatch_async(global_queue, block);
        ++v3;
      }

      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }

    while (v21);
  }

  -[NSLock unlock](*p_clientLock, "unlock", p_clientLock);
}

- (unsigned)clientIDForDisplayIdentifier:(const char *)a3
{
  id v4 = -[NSString initWithCString:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithCString:encoding:", a3, 4LL);
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (uint64_t v6 = v4,
        -[NSLock lock](self->_clientLock, "lock"),
        __int128 v18 = 0u,
        __int128 v19 = 0u,
        __int128 v16 = 0u,
        __int128 v17 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id v8 = *p_clients;
  id v9 = [*p_clients countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend( *p_clients,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)i),  (void)v16);
        if (!objc_msgSend(objc_msgSend(v13, "bundleId"), "compare:options:", v6, 1))
        {
          unsigned int v14 = [v13 clientID];
          goto LABEL_13;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  unsigned int v14 = 0;
LABEL_13:
  -[NSLock unlock](*p_clientLock, "unlock", (void)v16);

  return v14;
}

- (BOOL)sessionsOpenForDisplayIdentifer:(const char *)a3
{
  __int128 v16 = -[NSString initWithCString:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithCString:encoding:", a3, 4LL);
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (-[NSLock lock](self->_clientLock, "lock"),
        __int128 v25 = 0u,
        __int128 v26 = 0u,
        __int128 v23 = 0u,
        __int128 v24 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_22:
    __break(0x5516u);
  }

  id obj = *p_clients;
  id v18 = [*p_clients countByEnumeratingWithState:&v23 objects:v28 count:16];
  int v4 = 0;
  if (v18)
  {
    uint64_t v15 = *(void *)v24;
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*p_clients objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * (void)i)];
        if (-[NSString caseInsensitiveCompare:](v16, "caseInsensitiveCompare:", [v7 bundleId]) == NSOrderedSame)
        {
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v8 = *p_connectedAccessories;
          id v9 = [*p_connectedAccessories countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                if (objc_msgSend( objc_msgSend( objc_msgSend( *p_connectedAccessories,  "objectForKey:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)j)),  "objectForKey:",  @"EAManagerAccessorySessions"),  "sessionsForClientID:",  objc_msgSend(v7, "clientID")))
                {
                  int v4 = 1;
                }
              }

              id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v10);
          }
        }
      }

      id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v18);
  }

  -[NSLock unlock](self->_clientLock, "unlock");
  return v4 != 0;
}

- (void)attachAccessory:(const IPodAccessoryDetails *)a3 forTransport:(void *)a4
{
  if (!a3 || !a4) {
    return;
  }
  if (((*((uint64_t (**)(const IPodAccessoryDetails *, SEL))a3->var0 + 6))(a3, a2) & 0x200) != 0)
  {
    uint64_t v5 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 19))(a3);
    if (*(void *)(v5 + 16))
    {
      uint64_t v6 = (uint64_t *)v5;
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v9 = *v6;
      id v8 = v6 + 1;
      for (uint64_t i = v9; (void *)i != v8; sub_100008A4C(&i))
      {
        id v10 = sub_100003154(&i);
        if (!v10) {
          goto LABEL_192;
        }
        if ((((_BYTE)v10 + 8) & 7) != 0) {
          goto LABEL_192;
        }
        uint64_t v11 = v10 + 4;
        if (*v11)
        {
          id v12 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", *v11);
          if (v12)
          {
            -[NSMutableArray addObject:](v7, "addObject:", v12);
          }

          else
          {
            NSLog( @"ERROR - %s:%s - %d got an invalid UTF8 protocolString",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager attachAccessory:forTransport:]",  547LL);
          }
        }

        else
        {
          NSLog( @"ERROR - %s:%s - %d got a NULL protocolString",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager attachAccessory:forTransport:]",  552LL);
        }
      }

      id v13 = v7;
    }

    else
    {
      id v13 = 0LL;
    }

    __int128 v140 = 0u;
    __int128 v141 = 0u;
    __int128 v138 = 0u;
    __int128 v139 = 0u;
    id obj = v13;
    id v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v138,  v145,  16LL);
    if (!v103) {
      goto LABEL_55;
    }
    uint64_t v101 = *(void *)v139;
    p_clientLock = &self->_clientLock;
    uint64_t v108 = BKSApplicationStateKey;
LABEL_22:
    uint64_t v104 = 0LL;
    while (1)
    {
      if (*(void *)v139 != v101) {
        objc_enumerationMutation(obj);
      }
      id v107 = (id)SBSCopyDisplayIdentifiersForExternalAccessoryProtocol(*(void *)(*((void *)&v138 + 1) + 8 * v104));
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      __int128 v134 = 0u;
      __int128 v135 = 0u;
      id v116 = [v107 countByEnumeratingWithState:&v134 objects:v144 count:16];
      if (v116) {
        break;
      }
LABEL_53:

      if ((id)++v104 == v103)
      {
        id v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v138,  v145,  16LL);
        if (!v103)
        {
LABEL_55:
          int v4 = obj;
          goto LABEL_56;
        }

        goto LABEL_22;
      }
    }

    uint64_t v114 = *(void *)v135;
LABEL_27:
    uint64_t v118 = 0LL;
    while (1)
    {
      if (*(void *)v135 != v114) {
        objc_enumerationMutation(v107);
      }
      unsigned int v14 = *(void **)(*((void *)&v134 + 1) + 8 * v118);
      -[NSLock lock](self->_clientLock, "lock");
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      clients = self->_clients;
      id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v130,  v143,  16LL);
      if (!v16) {
        break;
      }
      char v17 = 0;
      uint64_t v18 = *(void *)v131;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v131 != v18) {
            objc_enumerationMutation(clients);
          }
          if (!objc_msgSend( v14,  "caseInsensitiveCompare:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_clients,  "objectForKey:",  *(void *)(*((void *)&v130 + 1) + 8 * (void)j)),  "bundleId")))
          {
            NSLog( @"%s:%s-%d app %@ found in client list",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager attachAccessory:forTransport:]",  570LL,  v14);
            char v17 = 1;
          }
        }

        id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v130,  v143,  16LL);
      }

      while (v16);
      -[NSLock unlock](*p_clientLock, "unlock");
      if ((v17 & 1) == 0) {
        goto LABEL_43;
      }
LABEL_51:
      if ((id)++v118 == v116)
      {
        id v116 = [v107 countByEnumeratingWithState:&v134 objects:v144 count:16];
        if (!v116) {
          goto LABEL_53;
        }
        goto LABEL_27;
      }
    }

    -[NSLock unlock](*p_clientLock, "unlock");
LABEL_43:
    if (objc_msgSend( objc_msgSend( -[IAPApplicationStateMonitor applicationInfoForBundleIDSync:]( self->_appStateMonitor,  "applicationInfoForBundleIDSync:",  v14),  "objectForKey:",  v108),  "unsignedIntValue") <= 3)
    {
      id v20 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v14);
      if (v20)
      {
        id v21 = [v20 UIBackgroundModes];
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
        {
          unsigned int v23 = [v21 containsObject:@"external-accessory"];
          sub_1000CEA98( 3u,  @"client '%@' supports background EA = %d, if true needs a process assertion\n",  v14,  v23);
          if (v23)
          {
            uint64_t v24 = sub_10004783C();
            if (!v24 || (v24 & 7) != 0) {
              goto LABEL_192;
            }
            (*(void (**)(uint64_t, id))(*(void *)v24 + 328))( v24,  [v14 cStringUsingEncoding:4]);
          }
        }
      }
    }

    goto LABEL_51;
  }

  int v4 = 0LL;
LABEL_56:

  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v112 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 2))(a3);
  v119 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3));
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  -[NSLock lock](self->_connectedAccessoriesLock, "lock");
  p_connectedAccessories = &self->_connectedAccessories;
  id v26 = -[NSMutableDictionary objectForKey:](*p_connectedAccessories, "objectForKey:", v119);
  -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  if (v26)
  {
    id v27 = objc_msgSend(objc_msgSend(v26, "objectForKey:", @"EAManagerAccessorySessions"), "sessions");
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v28 = [v27 countByEnumeratingWithState:&v126 objects:v142 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v127;
      do
      {
        for (k = 0LL; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v127 != v29) {
            objc_enumerationMutation(v27);
          }
          __int128 v31 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)k);
          sub_1000CEA98( 3u,  @"Closing existing sessionID %d for re-identifying connectionID %u\n",  [v31 sessionID],  objc_msgSend(v31, "connectionID"));
          -[EAManager closeSessionForConnectionID:sessionID:notifyApp:]( self,  "closeSessionForConnectionID:sessionID:notifyApp:",  [v31 connectionID],  objc_msgSend(v31, "sessionID"),  0);
        }

        id v28 = [v27 countByEnumeratingWithState:&v126 objects:v142 count:16];
      }

      while (v28);
    }
  }

  uint64_t i = 0LL;
  uint64_t v124 = 0LL;
  uint64_t v125 = 0LL;
  sub_1000BE638();
  int v32 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3);
  sub_1000C00F4(v32, 9u, &i);
  if (i != v124)
  {
    if (!i) {
      goto LABEL_192;
    }
    if ((i & 7) != 0) {
      goto LABEL_192;
    }
    uint64_t v33 = *(void *)i;
    if (!*(void *)i) {
      goto LABEL_192;
    }
    if ((v33 & 7) != 0) {
      goto LABEL_192;
    }
    __int128 v34 = (_DWORD *)(v33 + 16);
    if (*v34 > 7u) {
      goto LABEL_194;
    }
    __int128 v35 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v35, IAPAppAccessoryClassKey);
  }

  char v36 = (*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 6))(a3) >> 16;
  uint64_t v37 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 13))(a3);
  if (!v37 || (v37 & 3) != 0) {
    goto LABEL_192;
  }
  unsigned int v113 = v36 & 2 | (v112 >> 11) & 4;
  if (sub_1000D1DE0(v37 + 168))
  {
    sub_1000CEA98( 3u,  @"%s:%s-%d should be hiding accessory from Settings",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager attachAccessory:forTransport:]",  651LL);
    v113 |= 0x100u;
  }

  id v38 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v39 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  uint64_t v40 = v39;
  if (!(*(unsigned int (**)(void *))(*(void *)a4 + 216LL))(a4)
    || (*(unsigned int (**)(void *))(*(void *)a4 + 216LL))(a4) == 1)
  {
    id v41 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    uint64_t v42 = sub_100042AC4();
    uint64_t v43 = v42;
    if (!v42 || (v42 & 7) != 0) {
      goto LABEL_192;
    }
    objc_msgSend( v41,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  (*(uint64_t (**)(uint64_t, void *))(*(void *)v42 + 184))(v42, a4)),  kCFAccessoryPortPropertyIsConnected);
    v44 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    [v41 setObject:v44 forKey:kCFAccessoryPortPropertyIsActive];
    else {
      uint64_t v45 = (*(uint64_t (**)(uint64_t, void *))(*(void *)v43 + 168LL))(v43, a4);
    }
    BOOL v46 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v45);
    [v41 setObject:v46 forKey:kCFAccessoryPortPropertyVolumeControlIsSupported];
    if (-[NSNumber BOOLValue](v46, "BOOLValue"))
    {
      uint64_t v47 = sub_100042AC4();
      if (!v47 || (v47 & 7) != 0) {
        goto LABEL_192;
      }
      unsigned int v49 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v48);
      [v41 setObject:v49 forKey:kCFAccessoryPortPropertyVolumeScalar];
    }

    [v40 setObject:v41 forKey:kCFAccessoryPortLineOut];
  }

  if (!(*(unsigned int (**)(void *))(*(void *)a4 + 216LL))(a4)
    || (*(unsigned int (**)(void *))(*(void *)a4 + 216LL))(a4) == 1)
  {
    id v50 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    uint64_t v51 = sub_1000C06AC();
    if (!v51) {
      goto LABEL_192;
    }
    if ((v51 & 7) != 0) {
      goto LABEL_192;
    }
    objc_msgSend( v50,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  (*(uint64_t (**)(uint64_t, void *))(*(void *)v51 + 136))(v51, a4)),  kCFAccessoryPortPropertyIsConnected);
    LODWORD(v121.tv_sec) = 0;
    uint64_t v52 = sub_1000C06AC();
    if (!v52 || (v52 & 7) != 0) {
      goto LABEL_192;
    }
    uint64_t v53 = (*(uint64_t (**)(uint64_t, void *, timeval *))(*(void *)v52 + 120LL))(v52, a4, &v121);
    id v54 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if (LODWORD(v121.tv_sec))
    {
      unint64_t v55 = 0LL;
      unint64_t v56 = 0LL;
      BOOL v58 = (v53 & 3) == 0 && v53 != 0;
      while (v55 <= ~v53)
      {
        if (!v58) {
          goto LABEL_192;
        }
        objc_msgSend( v54,  "addObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v53 + v55)));
        ++v56;
        v55 += 4LL;
        if (v56 >= LODWORD(v121.tv_sec)) {
          goto LABEL_109;
        }
      }

- (void)updateAccessoryProtocols:(const IPodAccessoryDetails *)a3
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) == 0)
  {
    -[NSLock lock](*p_connectedAccessoriesLock, "lock");
    if (a3)
    {
      if ((a3 & 7) == 0)
      {
        uint64_t v6 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3));
        (*((void (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3);
        if (((unint64_t)&self->_connectedAccessories & 7) == 0)
        {
          id v7 = -[NSMutableDictionary objectForKey:](self->_connectedAccessories, "objectForKey:", v6);
          if (!v7
            || (id v8 = v7, ((*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 6))(a3) & 0x200) == 0))
          {
            -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
            return;
          }

          uint64_t v9 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 19))(a3);
          if (*(void *)(v9 + 16))
          {
            id v10 = (uint64_t *)v9;
            uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            if (v10[2])
            {
              id v13 = v10 + 1;
              __int128 v25 = v10;
              id v26 = (uint64_t *)*v10;
              if (v26 != v10 + 1)
              {
                char v14 = 0;
                while (1)
                {
                  uint64_t v15 = objc_alloc(&OBJC_CLASS___NSNumber);
                  id v16 = sub_100003154((uint64_t *)&v26);
                  if (!v16) {
                    goto LABEL_41;
                  }
                  char v17 = -[NSNumber initWithUnsignedInt:](v15, "initWithUnsignedInt:", *(unsigned __int8 *)v16);
                  uint64_t v18 = sub_100003154((uint64_t *)&v26);
                  if (!v18) {
                    goto LABEL_41;
                  }
                  if ((((_BYTE)v18 + 8) & 7) != 0) {
                    goto LABEL_41;
                  }
                  uint64_t v19 = v18[4];
                  id v20 = sub_100003154((uint64_t *)&v26);
                  if (!v20
                    || (v20 & 7) != 0
                    || (((_BYTE)v20 + 8) & 7) != 0
                    || ((unint64_t)(v20 + 5) & 7) != 0)
                  {
                    goto LABEL_41;
                  }

                  uint64_t v21 = *((unsigned int *)v20 + 10);
                  if (v19)
                  {
                    uint64_t v22 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  v19);
                    if (v22)
                    {
                      unsigned int v23 = v22;
                      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, v22);
                      -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v21),  v23);

                      if ((_DWORD)v21) {
                        char v14 = 1;
                      }
                    }

                    else
                    {
                      NSLog( @"ERROR - %s:%s - %d got an invalid UTF8 protocolString",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager updateAccessoryProtocols:]",  872LL);
                    }
                  }

                  else
                  {
                    NSLog( @"ERROR - %s:%s - %d got a NULL protocolString",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager updateAccessoryProtocols:]",  875LL);
                  }

                  sub_100008A4C((uint64_t *)&v26);
                  if (v26 == v13) {
                    goto LABEL_33;
                  }
                }
              }

              char v14 = 0;
LABEL_33:
              -[EAManager performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_shouldPostNoAppAlert:",  v11,  0LL);
              id v10 = v25;
            }

            else
            {
              char v14 = 0;
            }

            if (v10[2]) {
              [v8 setObject:v12 forKey:IAPAppAccessoryProtocolsKey];
            }

            if ((v14 & 1) != 0) {
              objc_msgSend( v8,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend( objc_msgSend(v8, "objectForKey:", IAPAppAccessoryCapabilitiesKey),  "unsignedIntValue") | 1),  IAPAppAccessoryCapabilitiesKey);
            }
          }

          -[EAManager logAccessoryAttach:reason:]( self,  "logAccessoryAttach:reason:",  v8,  @"Accessory protocols updated");
          id v24 = +[EAManager newPlistForAccessory:](&OBJC_CLASS___EAManager, "newPlistForAccessory:", v8);
          -[NSLock unlock](self->_connectedAccessoriesLock, "unlock");
          if (v24)
          {
            -[EAManager notifyEAClientsOfAccessoryReconnection:](self, "notifyEAClientsOfAccessoryReconnection:", v24);
          }

          return;
        }
      }
    }
  }

- (void)updateAccessoryInfo:(const IPodAccessoryDetails *)a3
{
  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (a3)
  {
    if ((a3 & 7) == 0)
    {
      uint64_t v5 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 13))(a3);
      if (((unint64_t)&self->_connectedAccessoriesLock & 7) == 0)
      {
        uint64_t v6 = (unsigned __int8 *)v5;
        -[NSLock lock](self->_connectedAccessoriesLock, "lock");
        id v7 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3));
        if (((unint64_t)&self->_connectedAccessories & 7) == 0)
        {
          id v8 = -[NSMutableDictionary objectForKey:](self->_connectedAccessories, "objectForKey:", v7);
          if (v6) {
            BOOL v9 = v8 == 0LL;
          }
          else {
            BOOL v9 = 1;
          }
          if (v9) {
            goto LABEL_39;
          }
          if ((v6 & 3) == 0)
          {
            id v10 = v8;
            uint64_t v11 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6);
            id v12 = v11 ? (__CFString *)v11 : &stru_10010A828;
            [v10 setObject:v12 forKey:IAPAppAccessoryNameKey];
            id v13 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6 + 104);
            char v14 = v13 ? (__CFString *)v13 : &stru_10010A828;
            [v10 setObject:v14 forKey:IAPAppAccessoryManufacturerKey];
            uint64_t v15 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6 + 168);
            id v16 = v15 ? (__CFString *)v15 : &stru_10010A828;
            [v10 setObject:v16 forKey:IAPAppAccessoryModelNumberKey];
            char v17 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6 + 232);
            uint64_t v18 = v17 ? (__CFString *)v17 : &stru_10010A828;
            [v10 setObject:v18 forKey:IAPAppAccessorySerialNumberKey];
            if (((unint64_t)(v6 + 64) & 3) == 0)
            {
              uint64_t v19 = v6[64];
              if (__PAIR64__(v6[65], v19) != 0xFF000000FFLL) {
                goto LABEL_27;
              }
              if ((((_DWORD)v6 + 66) & 1) != 0) {
                goto LABEL_42;
              }
              if (v6[66] == 255)
              {
                uint64_t v24 = IAPAppAccessoryFirmwareRevisionKey;
                unsigned int v23 = &stru_10010A828;
              }

              else
              {
LABEL_27:
                uint64_t v20 = v6[65];
                uint64_t v21 = v6[66];
                if (v6[296]) {
                  uint64_t v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (%s)",  v6 + 296);
                }
                else {
                  uint64_t v22 = &stru_10010A828;
                }
                unsigned int v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d.%d.%d%@",  v19,  v20,  v21,  v22);
                uint64_t v24 = IAPAppAccessoryFirmwareRevisionKey;
              }

              [v10 setObject:v23 forKey:v24];
              uint64_t v25 = v6[67];
              if ((_DWORD)v25 == 255)
              {
                if (v6[68] == 255 && v6[69] == 255)
                {
                  uint64_t v27 = IAPAppAccessoryHardwareRevisionKey;
                  id v26 = &stru_10010A828;
                  goto LABEL_38;
                }
              }

              if ((((_BYTE)v6 + 68) & 3) == 0)
              {
                id v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d.%d.%d",  v25,  v6[68],  v6[69]);
                uint64_t v27 = IAPAppAccessoryHardwareRevisionKey;
LABEL_38:
                [v10 setObject:v26 forKey:v27];
                sub_1000CEA98(3u, @"EA new accessory %@ updated", v10);
                -[EAManager logAccessoryAttach:reason:]( self,  "logAccessoryAttach:reason:",  v10,  @"Accessory info updated");
                id v28 = +[EAManager newPlistForAccessory:](&OBJC_CLASS___EAManager, "newPlistForAccessory:", v10);
                -[EAManager notifyEAClientsOfAccessoryUpdated:](self, "notifyEAClientsOfAccessoryUpdated:", v28);

LABEL_39:
                -[NSLock unlock](self->_connectedAccessoriesLock, "unlock");

                return;
              }
            }
          }
        }
      }
    }
  }

- (void)updateSpeakerMenu:(unsigned int)a3 withEqNames:(id)a4 andSelection:(unsigned int)a5
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (uint64_t v6 = *(void *)&a5,
        -[NSLock lock](self->_connectedAccessoriesLock, "lock"),
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    id v10 = -[NSMutableDictionary objectForKey:]( self->_connectedAccessories,  "objectForKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    if (v10)
    {
      uint64_t v11 = v10;
      [v10 setObject:a4 forKey:EAAccessorySpeakerMenuEQNamesKey];
      id v12 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6);
      [v11 setObject:v12 forKey:EAAccessorySpeakerMenuEQIndexKey];
      id v13 = +[EAManager newPlistForAccessory:](&OBJC_CLASS___EAManager, "newPlistForAccessory:", v11);
      -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
      if (v13)
      {
        -[EAManager notifyEAClientsOfAccessoryReconnection:](self, "notifyEAClientsOfAccessoryReconnection:", v13);
      }
    }

    else
    {
      -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
    }
  }

- (void)updateSpeakerEqIndex:(unsigned int)a3 eqIndex:(unsigned int)a4
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  uint64_t v5 = *(void *)&a4;
  -[NSLock lock](self->_connectedAccessoriesLock, "lock");
  id v8 =  -[NSMutableDictionary objectForKey:]( self->_connectedAccessories,  "objectForKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  if (v8)
  {
    BOOL v9 = v8;
    id v10 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5);
    [v9 setObject:v10 forKey:EAAccessorySpeakerMenuEQIndexKey];
  }

  -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  uint64_t v11 = sub_1000BD830();
  if (!v11 || (v11 & 7) != 0) {
LABEL_8:
  }
    __break(0x5516u);
  else {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v11 + 112LL))(v11, v5);
  }
}

- (void)updateLocationSupport:(unsigned int)a3 isReady:(BOOL)a4
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (BOOL v5 = a4,
        -[NSLock lock](self->_connectedAccessoriesLock, "lock"),
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    id v8 = -[NSMutableDictionary objectForKey:]( self->_connectedAccessories,  "objectForKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    if (v8
      && ((BOOL v9 = v8,
           uint64_t v10 = IAPAppAccessoryCapabilitiesKey,
           unint64_t v11 = (unint64_t)objc_msgSend( objc_msgSend(v8, "objectForKey:", IAPAppAccessoryCapabilitiesKey),  "unsignedIntValue") & 0xFFFFFFF7,  !v5)
        ? (int v12 = 0)
        : (int v12 = 8),
          objc_msgSend( v9,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v11 | v12),  v10),  v5))
    {
      id v13 = +[EAManager newPlistForAccessory:](&OBJC_CLASS___EAManager, "newPlistForAccessory:", v9);
      -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
      if (v13)
      {
        -[EAManager notifyEAClientsOfAccessoryReconnection:](self, "notifyEAClientsOfAccessoryReconnection:", v13);
      }
    }

    else
    {
      -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
    }
  }

- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6
{
}

- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6 updateApp:(BOOL)a7
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (BOOL v8 = a7,
        uint64_t v9 = *(void *)&a6,
        -[NSLock lock](self->_connectedAccessoriesLock, "lock"),
        char v14 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v9),  ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v15 = v14;
    id v16 = -[NSMutableDictionary objectForKey:](self->_connectedAccessories, "objectForKey:", v14);
    if (v16)
    {
      char v17 = v16;
      uint64_t v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%X", v9);
      id v19 = objc_msgSend( objc_msgSend(objc_msgSend(v17, "objectForKey:", IAPAppAccessoryPortsKey), "objectForKey:", v18),  "objectForKey:",  a4);
      if (v19)
      {
        [v19 setObject:a3 forKey:a5];
        if (v8) {
          -[EAManager notifyEAClientsOfAccessoryPortPropertyChanged:]( self,  "notifyEAClientsOfAccessoryPortPropertyChanged:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v15,  IAPAppConnectionIDKey,  v18,  IAPAppAccessoryUIDKey,  a4,  IAPAppAccessoryPortKey,  a5,  IAPAppAccessoryPortPropertyKey,  a3,  IAPAppAccessoryPortPropertyValueKey,  0LL));
        }
      }

      sub_1000CEA98(3u, @"EA accessory %@ port %@ portProperty %@ updated to %@", v18, a4, a5, a3);
    }

    -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  }

- (void)updateValueFromApp:(id)a3
{
  id v28 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v4 = [a3 objectForKey:IAPAppAccessoryPortKey];
  id v5 = [a3 objectForKey:IAPAppAccessoryPortPropertyKey];
  id v6 = [a3 objectForKey:IAPAppAccessoryPortPropertyValueKey];
  if (![v5 compare:kCFAccessoryPortPropertyCurrentSampleRate options:1])
  {
    uint64_t v13 = sub_100018224();
    if (v13)
    {
      if ((v13 & 7) == 0)
      {
        uint64_t v14 = sub_10001864C(v13);
        uint64_t v15 = sub_1000C06AC();
        if (v15)
        {
          if ((v15 & 7) == 0)
          {
            uint64_t v16 = sub_1000C06AC();
            if (v16 && (v16 & 7) == 0)
            {
              (*(void (**)(uint64_t, uint64_t, id))(*(void *)v16 + 88))( v16,  v14,  [v6 intValue]);
              goto LABEL_54;
            }
          }
        }
      }
    }

    goto LABEL_55;
  }

  if (![v5 compare:kCFAccessoryPortPropertyIsActive options:1])
  {
    if ([v4 compare:kCFAccessoryPortLineIn options:1])
    {
      if ([v4 compare:kCFAccessoryPortLineOut options:1]) {
        goto LABEL_54;
      }
      uint64_t v17 = sub_100019370();
      if (!v17 || (v17 & 7) != 0) {
        goto LABEL_55;
      }
      if (!*(void *)(v17 + 16)) {
        goto LABEL_54;
      }
      unsigned int v18 = [v6 intValue];
      uint64_t v19 = sub_1000C60C4();
      BOOL v21 = (v19 & 7) == 0 && v19 != 0;
      if (v18)
      {
        if (v21)
        {
          uint64_t v22 = *(void (**)(void))(*(void *)v19 + 200LL);
LABEL_53:
          v22();
          goto LABEL_54;
        }
      }

      else if (v21)
      {
        uint64_t v22 = *(void (**)(void))(*(void *)v19 + 208LL);
        goto LABEL_53;
      }
    }

    else
    {
      uint64_t v23 = sub_100019370();
      if (v23 && (v23 & 7) == 0)
      {
        if (!*(void *)(v23 + 16)) {
          goto LABEL_54;
        }
        unsigned int v24 = [v6 intValue];
        uint64_t v25 = sub_1000C60C4();
        BOOL v27 = (v25 & 7) == 0 && v25 != 0;
        if (v24)
        {
          if (v27)
          {
            uint64_t v22 = *(void (**)(void))(*(void *)v25 + 184LL);
            goto LABEL_53;
          }
        }

        else if (v27)
        {
          uint64_t v22 = *(void (**)(void))(*(void *)v25 + 192LL);
          goto LABEL_53;
        }
      }
    }

- (id)valueForProperty:(id)a3 forAccessory:(unsigned int)a4
{
  id v4 = (id *)((char *)self + 40);
  if ((((unint64_t)self + 40) & 7) != 0
    || (float v7 = (id *)self,
        [*((id *)self + 5) lock],
        self = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4),
        ((unint64_t)(v7 + 1) & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    id v8 = objc_msgSend(objc_msgSend(v7[1], "objectForKey:", self), "objectForKey:", a3);
    [*v4 unlock];
    return v8;
  }

  return self;
}

- (void)detachAccessory:(unsigned int)a3
{
  unsigned int v23 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = v5;
  -[NSLock lock](self->_connectedAccessoriesLock, "lock");
  float v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
  id v8 = v7;
  id v9 = -[NSMutableDictionary objectForKey:](self->_connectedAccessories, "objectForKey:", v7);
  -[NSLock unlock](self->_connectedAccessoriesLock, "unlock");
  if (v9)
  {
    -[EAManager _takeClientAssertionsForAccessoryDisconnection](self, "_takeClientAssertionsForAccessoryDisconnection");
    id v10 = +[EAManager newPlistForAccessory:](&OBJC_CLASS___EAManager, "newPlistForAccessory:", v9);
    -[EAManager notifyEAClientsOfAccessoryDisconnection:](self, "notifyEAClientsOfAccessoryDisconnection:", v10);
    sub_1000CEA98(3u, @"EA accessory with connectionID=%@ detached", v8);

    id v11 = objc_msgSend(objc_msgSend(v9, "objectForKey:", @"EAManagerAccessorySessions"), "sessions");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[EAManager closeSessionForConnectionID:sessionID:notifyApp:]( self,  "closeSessionForConnectionID:sessionID:notifyApp:",  [*(id *)(*((void *)&v19 + 1) + 8 * (void)i) connectionID],  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "sessionID"),  0);
        }

        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v13);
    }

    -[EAManager logAccessoryDetach:reason:](self, "logAccessoryDetach:reason:", v9, @"Accessory detached");
    -[NSMutableDictionary removeObjectForKey:](self->_connectedAccessories, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](self->_connectedAccessories, "count")) {
      +[IAPSession resetSessionIDCounter](&OBJC_CLASS___IAPSession, "resetSessionIDCounter");
    }
    uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t p_connectionIDMap = (uint64_t)&self->_connectionIDMap;
    if ((p_connectionIDMap & 7) == 0)
    {
      uint64_t v18 = sub_100008C50(p_connectionIDMap, &v23);
      uint64_t v17 = sub_100003154(&v18);
      if (v17)
      {
        if ((v17 & 7) == 0 && ((unint64_t)(v17 + 1) & 7) == 0)
        {

          sub_1000095C0((uint64_t *)p_connectionIDMap, v18);
          goto LABEL_18;
        }
      }
    }

- (void)reset
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v4 = v3;
  id v5 = -[NSMutableDictionary allKeys](self->_connectedAccessories, "allKeys");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[EAManager detachAccessory:]( self,  "detachAccessory:",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) unsignedIntValue]);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (id)accessoryForConnectionID:(id)a3
{
  return self;
}

- (id)sessionForAccessoryWithConnectionID:(unsigned int)a3 andSessionID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id result = -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:", *(void *)&a3);
  if (result) {
    return objc_msgSend( objc_msgSend( -[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", result),  "objectForKey:",  @"EAManagerAccessorySessions"),  "sessionWithSessionID:",  v4);
  }
  return result;
}

- (BOOL)openSessionForClientID:(unsigned int)a3 connetionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  __int128 v11 = (IAPSessionBasic *)sub_1000BE638();
  __int128 v11 = (IAPSessionBasic *)((uint64_t (*)(IAPSessionBasic *, uint64_t))v11->super.super.isa[12].isa)(v11, v8);
  int v13 = ((uint64_t (*)(IAPSessionBasic *))v11->super.super.isa[6].isa)(v11);
  id v14 = objc_msgSend( -[EAManager accessoryForConnectionID:]( self,  "accessoryForConnectionID:",  -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:", v8)),  "objectForKey:",  @"EAManagerAccessorySessions");
  if ((v13 & 0x1000000) != 0)
  {
    sub_1000CEA98(3u, @"Supports multiple sessions per protocol");
    id v24 = objc_msgSend(objc_msgSend(v14, "sessionsWithProtocolID:", v7), "objectEnumerator");
    while (1)
    {
      id v25 = [v24 nextObject];
      if (!v25) {
        goto LABEL_19;
      }
      id v26 = v25;
      if (objc_msgSend(objc_msgSend(v25, "client"), "clientID") == (_DWORD)v9)
      {
        sub_1000CEA98( 3u,  @"%s:%s found existing sessionID %d for protocol %d and client %@, not opening new one",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager openSessionForClientID:connetionID:protocolID:sessionID:]",  [v26 sessionID],  objc_msgSend(v26, "protocolID"),  objc_msgSend(objc_msgSend(v26, "client"), "bundleId"));
        goto LABEL_29;
      }
    }
  }

  sub_1000CEA98(3u, @"Doesn't support multiple sessions per protocol");
  __int128 v11 = (IAPSessionBasic *)[v14 sessionWithProtocolID:v7];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v15 = v11;
  __int128 v11 = (IAPSessionBasic *)-[NSMutableDictionary objectForKey:]( self->_clients,  "objectForKey:",  +[EAManager stringForClientID:]( &OBJC_CLASS___EAManager,  "stringForClientID:",  -[IAPEAClient clientID](-[IAPSession client](v11, "client"), "clientID")));
  if (v11)
  {
    uint64_t v16 = v11;
    __int128 v11 = (IAPSessionBasic *)-[IAPSessionBasic bundleId](v11, "bundleId");
    if (v11)
    {
      id v17 = -[IAPApplicationStateMonitor applicationInfoForBundleIDSync:]( self->_appStateMonitor,  "applicationInfoForBundleIDSync:",  [v16 bundleId]);
      unsigned int v18 = objc_msgSend(objc_msgSend(v17, "objectForKey:", BKSApplicationStateKey), "unsignedIntValue");
      LOBYTE(v11) = 0;
      if (v18 <= 4 && ((1 << v18) & 0x16) != 0)
      {
        unsigned int v19 = -[EAManager closeSessionForConnectionID:sessionID:notifyApp:]( self,  "closeSessionForConnectionID:sessionID:notifyApp:",  v8,  [v15 sessionID],  1);
        __int128 v20 = "not ";
        if (v19) {
          __int128 v20 = "";
        }
        sub_1000CEA98(3u, @"session already found, replacing it was %ssuccessful", v20);
        if (!v19)
        {
LABEL_29:
          LOBYTE(v11) = 0;
          return (char)v11;
        }

- (void)openCompleteForSessionWithConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:", *(void *)&a3);
  if ((((int)self + 40) & 7LL) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v7 = v6;
    -[NSLock lock](self->_connectedAccessoriesLock, "lock");
    id v9 =  objc_msgSend( objc_msgSend( -[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", v7),  "objectForKey:",  @"EAManagerAccessorySessions"),  "sessionWithSessionID:",  v4);
    -[NSLock unlock](self->_connectedAccessoriesLock, "unlock");
    uint64_t v8 = v9;
    if (!v9)
    {
      NSLog(@"unknown session acked by accessory");
      uint64_t v8 = 0LL;
    }
  }

- (BOOL)closeSessionForConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4 notifyApp:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = *(void *)&a3;
  xpc_object_t v9 = -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:");
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_12;
  }

  xpc_object_t v11 = v9;
  -[NSLock lock](self->_connectedAccessoriesLock, "lock");
  id v12 = -[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", v11);
  id v13 = [v12 objectForKey:@"EAManagerAccessorySessions"];
  id v14 = [v13 sessionWithSessionID:v6];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 closeDataPipes];
    [v13 removeSessionWithSessionID:v6];
  }

  else if (v12)
  {
    NSLog( @"ERROR - %s:%s - %d unable to find sessionID=0x%x for connectionID=0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager closeSessionForConnectionID:sessionID:notifyApp:]",  1342LL,  v6,  v7);
  }

  -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  if (!v5) {
    goto LABEL_10;
  }
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v9
    || (uint64_t v16 = v9,
        xpc_dictionary_set_string(v9, "requestType", "eaNotifyAppOfSessionClose"),
        xpc_dictionary_set_uint64(v16, "connectionID", [v15 connectionID]),
        xpc_dictionary_set_uint64(v16, "eaSessionID", v6),
        (xpc_object_t v9 = objc_msgSend(objc_msgSend(v15, "client"), "xpcConnection")) == 0))
  {
LABEL_12:
    __break(0x5510u);
    return (char)v9;
  }

  xpc_connection_send_message((xpc_connection_t)v9, v16);
  xpc_release(v16);
LABEL_10:
  [v15 shuttingDownSession];

  LOBYTE(v9) = v15 != 0LL;
  return (char)v9;
}

- (id)connectedAccessories
{
  id result = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (id v4 = result,
        id result = -[NSLock lock](self->_connectedAccessoriesLock, "lock"),
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    objc_msgSend(v4, "addObjectsFromArray:", -[NSMutableDictionary allValues](self->_connectedAccessories, "allValues"));
    -[NSLock unlock](self->_connectedAccessoriesLock, "unlock");
    return v4;
  }

  return result;
}

- (id)connectedAccessoriesForEAClient:(unsigned int)a3
{
  id v5 = -[EAManager connectedAccessories](self, "connectedAccessories");
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (uint64_t v8 = v6,
        -[NSLock lock](self->_clientLock, "lock"),
        __int128 v28 = 0u,
        __int128 v29 = 0u,
        __int128 v26 = 0u,
        __int128 v27 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id v10 = *p_clients;
  id v11 = [*p_clients countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_5:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = [*p_clients objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v14)];
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    id v15 = 0LL;
  }

  -[NSLock unlock](*p_clientLock, "unlock");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v16 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
      }

      id v17 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v17);
  }

  sub_1000CEA98(3u, @"returning mutableConnectedAccessories %@", v8);
  return v8;
}

- (void)fakedLocationDeviceNMEAAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:",  0LL);
  }

- (void)fakedLocationDevicePointDataAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:",  0LL);
  }

- (void)fakedLocationDeviceEphemerisURLAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:",  0LL);
  }

- (void)fakedLocationDeviceEphemerisMaxIntervalAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:",  0LL);
  }

- (void)fakedLocationDeviceEphemerisRefreshIntervalAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:",  0LL);
  }

- (void)fakedLocationRequestGPSTime
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:");
  }

  else if (self->_fakedLocationDeviceEnabled)
  {
    -[EAManager notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:]( self,  "notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:",  0LL);
  }

- (void)fakedLocationDeviceSetFilter:(id)a3
{
  id v4 = [a3 objectAtIndex:0];
  uint64_t v5 = sub_1000C3B18([v4 unsignedIntValue], 0);
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (!v5) {
    goto LABEL_13;
  }
  if ((v5 & 7) == 0)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 176LL))(v5))
    {
      uint64_t v6 = +[NSString string](&OBJC_CLASS___NSString, "string");
      if ((unint64_t)[a3 count] >= 2)
      {
        uint64_t v7 = 1LL;
        while (1)
        {
          uint64_t v8 = (char *)[a3 count];
          xpc_object_t v9 = v8 - 1;
          if (!v8) {
            break;
          }
          id v10 = [a3 objectAtIndex:v7];
          else {
            id v11 = -[NSString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"%@,", v10, v13);
          }
          uint64_t v6 = v11;
          BOOL v12 = __CFADD__((_DWORD)v7, 1);
          uint64_t v7 = (v7 + 1);
          if (v12) {
            goto LABEL_16;
          }
        }

        __break(0x5515u);
LABEL_16:
        __break(0x5500u);
        goto LABEL_17;
      }

- (void)fakedLocationDeviceFilteringSupport:(BOOL)a3
{
  unsigned int fakedLocationDeviceFilteringSupport = self->_fakedLocationDeviceFilteringSupport;
  if (fakedLocationDeviceFilteringSupport >= 2)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:]( self,  "notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:",  a3);
  }

  else if ((((fakedLocationDeviceFilteringSupport == 0) ^ a3) & 1) == 0)
  {
    self->_unsigned int fakedLocationDeviceFilteringSupport = a3;
    -[EAManager notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:]( self,  "notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:",  0LL);
  }

- (BOOL)isFakedLocationDeviceEnabled
{
  unsigned int fakedLocationDeviceEnabled = self->_fakedLocationDeviceEnabled;
  if (fakedLocationDeviceEnabled >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakedLocationDeviceEnabled != 0;
  }
  return (char)self;
}

- (void)setFakedLocationDeviceEnabled:(BOOL)a3 forClientID:(unsigned int)a4
{
  p_clientLock = &self->_clientLock;
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  -[NSLock lock](self->_clientLock, "lock");
  unsigned int fakedLocationDeviceEnabled = self->_fakedLocationDeviceEnabled;
  if (fakedLocationDeviceEnabled >= 2) {
    goto LABEL_29;
  }
  if ((fakedLocationDeviceEnabled == 0) != v6
    && +[IAPEAClient clientIDForLocationClient](&OBJC_CLASS___IAPEAClient, "clientIDForLocationClient") == (_DWORD)v5)
  {
    goto LABEL_25;
  }

  id v9 = -[NSMutableDictionary objectForKey:]( self->_clients,  "objectForKey:",  +[EAManager stringForClientID:](&OBJC_CLASS___EAManager, "stringForClientID:", v5));
  if (!v9)
  {
    NSLog( @"ERROR - %s:%s - %d client 0x%x isn't registered",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager setFakedLocationDeviceEnabled:forClientID:]",  1533LL,  v5);
    goto LABEL_25;
  }

  [v9 setLocationSupportedByClient:v6];
  self->_unsigned int fakedLocationDeviceEnabled = v6;
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (-[NSLock lock](self->_connectedAccessoriesLock, "lock"),
        __int128 v25 = 0u,
        __int128 v26 = 0u,
        __int128 v23 = 0u,
        __int128 v24 = 0u,
        p_connectedAccessories = (id *)&self->_connectedAccessories,
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
LABEL_28:
    __break(0x5516u);
LABEL_29:
    __break(0x550Au);
  }

  id v12 = *p_connectedAccessories;
  id v13 = [*p_connectedAccessories countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13) {
    goto LABEL_17;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v24;
  uint64_t v16 = IAPAppAccessoryCapabilitiesKey;
LABEL_11:
  uint64_t v17 = 0LL;
  while (1)
  {
    if (*(void *)v24 != v15) {
      objc_enumerationMutation(v12);
    }
    id v18 = [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v17)];
    if (v14 == (id)++v17)
    {
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v14)
      {
LABEL_17:
        -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
        goto LABEL_25;
      }

      goto LABEL_11;
    }
  }

  id v19 = objc_msgSend(objc_msgSend(v18, "objectForKey:", IAPAppConnectionIDKey), "unsignedIntValue");
  -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  if ((_DWORD)v19)
  {
    uint64_t v20 = sub_1000C3B18(v19, 0LL);
    if (v20)
    {
      uint64_t v21 = v20;
      if ((v20 & 7) == 0)
      {
        if ((*(unsigned int (**)(uint64_t))(*(void *)v20 + 128LL))(v20))
        {
          __int128 v22 = *(void (**)(uint64_t, uint64_t))(*(void *)v21 + 112LL);
          if (v6)
          {
            v22(v21, 3LL);
            (*(void (**)(uint64_t, uint64_t, void))(*(void *)v21 + 160LL))(v21, 1LL, 0LL);
          }

          else
          {
            v22(v21, 0LL);
            (*(void (**)(uint64_t, void, void))(*(void *)v21 + 160LL))(v21, 0LL, 0LL);
          }
        }

        goto LABEL_25;
      }

      goto LABEL_28;
    }
  }

- (void)applicationStateChanged:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateKey), "intValue");
  id v6 = [a3 objectForKey:BKSApplicationStateDisplayIDKey];
  id v7 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateProcessIDKey), "intValue");
  id v8 = v7;
  id v9 = @"running in the background";
  id v10 = @"running the foreground";
  id v11 = @"switching to other state";
  if ((_DWORD)v5 == 1) {
    id v11 = @"terminated";
  }
  if ((_DWORD)v5 != 8) {
    id v10 = v11;
  }
  if ((_DWORD)v5 != 4) {
    id v9 = v10;
  }
  unint64_t v12 = (unint64_t)v5;
  if ((_DWORD)v5 == 2) {
    id v13 = @"suspending";
  }
  else {
    id v13 = v9;
  }
  sub_1000CEA98(3u, @"process %@ (pid %d) is now %@", v6, v7, v13);
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (-[NSLock lock](self->_clientLock, "lock"),
        __int128 v77 = 0u,
        __int128 v78 = 0u,
        __int128 v75 = 0u,
        __int128 v76 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_70:
    __break(0x5516u);
  }

  id v15 = *p_clients;
  id v16 = [*p_clients countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v16)
  {
    id v17 = v16;
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    unint64_t v52 = (unint64_t)&self->_connectedAccessories & 7;
    uint64_t v18 = *(void *)v76;
    p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
    id v50 = v8;
    uint64_t v48 = *(void *)v76;
    id v49 = v15;
    unsigned int v51 = v12;
    id v47 = v6;
    do
    {
      id v19 = 0LL;
      id v53 = v17;
      do
      {
        if (*(void *)v76 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*p_clients objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * (void)v19)];
        if (objc_msgSend(v6, "caseInsensitiveCompare:", objc_msgSend(v20, "bundleId"))) {
          goto LABEL_23;
        }
        if ([v20 processID] != (_DWORD)v8)
        {
          sub_1000CEA98( 3u,  @"%s:%s-%d terminated app %@ pid %d does not match cached pid %d",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager applicationStateChanged:]",  1756,  v6,  v8,  [v20 processID]);
          goto LABEL_23;
        }

        [v20 setApplicationState:v12];
        if ((_DWORD)v12 == 2)
        {
LABEL_29:
          id v57 = v20;
          sub_1000CEA98(3u, @"closing sessions for process %@", v6);
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          if (v52) {
            goto LABEL_70;
          }
          id v54 = v19;
          id obj = *p_connectedAccessories;
          id v21 = [*p_connectedAccessories countByEnumeratingWithState:&v71 objects:v82 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v72;
            do
            {
              for (uint64_t i = 0LL; i != v22; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v72 != v23) {
                  objc_enumerationMutation(obj);
                }
                id v25 = objc_msgSend( objc_msgSend( objc_msgSend( *p_connectedAccessories,  "objectForKey:",  *(void *)(*((void *)&v71 + 1) + 8 * (void)i)),  "objectForKey:",  @"EAManagerAccessorySessions"),  "sessionsForClientID:",  objc_msgSend(v20, "clientID"));
                __int128 v67 = 0u;
                __int128 v68 = 0u;
                __int128 v69 = 0u;
                __int128 v70 = 0u;
                id v26 = [v25 countByEnumeratingWithState:&v67 objects:v81 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v68;
                  do
                  {
                    for (j = 0LL; j != v27; j = (char *)j + 1)
                    {
                      if (*(void *)v68 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      -[EAManager closeSessionForConnectionID:sessionID:notifyApp:]( self,  "closeSessionForConnectionID:sessionID:notifyApp:",  [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) connectionID],  objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)j), "sessionID"),  0);
                    }

                    id v27 = [v25 countByEnumeratingWithState:&v67 objects:v81 count:16];
                  }

                  while (v27);
                }

                id v20 = v57;
              }

              id v22 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
            }

            while (v22);
          }

          unint64_t v12 = v51;
          id v6 = v47;
          uint64_t v18 = v48;
          p_clients = (id *)&self->_clients;
          id v8 = v50;
          id v15 = v49;
          id v17 = v53;
          id v19 = v54;
          if (v51 == 1) {
            goto LABEL_23;
          }
          if (([v20 capabilities] & 0x10) == 0
            && ([v20 capabilities] & 0x20) != 0)
          {
            [v20 setClientRequiresAccReset:1];
          }

- (void)takeProcessAssertionForBundleID:(id)a3
{
  id v4 = -[IAPEAUnregisteredClient initWithBundleId:]( objc_alloc(&OBJC_CLASS___IAPEAUnregisteredClient),  "initWithBundleId:",  a3);
  if (v4)
  {
    id v6 = v4;
    -[IAPEAUnregisteredClient takeProcessAssertion:](v4, "takeProcessAssertion:", @"external-accessory.connect");
    id v5 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( objc_alloc(&OBJC_CLASS___NSTimer),  "initWithFireDate:interval:target:selector:userInfo:repeats:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0),  self,  "_unregisteredClientAssertionTimerFired:",  v6,  0LL,  0.0);
    -[NSRunLoop addTimer:forMode:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "addTimer:forMode:",  v5,  NSDefaultRunLoopMode);
  }

- (void)_dpServiceWithFirmwareVersionFound:(id)a3
{
  id v15 = objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer", a3), "dpFirmwareVersion");
  if (v15)
  {
    p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
    if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
      || (-[NSLock lock](self->_connectedAccessoriesLock, "lock"),
          __int128 v18 = 0u,
          __int128 v19 = 0u,
          __int128 v16 = 0u,
          __int128 v17 = 0u,
          p_connectedAccessories = (id *)&self->_connectedAccessories,
          ((unint64_t)&self->_connectedAccessories & 7) != 0))
    {
      __break(0x5516u);
    }

    id v5 = *p_connectedAccessories;
    id v6 = [*p_connectedAccessories countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      uint64_t v9 = IAPAppAccessoryFirmwareRevisionKey;
      uint64_t v10 = IAPAppAccessoryManufacturerKey;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)i)];
          id v13 = [v12 objectForKey:v9];
          if (!objc_msgSend(objc_msgSend(v12, "objectForKey:", v10), "compare:", @"Apple") {
            && [v13 rangeOfString:@" (") == (id)0x7FFFFFFFFFFFFFFFLL]
          }
          {
            [v12 setObject:objc_msgSend(v13, "stringByAppendingFormat:", @" (%@)", v15), v9 forKey];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }

    -[NSLock unlock](*p_connectedAccessoriesLock, "unlock");
  }

- (void)_takeClientAssertionsForAccessoryConnection
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (-[NSLock lock](self->_clientLock, "lock"),
        __int128 v13 = 0u,
        __int128 v14 = 0u,
        __int128 v11 = 0u,
        __int128 v12 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id obj = *p_clients;
  id v4 = [*p_clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        NSLog( @"%s:%s-%d client %@\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager _takeClientAssertionsForAccessoryConnection]",  1803,  objc_msgSend(objc_msgSend(*p_clients, "objectForKey:", v8), "bundleId"));
        objc_msgSend( objc_msgSend(*p_clients, "objectForKey:", v8),  "takeProcessAssertion:",  @"external-accessory.connect");
      }

      id v5 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  -[NSLock unlock](*p_clientLock, "unlock");
}

- (void)_takeClientAssertionsForAccessoryDisconnection
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (-[NSLock lock](self->_clientLock, "lock"),
        __int128 v13 = 0u,
        __int128 v14 = 0u,
        __int128 v11 = 0u,
        __int128 v12 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id v5 = *p_clients;
  id v6 = [*p_clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend( *p_clients,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)i),  (void)v11);
        [v10 takeProcessAssertion:@"external-accessory.disconnect"];
        [v10 setClientRequiresAccReset:0];
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[NSLock unlock](*p_clientLock, "unlock", (void)v11);
}

- (void)_unregisteredClientAssertionTimerFired:(id)a3
{
  id v3 = [a3 userInfo];
  [v3 releaseProcessAssertion];
  sub_1000CEA98( 3u,  @"%s::%s process assertion for unregistered client %@ should be released",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager _unregisteredClientAssertionTimerFired:]",  [v3 bundleId]);
}

- (BOOL)_isProtocolContainedInWhitelist:(id)a3
{
  if (![a3 caseInsensitiveCompare:@"com.apple.iPodOut"]) {
    return 1;
  }
  uint64_t v7 = 0LL;
  NSUInteger v4 = -[NSRegularExpression numberOfMatchesInString:options:range:]( +[NSRegularExpression regularExpressionWithPattern:options:error:]( NSRegularExpression,  "regularExpressionWithPattern:options:error:",  IAPEAWhitelistedProtocolRegex,  1,  &v7),  "numberOfMatchesInString:options:range:",  a3,  0,  0,  [a3 length]);
  BOOL v5 = v4 != 0;
  if (v4) {
    sub_1000CEA98( 3u,  @"%s:%s found whitelisted protocol %@",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm",  "-[EAManager _isProtocolContainedInWhitelist:]",  a3);
  }
  return v5;
}

- (void)updatePlistWithProtocolsForAccessory:(id)a3
{
}

+ (void)_updatePlistWithAccessoryProtocolsInternal:(id)a3
{
  if (a3)
  {
    CFPreferencesSetAppValue(@"OptionalSDKProtocolsShownKey", a3, @"com.apple.iapd");
    CFPreferencesSynchronize(@"com.apple.iapd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }

- (BOOL)fakedLocationDeviceFilteringSupport
{
  unsigned int fakedLocationDeviceFilteringSupport = self->_fakedLocationDeviceFilteringSupport;
  if (fakedLocationDeviceFilteringSupport >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakedLocationDeviceFilteringSupport != 0;
  }
  return (char)self;
}

- (void)setFakedLocationDeviceFilteringSupport:(BOOL)a3
{
  self->_unsigned int fakedLocationDeviceFilteringSupport = a3;
}

- (void).cxx_destruct
{
  uint64_t p_connectionIDMap = (uint64_t)&self->_connectionIDMap;
  if ((p_connectionIDMap & 7) != 0) {
    __break(0x5516u);
  }
  else {
    sub_100009E9C(p_connectionIDMap);
  }
}

- (id).cxx_construct
{
  id result = &self->_connectionIDMap;
  if ((result & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    sub_100009E64(result);
    return self;
  }

  return result;
}

- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5
{
  unsigned int v8 = [a3 canSendConnectionEventForAccessory:a5];
  sub_1000CEA98( 3u,  @"eaClientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d",  [a3 bundleId],  a4,  v8);
  if (v8)
  {
    uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a5,  200LL,  0LL,  0LL);
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (a4
      && (__int128 v11 = v10) != 0LL
      && (xpc_dictionary_set_string(v10, "requestType", a4), (id v12 = -[NSData bytes](v9, "bytes")) != 0LL)
      && (xpc_dictionary_set_data(v11, "EAProtocolAccessoryPlistData", v12, -[NSData length](v9, "length")),
          (__int128 v13 = (_xpc_connection_s *)[a3 xpcConnection]) != 0))
    {
      xpc_connection_send_message(v13, v11);
      xpc_release(v11);
    }

    else
    {
      __break(0x5510u);
    }
  }

- (void)notifyEAClient:(id)a3 ofNotificationName:(const char *)a4 withPayload:(id)a5
{
  if (a3 && a4)
  {
    unsigned int v8 = [a3 canSendConnectionEventForAccessory:a5];
    sub_1000CEA98( 3u,  @"eaClientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d",  [a3 bundleId],  a4,  v8);
    if (v8)
    {
      if (a5) {
        uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a5,  200LL,  0LL,  0LL);
      }
      else {
        uint64_t v9 = 0LL;
      }
      sub_1000CEA98( 3u,  @"eaClientToNotify bundle = %@, request = %s, notificationName = %s, notificationPayload=%@",  [a3 bundleId],  "kXPCACCNotificationKey",  a4,  a5);
      xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v10)
      {
        __int128 v11 = v10;
        xpc_dictionary_set_string(v10, "requestType", "kXPCACCNotificationKey");
        xpc_dictionary_set_string(v11, "kXPCACCNotificationNameKey", a4);
        if (!v9) {
          goto LABEL_13;
        }
        id v12 = -[NSData bytes](v9, "bytes");
        if (v12)
        {
          xpc_dictionary_set_data(v11, "kXPCACCNotificationPlistData", v12, -[NSData length](v9, "length"));
LABEL_13:
          __int128 v13 = (_xpc_connection_s *)[a3 xpcConnection];
          if (v13)
          {
            xpc_connection_send_message(v13, v11);
            xpc_release(v11);
            return;
          }
        }
      }

      __break(0x5510u);
    }
  }

  else
  {
    sub_1000CEA98( 3u,  @"%s: Received nil param. eaClientToNotify %@ notificationName %s",  "-[EAManager(EAManagerClientExtensions) notifyEAClient:ofNotificationName:withPayload:]",  a3,  a4);
  }

- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4
{
  if (!self
    || (p_clientLock = &self->_clientLock, ((unint64_t)&self->_clientLock & 7) != 0)
    || (-[NSLock lock](*p_clientLock, "lock"),
        __int128 v16 = 0u,
        __int128 v17 = 0u,
        __int128 v14 = 0u,
        __int128 v15 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id v9 = *p_clients;
  id v10 = [*p_clients countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[EAManager notifyEAClient:ofAccessoryEvent:accessory:]( self,  "notifyEAClient:ofAccessoryEvent:accessory:",  objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * (void)i), (void)v14),  a3,  a4);
      }

      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }

  -[NSLock unlock](*p_clientLock, "unlock", (void)v14);
}

- (void)sendToEALocationClientsNotification:(const char *)a3 withPayload:(id)a4
{
  if (!self
    || (p_clientLock = &self->_clientLock, ((unint64_t)&self->_clientLock & 7) != 0)
    || (-[NSLock lock](*p_clientLock, "lock"),
        __int128 v17 = 0u,
        __int128 v18 = 0u,
        __int128 v15 = 0u,
        __int128 v16 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }

  id v9 = *p_clients;
  id v10 = [*p_clients countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend( *p_clients,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)i),  (void)v15);
        if ([v14 locationSupportedByClient]) {
          -[EAManager notifyEAClient:ofNotificationName:withPayload:]( self,  "notifyEAClient:ofNotificationName:withPayload:",  v14,  a3,  a4);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  -[NSLock unlock](*p_clientLock, "unlock", (void)v15);
}

- (void)notifyEAClientsOfAccessoryConnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryReconnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryUpdated:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryPortPropertyChanged:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:(id)a3
{
}

@end