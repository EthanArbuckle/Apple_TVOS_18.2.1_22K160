@interface ClientServiceManager
+ (void)initialize;
- (CBPeripheral)peripheral;
- (ClientServiceManager)initWithPeripheral:(id)a3;
- (NSMapTable)clientServiceMap;
- (NSMutableSet)startingClientServices;
- (id)clientServiceForUUID:(id)a3;
- (unint64_t)startPriority;
- (void)analyzeError:(id)a3;
- (void)clientService:(id)a3 desiresConnectionParameters:(id)a4;
- (void)clientServiceDidStart:(id)a3;
- (void)dealloc;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setClientServiceMap:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setStartPriority:(unint64_t)a3;
- (void)setStartingClientServices:(id)a3;
- (void)startClientServices;
@end

@implementation ClientServiceManager

- (ClientServiceManager)initWithPeripheral:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ClientServiceManager;
  v6 = -[ClientServiceManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peripheral, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    clientServiceMap = v7->_clientServiceMap;
    v7->_clientServiceMap = (NSMapTable *)v8;

    v7->_startPriority = 0LL;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    startingClientServices = v7->_startingClientServices;
    v7->_startingClientServices = v10;

    -[CBPeripheral discoverServices:](v7->_peripheral, "discoverServices:", 0LL);
  }

  return v7;
}

- (id)clientServiceForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_100020D2C;
  v16 = sub_100020D3C;
  id v17 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100020D44;
  v9[3] = &unk_10005D2C8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clientServiceDidStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
  [v5 removeObject:v4];

  -[ClientServiceManager startClientServices](self, "startClientServices");
}

- (void)clientService:(id)a3 desiresConnectionParameters:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](&OBJC_CLASS___BTLEXpcServer, "instance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
    [v7 sendSetConnectionParametersMsg:v5 forPeer:v6];
  }

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ClientServiceManager, a2) == a1)
  {
    v2 = (void *)qword_100070C70;
    qword_100070C70 = (uint64_t)&off_1000600A0;
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_10005D308];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ClientServiceManager;
  -[ClientServiceManager dealloc](&v4, "dealloc");
}

- (void)startClientServices
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
  id v4 = [v3 count];

  if (!v4)
  {
    while (1)
    {
      uint64_t v9 = 0LL;
      id v10 = &v9;
      uint64_t v11 = 0x2020000000LL;
      char v12 = 0;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10002108C;
      v8[3] = &unk_10005D2C8;
      v8[4] = self;
      v8[5] = &v9;
      [v5 enumerateKeysAndObjectsUsingBlock:v8];

      if (!*((_BYTE *)v10 + 24)) {
        break;
      }
      -[ClientServiceManager setStartPriority:]( self,  "setStartPriority:",  (char *)-[ClientServiceManager startPriority](self, "startPriority") + 1);
      _Block_object_dispose(&v9, 8);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
      id v7 = [v6 count];

      if (v7) {
        return;
      }
    }

    _Block_object_dispose(&v9, 8);
  }

- (void)analyzeError:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v5 = [v4 isEqualToString:CBATTErrorDomain];

  if (v5 && [v8 code] == (id)15)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
    [v6 postNotificationName:@"PeripheralPairingDidFailNotification" object:v7];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v27 = a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v30;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v26 = v7;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v10);
        char v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap", v26));
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        if (v13)
        {
          uint64_t v14 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
            *(_DWORD *)buf = v26;
            v34 = v16;
            __int16 v35 = 2112;
            v36 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Peripheral \"%@\" invalidated service \"%@\"",  buf,  0x16u);
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
          unsigned int v20 = [v18 isEqual:v19];

          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            [v21 enumerateKeysAndObjectsUsingBlock:&stru_10005D328];

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
            [v22 removeAllObjects];

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            [v23 removeAllObjects];
          }

          else
          {
            [v13 stop];
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
            [v24 removeObject:v13];

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            [v23 removeObjectForKey:v11];
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v8);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
  [v25 discoverServices:0];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v43 = a3;
  id v37 = a4;
  id v6 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v43 name]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v43 services]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "didDiscoverServices for %@, %@...",  buf,  0x16u);
  }

  if (v37)
  {
    id v10 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003AE28(v10, v43, (uint64_t)v37);
    }
    -[ClientServiceManager analyzeError:](self, "analyzeError:", v37);
    goto LABEL_38;
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v43 services]);
  id v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (!v40) {
    goto LABEL_32;
  }
  uint64_t v39 = *(void *)v50;
  uint64_t v42 = CBUUIDHeartRateServiceString;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v50 != v39)
      {
        uint64_t v12 = v11;
        objc_enumerationMutation(obj);
        uint64_t v11 = v12;
      }

      uint64_t v41 = v11;
      objc_super v13 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);
      BOOL v16 = v15 == 0LL;

      if (v16)
      {
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v17 = (id)qword_100070C70;
        id v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (!v18) {
          goto LABEL_29;
        }
        uint64_t v19 = *(void *)v46;
        while (1)
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v17);
            }
            Class v21 = NSClassFromString(*(NSString **)(*((void *)&v45 + 1) + 8LL * (void)i));
            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class UUID](v21, "UUID"));
              unsigned int v24 = [v22 isEqual:v23];

              if (v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v42));
                if ([v25 isEqual:v26])
                {
                  unsigned __int8 v27 = [v43 hasTag:@"FitnessClassic"];

                  if ((v27 & 1) != 0) {
                    continue;
                  }
                }

                else
                {
                }

                id v28 = [[v21 alloc] initWithManager:self peripheral:v43 service:v13];
                __int128 v29 = (void *)qword_100070CC8;
                if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v30 = v29;
                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v43 name]);
                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v31;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v32;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Peripheral \"%@\" supports service \"%{public}@\"",  buf,  0x16u);
                }

                v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
                [v33 setObject:v28 forKey:v13];
              }
            }
          }

          id v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (!v18)
          {
LABEL_29:

            break;
          }
        }
      }

      uint64_t v11 = v41 + 1;
    }

    while ((id)(v41 + 1) != v40);
    id v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  }

  while (v40);
LABEL_32:

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v56 = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100021B48;
  v44[3] = &unk_10005D350;
  v44[4] = buf;
  [v34 enumerateKeysAndObjectsUsingBlock:v44];

  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    -[ClientServiceManager setStartPriority:](self, "setStartPriority:", 0LL);
    -[ClientServiceManager startClientServices](self, "startClientServices");
  }

  else
  {
    __int16 v35 = (os_log_s *)(id)qword_100070CC8;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v43 name]);
      *(_DWORD *)v53 = 138412290;
      v54 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Didn't find any primary service on peripheral \"%@\"",  v53,  0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_38:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

  if (v12)
  {
    if (v10)
    {
      objc_super v13 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v17 = 138412802;
        id v18 = v15;
        __int16 v19 = 2112;
        unsigned int v20 = v16;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error discovering characteristics for service %@ on peripheral %@: %@",  (uint8_t *)&v17,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v12, "peripheral:didDiscoverCharacteristicsForService:error:") & 1) != 0) {
      [v12 peripheral:v8 didDiscoverCharacteristicsForService:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error updating value for characteristic %@ on peripheral %@: %@",  (uint8_t *)&v18,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v13, "peripheral:didUpdateValueForCharacteristic:error:") & 1) != 0) {
      [v13 peripheral:v8 didUpdateValueForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error writing value for characteristic %@ on peripheral %@: %@",  (uint8_t *)&v18,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v13, "peripheral:didWriteValueForCharacteristic:error:") & 1) != 0) {
      [v13 peripheral:v8 didWriteValueForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error updating notifications for characteristic %@ on peripheral %@: %@",  (uint8_t *)&v18,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v13, "peripheral:didUpdateNotificationStateForCharacteristic:error:") & 1) != 0) {
      [v13 peripheral:v8 didUpdateNotificationStateForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error discovering descriptors for characteristic %@ on peripheral %@: %@",  (uint8_t *)&v18,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v13, "peripheral:didDiscoverDescriptorsForCharacteristic:error:") & 1) != 0) {
      [v13 peripheral:v8 didDiscoverDescriptorsForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 characteristic]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v13]);

  if (v14)
  {
    if (v10)
    {
      v15 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = v15;
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        int v19 = 138412802;
        __int16 v20 = v17;
        __int16 v21 = 2112;
        __int16 v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Error updating value for descriptor %@ on peripheral %@: %@",  (uint8_t *)&v19,  0x20u);
      }

      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }

    if ((objc_opt_respondsToSelector(v14, "peripheral:didUpdateValueForDescriptor:error:") & 1) != 0) {
      [v14 peripheral:v8 didUpdateValueForDescriptor:v9 error:v10];
    }
  }
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (NSMapTable)clientServiceMap
{
  return self->_clientServiceMap;
}

- (void)setClientServiceMap:(id)a3
{
}

- (unint64_t)startPriority
{
  return self->_startPriority;
}

- (void)setStartPriority:(unint64_t)a3
{
  self->_startPriority = a3;
}

- (NSMutableSet)startingClientServices
{
  return self->_startingClientServices;
}

- (void)setStartingClientServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end