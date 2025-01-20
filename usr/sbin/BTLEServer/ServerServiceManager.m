@interface ServerServiceManager
+ (id)instance;
+ (void)initialize;
- (BOOL)shouldPersist;
- (CBPeripheralManager)peripheralManager;
- (NSMapTable)serverServiceMap;
- (NSMutableArray)pendingUpdates;
- (OS_os_transaction)persistanceAssertion;
- (ServerServiceManager)init;
- (id)nameForCentral:(id)a3;
- (id)peripheralManagerStateString;
- (void)addService:(id)a3;
- (void)createServices;
- (void)destroyServices;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
- (void)refreshPersistanceAssertion;
- (void)removeService:(id)a3;
- (void)respondToRequest:(id)a3 withResult:(int64_t)a4;
- (void)setPendingUpdates:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setPersist:(BOOL)a3;
- (void)setPersistanceAssertion:(id)a3;
- (void)setServerServiceMap:(id)a3;
- (void)setShouldPersist:(BOOL)a3;
- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5;
@end

@implementation ServerServiceManager

+ (id)instance
{
  if (qword_100070C88 != -1) {
    dispatch_once(&qword_100070C88, &stru_10005D458);
  }
  return (id)qword_100070C80;
}

- (void)setPersist:(BOOL)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ServerServiceManager, a2) == a1)
  {
    v2 = (void *)qword_100070C78;
    qword_100070C78 = (uint64_t)&off_1000600B8;
  }

- (ServerServiceManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ServerServiceManager;
  v2 = -[ServerServiceManager init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___CBPeripheralManager);
    v14[0] = CBCentralManagerOptionReceiveSystemEvents;
    v14[1] = CBManagerNeedsRestrictedStateOperation;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    v5 = -[CBPeripheralManager initWithDelegate:queue:options:]( v3,  "initWithDelegate:queue:options:",  v2,  &_dispatch_main_q,  v4);
    peripheralManager = v2->_peripheralManager;
    v2->_peripheralManager = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    serverServiceMap = v2->_serverServiceMap;
    v2->_serverServiceMap = (NSMapTable *)v7;

    v2->_shouldPersist = 0;
    persistanceAssertion = v2->_persistanceAssertion;
    v2->_persistanceAssertion = 0LL;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingUpdates = v2->_pendingUpdates;
    v2->_pendingUpdates = v10;
  }

  return v2;
}

- (void)createServices
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = (id)qword_100070C78;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8LL * (void)v7));
        if (v8)
        {
          id v9 = objc_alloc_init(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap", (void)v12));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
          [v10 setObject:v9 forKey:v11];

          [v9 start];
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

- (void)destroyServices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_10005D498];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  [v4 removeAllObjects];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  [v5 removeAllObjects];
}

- (void)refreshPersistanceAssertion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  if ([v3 state] == (id)4)
  {

LABEL_6:
    -[ServerServiceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", 0LL);
    return;
  }

  unsigned int v4 = -[ServerServiceManager shouldPersist](self, "shouldPersist");

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager persistanceAssertion](self, "persistanceAssertion"));

  if (!v5)
  {
    uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(self, v6));
    id v9 = objc_claimAutoreleasedReturnValue(v7);
    v8 = (void *)os_transaction_create([v9 UTF8String]);
    -[ServerServiceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", v8);
  }

- (void)addService:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  [v5 addService:v4];
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  [v5 removeService:v4];
}

- (void)respondToRequest:(id)a3 withResult:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003BE84(v7, v6, a4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  [v8 respondToRequest:v6 withResult:a4];
}

- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003C000(v11, v9, (uint64_t)v8);
  }
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  if ([v12 count])
  {
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    unsigned __int8 v14 = [v13 updateValue:v8 forCharacteristic:v9 onSubscribedCentrals:v10];

    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[ATTUpdate updateWithValue:characteristic:centrals:]( &OBJC_CLASS___ATTUpdate,  "updateWithValue:characteristic:centrals:",  v8,  v9,  v10));
  [v15 addObject:v16];

  v17 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003BF74(v17, self);
  }
LABEL_8:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManagerStateString](self, "peripheralManagerStateString"));
    *(_DWORD *)buf = 138412290;
    __int128 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PeripheralManager state is now %@", buf, 0xCu);
  }

  -[ServerServiceManager refreshPersistanceAssertion](self, "refreshPersistanceAssertion");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002A9DC;
  v10[3] = &unk_10005D4C0;
  id v9 = v4;
  id v11 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v9 state] == (id)5) {
    -[ServerServiceManager createServices](self, "createServices");
  }
  else {
    -[ServerServiceManager destroyServices](self, "destroyServices");
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);

  if (v11) {
    [v11 peripheralManager:v12 didAddService:v8 error:v9];
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 characteristic]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v10]);

  if (v11)
  {
    id v12 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003C0B0(v12, v7, self);
    }
    [v11 peripheralManager:v6 didReceiveReadRequest:v7];
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    [v13 respondToRequest:v7 withResult:10];
  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 characteristic]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 service]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v11]);

  if (v12)
  {
    v26 = v12;
    id v27 = v7;
    id v28 = v6;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      v29 = self;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v17);
            v20 = v18;
            v30 = (void *)objc_claimAutoreleasedReturnValue([v19 central]);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v30));
            v22 = (void *)objc_claimAutoreleasedReturnValue([v19 characteristic]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUID]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
            *(_DWORD *)buf = 138412802;
            v36 = v21;
            __int16 v37 = 2112;
            v38 = v23;
            __int16 v39 = 2112;
            v40 = v24;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Central %@ sent a write request on characteristic %@: %@",  buf,  0x20u);

            self = v29;
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }

      while (v15);
    }

    id v12 = v26;
    id v6 = v28;
    [v26 peripheralManager:v28 didReceiveWriteRequests:v13];
    id v7 = v27;
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    [v25 respondToRequest:v8 withResult:10];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 service]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    id v14 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v9));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Central \"%@\" is now subscribed to characteristic \"%@\"",  (uint8_t *)&v18,  0x16u);
    }

    [v13 peripheralManager:v8 central:v9 didSubscribeToCharacteristic:v10];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 service]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    id v14 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v9));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Central \"%@\" is now unsubscribed from characteristic \"%@\"",  (uint8_t *)&v18,  0x16u);
    }

    [v13 peripheralManager:v8 central:v9 didUnsubscribeFromCharacteristic:v10];
  }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003C1A4(v5, self);
  }
  while (1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    id v7 = [v6 count];

    if (!v7) {
      break;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 characteristic]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 centrals]);
    unsigned __int8 v14 = [v10 updateValue:v11 forCharacteristic:v12 onSubscribedCentrals:v13];

    if ((v14 & 1) == 0)
    {

      break;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    [v15 removeObjectAtIndex:0];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002B334;
  v13[3] = &unk_10005D4E8;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
}

- (id)nameForCentral:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](&OBJC_CLASS___ConnectionManager, "instance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peripheralForIdentifier:v3]);

  if (v5) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 name]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)peripheralManagerStateString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  id v3 = (char *)[v2 state];

  else {
    return *(&off_10005D508 + (void)(v3 - 1));
  }
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (NSMapTable)serverServiceMap
{
  return self->_serverServiceMap;
}

- (void)setServerServiceMap:(id)a3
{
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
}

- (NSMutableArray)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end