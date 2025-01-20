@interface OctagonAPSReceiver
+ (id)apsDeliveryQueue;
+ (id)receiverForNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
+ (id)resettableSynchronizedGlobalDelegatePortMap:(BOOL)a3;
+ (id)synchronizedGlobalDelegatePortMap;
+ (void)resetGlobalDelegatePortMap;
- (BOOL)haveStalePushes;
- (CKKSNearFutureScheduler)clearStalePushNotifications;
- (Class)apsConnectionClass;
- (NSMapTable)octagonContainerMap;
- (NSMutableDictionary)environmentMap;
- (NSMutableDictionary)zoneUpdateReceiverDictionary;
- (NSMutableSet)undeliveredCuttlefishUpdates;
- (NSMutableSet)undeliveredUpdates;
- (NSString)namedDelegatePort;
- (OctagonAPSConnection)apsConnection;
- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4 stalePushTimeout:(unint64_t)a5;
- (id)cuttlefishPushTopics;
- (id)registerCKKSReceiver:(id)a3 contextID:(id)a4;
- (id)registerCuttlefishReceiver:(id)a3 forContainerName:(id)a4 contextID:(id)a5;
- (id)registeredPushEnvironments;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)registerForEnvironment:(id)a3;
- (void)reportDroppedPushes:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setClearStalePushNotifications:(id)a3;
- (void)setEnvironmentMap:(id)a3;
- (void)setNamedDelegatePort:(id)a3;
- (void)setOctagonContainerMap:(id)a3;
- (void)setUndeliveredCuttlefishUpdates:(id)a3;
- (void)setUndeliveredUpdates:(id)a3;
- (void)setZoneUpdateReceiverDictionary:(id)a3;
@end

@implementation OctagonAPSReceiver

- (id)registeredPushEnvironments
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10016DEC4;
  v11 = sub_10016DED4;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver apsDeliveryQueue]( &OBJC_CLASS___OctagonAPSReceiver,  "apsDeliveryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10016DEDC;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)haveStalePushes
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver apsDeliveryQueue]( &OBJC_CLASS___OctagonAPSReceiver,  "apsDeliveryQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10016DE44;
  v5[3] = &unk_1002916D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (id)cuttlefishPushTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.security.cuttlefish"]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.TrustedPeersHelper"]);
  v6[0] = v2;
  v6[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  return -[OctagonAPSReceiver initWithNamedDelegatePort:apsConnectionClass:stalePushTimeout:]( self,  "initWithNamedDelegatePort:apsConnectionClass:stalePushTimeout:",  a3,  a4,  300000000000LL);
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4 stalePushTimeout:(unint64_t)a5
{
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___OctagonAPSReceiver;
  v10 = -[OctagonAPSReceiver init](&v33, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_apsConnectionClass, a4);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    undeliveredUpdates = v11->_undeliveredUpdates;
    v11->_undeliveredUpdates = (NSMutableSet *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    undeliveredCuttlefishUpdates = v11->_undeliveredCuttlefishUpdates;
    v11->_undeliveredCuttlefishUpdates = v14;

    objc_storeStrong((id *)&v11->_namedDelegatePort, a3);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    environmentMap = v11->_environmentMap;
    v11->_environmentMap = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    octagonContainerMap = v11->_octagonContainerMap;
    v11->_octagonContainerMap = (NSMapTable *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    zoneUpdateReceiverDictionary = v11->_zoneUpdateReceiverDictionary;
    v11->_zoneUpdateReceiverDictionary = (NSMutableDictionary *)v20;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    v29 = sub_10016DD20;
    v30 = &unk_100291A38;
    objc_copyWeak(&v31, &location);
    v22 = objc_retainBlock(&v27);
    v23 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v24 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v23,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"clearStalePushNotifications",  a5,  0LL,  0LL,  v22,  v27,  v28,  v29,  v30);
    clearStalePushNotifications = v11->_clearStalePushNotifications;
    v11->_clearStalePushNotifications = v24;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)registerForEnvironment:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver apsDeliveryQueue]( &OBJC_CLASS___OctagonAPSReceiver,  "apsDeliveryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016DBD8;
  block[3] = &unk_100290FC8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reportDroppedPushes:(id)a3
{
  id v3 = a3;
  CFTypeRef cf = 0LL;
  *(_DWORD *)buf = -1431655766;
  uint64_t v4 = sub_1000053C4(0, buf);
  BOOL v5 = sub_1000190E4(v4, &cf, @"aks_get_lock_state failed: %x", v4);
  uint8_t v6 = buf[0];
  CFTypeRef v7 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v7);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  else {
    id v8 = @"CKKS APNS Push Dropped - never unlocked";
  }
  __int128 v21 = 0uLL;
  __int128 v22 = 0uLL;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v14 ckksPushTracingEnabled])
        {
          id v15 = sub_1000AA6AC(@"apsnotification", 0LL);
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Submitting initial CKEventMetric due to notification %@",  buf,  0xCu);
          }

          v17 = -[SecEventMetric initWithEventName:]( objc_alloc(&OBJC_CLASS___SecEventMetric),  "initWithEventName:",  @"APNSPushMetrics");
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 ckksPushTracingUUID]);
          -[SecEventMetric setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"push_token_uuid");

          v19 = (void *)objc_claimAutoreleasedReturnValue([v14 ckksPushReceivedDate]);
          -[SecEventMetric setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v19,  @"push_received_date");

          -[SecEventMetric setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v8,  @"push_event_name");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SecMetrics managerObject](&OBJC_CLASS___SecMetrics, "managerObject"));
          [v20 submitEvent:v17];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }

    while (v11);
  }
}

- (id)registerCKKSReceiver:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver apsDeliveryQueue]( &OBJC_CLASS___OctagonAPSReceiver,  "apsDeliveryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016D934;
  block[3] = &unk_100291308;
  objc_copyWeak(&v20, &location);
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);

  v13 = v19;
  v14 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v14;
}

- (id)registerCuttlefishReceiver:(id)a3 forContainerName:(id)a4 contextID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver apsDeliveryQueue]( &OBJC_CLASS___OctagonAPSReceiver,  "apsDeliveryQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10016D78C;
  v20[3] = &unk_100290FF0;
  objc_copyWeak(&v25, &location);
  id v21 = v8;
  id v22 = v10;
  id v23 = v9;
  v13 = v11;
  __int128 v24 = v13;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, v20);

  id v17 = v24;
  id v18 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return v18;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a3;
  id v5 = sub_1000AA6AC(@"octagonpush", 0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "OctagonAPSDelegate initiated: %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_1000AA6AC(@"octagonpush", 0LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413058;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received per-topic push token %@ for topic %@ identifier %@ on connection %@",  (uint8_t *)&v15,  0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000AA6AC(@"octagonpush", 0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    *(_DWORD *)buf = 138412546;
    id v68 = v10;
    __int16 v69 = 2112;
    v70 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "OctagonAPSDelegate received a message(%@): %@ ",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"cf"]);
  BOOL v14 = v13 == 0LL;

  if (v14)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v35));

    if ([v16 notificationType] == (id)2)
    {
      id v17 = v16;
      objc_msgSend(v17, "setCkksPushTracingEnabled:", objc_msgSend(v7, "isTracingEnabled"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v7 tracingUUID]);
      if (v36)
      {
        v37 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v38 = objc_claimAutoreleasedReturnValue([v7 tracingUUID]);
        v39 = -[NSUUID initWithUUIDBytes:](v37, "initWithUUIDBytes:", [v38 bytes]);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v39, "UUIDString"));
        [v17 setCkksPushTracingUUID:v40];
      }

      else
      {
        [v17 setCkksPushTracingUUID:0];
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v17 setCkksPushReceivedDate:v42];

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v43 setDateProperty:v44 forKey:@"lastCKKSPush"];

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary"));
      objc_sync_enter(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary"));
      BOOL v47 = [v46 count] == 0;

      if (v47)
      {
        id v48 = sub_1000AA6AC(@"ckkspush", 0LL);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "received push for unregistered receiver: %@",  buf,  0xCu);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver undeliveredUpdates](self, "undeliveredUpdates"));
        [v50 addObject:v17];

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver clearStalePushNotifications](self, "clearStalePushNotifications"));
        [v51 trigger];
      }

      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary", 0LL));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectEnumerator]);

      id v54 = [v53 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v54)
      {
        uint64_t v55 = *(void *)v58;
        do
        {
          for (i = 0LL; i != v54; i = (char *)i + 1)
          {
            if (*(void *)v58 != v55) {
              objc_enumerationMutation(v53);
            }
            [*(id *)(*((void *)&v57 + 1) + 8 * (void)i) notifyZoneChange:v17];
          }

          id v54 = [v53 countByEnumeratingWithState:&v57 objects:v65 count:16];
        }

        while (v54);
      }

      objc_sync_exit(v45);
      id v16 = v17;
    }

    else
    {
      id v41 = sub_1000AA6AC(@"ckkspush", 0LL);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "unexpected notification: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"cf"]);

    id v17 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"c"]);
    id v18 = sub_1000AA6AC(@"octagonpush", 0LL);
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received a cuttlefish push to container %@",  buf,  0xCu);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v20 setDateProperty:v21 forKey:@"lastOctagonPush"];

    if (v17)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
      objc_sync_enter(v22);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
      BOOL v24 = [v23 count] == 0;

      if (v24)
      {
        id v25 = sub_1000AA6AC(@"octagonpush", 0LL);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "received cuttlefish push for unregistered container: %@",  buf,  0xCu);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver undeliveredCuttlefishUpdates](self, "undeliveredCuttlefishUpdates"));
        [v27 addObject:v17];

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver clearStalePushNotifications](self, "clearStalePushNotifications"));
        [v28 trigger];
      }

      objc_sync_exit(v22);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
    objc_sync_enter(v29);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectEnumerator]);

    id v32 = [v31 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v62;
      do
      {
        for (j = 0LL; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v62 != v33) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) notifyContainerChange:0];
        }

        id v32 = [v31 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }

      while (v32);
    }

    objc_sync_exit(v29);
  }
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 8LL, 1);
}

- (OctagonAPSConnection)apsConnection
{
  return (OctagonAPSConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (CKKSNearFutureScheduler)clearStalePushNotifications
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClearStalePushNotifications:(id)a3
{
}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
}

- (NSMutableDictionary)environmentMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEnvironmentMap:(id)a3
{
}

- (NSMutableSet)undeliveredUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setUndeliveredUpdates:(id)a3
{
}

- (NSMutableSet)undeliveredCuttlefishUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setUndeliveredCuttlefishUpdates:(id)a3
{
}

- (NSMutableDictionary)zoneUpdateReceiverDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setZoneUpdateReceiverDictionary:(id)a3
{
}

- (NSMapTable)octagonContainerMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOctagonContainerMap:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)receiverForNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(a1);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 synchronizedGlobalDelegatePortMap]);
  id v10 = (OctagonAPSReceiver *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  if (!v10)
  {
    id v10 = -[OctagonAPSReceiver initWithNamedDelegatePort:apsConnectionClass:]( objc_alloc(&OBJC_CLASS___OctagonAPSReceiver),  "initWithNamedDelegatePort:apsConnectionClass:",  v6,  a4);
    [v9 setObject:v10 forKeyedSubscript:v6];
  }

  objc_sync_exit(v8);
  return v10;
}

+ (void)resetGlobalDelegatePortMap
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = [obj resettableSynchronizedGlobalDelegatePortMap:1];
  objc_sync_exit(obj);
}

+ (id)synchronizedGlobalDelegatePortMap
{
  return [a1 resettableSynchronizedGlobalDelegatePortMap:0];
}

+ (id)resettableSynchronizedGlobalDelegatePortMap:(BOOL)a3
{
  id v3 = (void *)qword_1002DECD8;
  if (qword_1002DECD8) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)qword_1002DECD8;
    qword_1002DECD8 = (uint64_t)v5;

    id v3 = (void *)qword_1002DECD8;
  }

  return v3;
}

+ (id)apsDeliveryQueue
{
  if (qword_1002DECE8 != -1) {
    dispatch_once(&qword_1002DECE8, &stru_100290FA0);
  }
  return (id)qword_1002DECE0;
}

@end