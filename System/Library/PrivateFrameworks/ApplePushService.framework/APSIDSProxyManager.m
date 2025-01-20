@interface APSIDSProxyManager
+ (BOOL)shouldAssertWiFi;
+ (id)_idsSendQueue;
- (APSIDSProxyManager)init;
- (APSIDSProxyManagerDelegate)delegate;
- (BOOL)canUseProxy;
- (BOOL)isNearby;
- (NSMutableArray)deviceNotFoundMessageQueue;
- (NSString)recentDaemonAliveGuid;
- (PCPersistentTimer)deviceNotFoundTimer;
- (id)_recipientDevice;
- (void)__assertWiFiIfPossible;
- (void)_assertWiFiIfPossible;
- (void)_checkNearbyDevices:(id)a3;
- (void)_deviceNotFoundTimerFired;
- (void)_flushDeviceNotFoundMessageQueue;
- (void)_onQueue_checkNearbyDevices:(id)a3;
- (void)_retrieveAllDevicesAndDo:(id)a3;
- (void)_scheduleDeviceNotFoundTimer;
- (void)_sendDaemonAliveMessage;
- (void)dealloc;
- (void)removeAllPendingAPSMessages;
- (void)removeListener:(id)a3 environment:(id)a4;
- (void)sendAppTokenGenerateResponse:(id)a3 error:(id)a4 guid:(id)a5 environmentName:(id)a6;
- (void)sendExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4 guid:(id)a5 environmentName:(id)a6;
- (void)sendFilterWithEnvironmentName:(id)a3 guid:(id)a4 enabledTopics:(id)a5 ignoredTopics:(id)a6 opportunisticTopics:(id)a7 nonWakingTopics:(id)a8 topicSalts:(id)a9;
- (void)sendInactiveWithEnvironmentName:(id)a3 guid:(id)a4;
- (void)sendLargeMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessage:(id)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessageTracingStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6 guid:(id)a7 environmentName:(id)a8;
- (void)sendPresenceWithEnvironmentName:(id)a3 guid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12;
- (void)sendProxyIsConnected:(BOOL)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendProxyMessage:(id)a3;
- (void)sendProxyMessage:(id)a3 forAPSMessage:(id)a4;
- (void)sendPubSubChannelList:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6 environmentName:(id)a7 guid:(id)a8;
- (void)sendPubSubChannelListRequest:(int64_t)a3 environmentName:(id)a4 guid:(id)a5;
- (void)sendPubSubChannelListResponse:(id)a3 environmentName:(id)a4 guid:(id)a5;
- (void)sendPubSubUpdateMessage:(id)a3 connectionType:(int64_t)a4 environmentName:(id)a5 guid:(id)a6;
- (void)sendPushToken:(id)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendReceivedPush:(id)a3 forConnectionType:(int64_t)a4 generation:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7;
- (void)sendResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 connectionType:(int64_t)a6 generation:(unint64_t)a7 guid:(id)a8 environmentName:(id)a9;
- (void)sendReversePushResponse:(int64_t)a3 messageGUID:(id)a4 messageId:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 guid:(id)a9 environmentName:(id)a10;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceNotFoundMessageQueue:(id)a3;
- (void)setDeviceNotFoundTimer:(id)a3;
- (void)setListener:(id)a3 environment:(id)a4;
- (void)setRecentDaemonAliveGuid:(id)a3;
@end

@implementation APSIDSProxyManager

+ (id)_idsSendQueue
{
  if (qword_10014E8E8 != -1) {
    dispatch_once(&qword_10014E8E8, &stru_10011FC60);
  }
  return (id)qword_10014E8E0;
}

- (APSIDSProxyManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___APSIDSProxyManager;
  v2 = -[APSIDSProxyManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = CUTWeakLinkClass(@"IDSService", @"IDS");
    -[APSIDSProxyManager _assertWiFiIfPossible](v2, "_assertWiFiIfPossible");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    deviceNotFoundMessageQueue = v2->_deviceNotFoundMessageQueue;
    v2->_deviceNotFoundMessageQueue = (NSMutableArray *)v4;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000794AC;
    v9[3] = &unk_10011FC88;
    uint64_t v11 = v3;
    v10 = v2;
    dispatch_async(v7, v9);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSIDSProxyManager;
  -[APSIDSProxyManager dealloc](&v3, "dealloc");
}

- (BOOL)canUseProxy
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL nearby = self->_nearby;
    int v6 = 138412802;
    if (nearby) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    v7 = self;
    __int16 v8 = 2112;
    v9 = @"NO";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ canUseProxy: %@ isNearby: %@",  (uint8_t *)&v6,  0x20u);
  }

  return 0;
}

- (void)setListener:(id)a3 environment:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  environmentToListener = self->_environmentToListener;
  if (!environmentToListener)
  {
    __int16 v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToWeakObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToWeakObjectsMapTable"));
    v9 = self->_environmentToListener;
    self->_environmentToListener = v8;

    environmentToListener = self->_environmentToListener;
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  -[NSMapTable setObject:forKey:](environmentToListener, "setObject:forKey:", v11, v10);
}

- (void)removeListener:(id)a3 environment:(id)a4
{
  id v13 = a4;
  environmentToListener = self->_environmentToListener;
  id v7 = a3;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](environmentToListener, "objectForKey:", v8));

  if (v9 == v7)
  {
    __int16 v10 = self->_environmentToListener;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
    -[NSMapTable removeObjectForKey:](v10, "removeObjectForKey:", v11);

    if (!-[NSMapTable count](self->_environmentToListener, "count"))
    {
      objc_super v12 = self->_environmentToListener;
      self->_environmentToListener = 0LL;
    }
  }
}

- (id)_recipientDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[APSIDSService linkedDevicesWithRelationship:]( self->_idsService,  "linkedDevicesWithRelationship:",  3LL));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = v2;
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
        if (objc_msgSend(v7, "isActive", (void)v9))
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

- (void)sendProxyMessage:(id)a3
{
}

- (void)sendProxyMessage:(id)a3 forAPSMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = APSEncodeDictionary(v6);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v10)
  {
    id v11 = objc_msgSend((id)objc_opt_class(self, v9), "_idsSendQueue");
    __int128 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100079AB4;
    v13[3] = &unk_10011F668;
    v13[4] = self;
    id v14 = v6;
    id v15 = v10;
    id v16 = v7;
    dispatch_async(v12, v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ got nil data when encoding message %@",  buf,  0x16u);
  }
}

- (void)_scheduleDeviceNotFoundTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundTimer](self, "deviceNotFoundTimer"));

  if (!v3)
  {
    id v4 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCPersistentTimer),  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  @"APSIDSProxyManager",  self,  "_deviceNotFoundTimerFired",  0LL,  120.0);
    -[APSIDSProxyManager setDeviceNotFoundTimer:](self, "setDeviceNotFoundTimer:", v4);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundTimer](self, "deviceNotFoundTimer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v5 scheduleInRunLoop:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ scheduling timer to clean device not found queue.",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)_deviceNotFoundTimerFired
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundTimer](self, "deviceNotFoundTimer"));
  [v3 invalidate];

  -[APSIDSProxyManager setDeviceNotFoundTimer:](self, "setDeviceNotFoundTimer:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
  id v5 = [v4 count];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000BF908((uint64_t)self);
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
    [v6 removeAllObjects];
  }

- (void)_flushDeviceNotFoundMessageQueue
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
  objc_sync_enter(obj);
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
    *(_DWORD *)buf = 134217984;
    id v20 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%lu messages to redeliver.",  buf,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
  id v6 = [v5 copy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSIDSProxyManager deviceNotFoundMessageQueue](self, "deviceNotFoundMessageQueue"));
  [v7 removeAllObjects];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        __int128 v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resending pending proxy message %@",  buf,  0xCu);
        }

        -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v12);
      }

      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  objc_sync_exit(obj);
}

- (void)_sendDaemonAliveMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sending daemonAliveMessage - we need fresh presences",  buf,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B4E8,  @"c",  0LL));
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v3);
}

- (void)sendPushToken:(id)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send push token %@ with environment %@ and guid %@",  buf,  0x2Au);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B500,  @"c",  v9,  @"pG",  v10,  @"e",  v8,  @"t",  0LL));
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)sendMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send message size %lu with environment %@ and guid %@",  buf,  0x2Au);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B518,  @"c",  v8,  @"pG",  v9,  @"e",  v10,  @"mS",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)sendLargeMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send large message size %lu with environment %@ and guid %@",  buf,  0x2Au);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B518,  @"c",  v8,  @"pG",  v9,  @"e",  v10,  @"lS",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)sendReceivedPush:(id)a3 forConnectionType:(int64_t)a4 generation:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send received push %@ with environment %@ and guid %@",  buf,  0x2Au);
  }

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B530,  @"c",  v13,  @"pG",  v14,  @"e",  v12,  @"p",  v15,  @"i",  v16,  @"g",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v17);
}

- (void)sendPresenceWithEnvironmentName:(id)a3 guid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v29 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v28 = a12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v31 = self;
    __int16 v32 = 2112;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v18;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send presence with environment %@ guid %@ hwVersion %@ token %@",  buf,  0x34u);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B548,  @"c",  v18,  @"pG",  v22,  @"ce",  v23,  @"no",  v24,  @"si",  v17,  @"e",  0LL));
  v26 = v25;
  if (v20) {
    [v25 setObject:v20 forKey:@"hw"];
  }
  if (v21 && v29)
  {
    [v26 setObject:v21 forKey:@"sv"];
    [v26 setObject:v29 forKey:@"sb"];
  }

  if (v19) {
    [v26 setObject:v19 forKey:@"t"];
  }
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v26);
}

- (void)sendFilterWithEnvironmentName:(id)a3 guid:(id)a4 enabledTopics:(id)a5 ignoredTopics:(id)a6 opportunisticTopics:(id)a7 nonWakingTopics:(id)a8 topicSalts:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send filter with environment %@ guid %@",  buf,  0x20u);
    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if (v17)
  {
    goto LABEL_3;
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  if (v18)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
LABEL_12:
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }

- (void)sendPubSubChannelList:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6 environmentName:(id)a7 guid:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send pubsub channel list",  buf,  0xCu);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B578,  @"c",  v14,  @"cl",  v18,  @"mI",  v15,  @"t",  v19,  @"i",  v16,  @"e",  v17,  @"pG",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v20);
}

- (void)sendPubSubChannelListResponse:(id)a3 environmentName:(id)a4 guid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send pubsub channel list resposne",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B590,  @"c",  v8,  @"p",  v9,  @"e",  v10,  @"pG",  0LL));
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)sendPubSubUpdateMessage:(id)a3 connectionType:(int64_t)a4 environmentName:(id)a5 guid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send pubsub update message",  buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B5A8,  @"c",  v10,  @"p",  v13,  @"i",  v11,  @"e",  v12,  @"pG",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v14);
}

- (void)sendPubSubChannelListRequest:(int64_t)a3 environmentName:(id)a4 guid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send pubsub channel request message",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B5C0,  @"c",  v10,  @"i",  v8,  @"e",  v9,  @"pG",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)sendInactiveWithEnvironmentName:(id)a3 guid:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B5D8,  @"c",  a4,  @"pG",  a3,  @"e",  0LL));
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v5);
}

- (void)sendResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 connectionType:(int64_t)a6 generation:(unint64_t)a7 guid:(id)a8 environmentName:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a7));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B5F0,  @"c",  v16,  @"pG",  v15,  @"e",  v19,  @"r",  v20,  @"i",  v21,  @"g",  v17,  @"t",  v18,  @"mI",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v23);
}

- (void)sendMessageTracingStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6 guid:(id)a7 environmentName:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B608,  @"c",  v15,  @"pG",  v14,  @"e",  v19,  @"r",  v17,  @"u",  v16,  @"t",  v18,  @"tS",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v20);
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 guid:(id)a9 environmentName:(id)a10
{
  uint64_t v12 = *(void *)&a6;
  int v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v16;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 1024;
    int v32 = v13;
    __int16 v33 = 1024;
    int v34 = v12;
    __int16 v35 = 2112;
    id v36 = v18;
    __int16 v37 = 2048;
    int64_t v38 = a8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send filter with topic hash %@ base token %@ appId %hu expiration %u vapidHash %@ type %lu",  buf,  0x40u);
  }

  if ((unint64_t)[v16 length] >= 0x14)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a8));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B620,  @"c",  v19,  @"pG",  v20,  @"e",  v16,  @"tH",  v17,  @"t",  v21,  @"tT",  0LL));

    if (v18) {
      [v22 setObject:v18 forKeyedSubscript:@"vPK"];
    }
    if ((_DWORD)v12)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
      [v22 setObject:v23 forKeyedSubscript:@"eTTL"];
    }

    if (v13)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:"));
      [v22 setObject:v24 forKeyedSubscript:@"a"];
    }

    -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v22);
  }
}

- (void)sendMessage:(id)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B638,  @"c",  v9,  @"pG",  v8,  @"e",  v11,  @"rP",  0LL));

  -[APSIDSProxyManager sendProxyMessage:forAPSMessage:](self, "sendProxyMessage:forAPSMessage:", v12, v10);
}

- (void)sendReversePushResponse:(int64_t)a3 messageGUID:(id)a4 messageId:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10012B650,  @"c",  v13,  @"pG",  v12,  @"e",  v15,  @"r",  v16,  @"mI",  v14,  @"mG",  0LL));

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v17);
}

- (void)sendExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4 guid:(id)a5 environmentName:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", &off_10012B668, @"c");
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, @"pG");

  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, @"e");
  if (v14) {
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v14, @"st");
  }
  if (v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, @"rT");
  }

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v12);
}

- (void)sendAppTokenGenerateResponse:(id)a3 error:(id)a4 guid:(id)a5 environmentName:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", &off_10012B680, @"c");
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, @"pG");

  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v11, @"e");
  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 code]));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, @"er");
  }

  if (v15) {
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, @"r");
  }
  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v13);
}

- (void)sendProxyIsConnected:(BOOL)a3 guid:(id)a4 environmentName:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", &off_10012B698, @"c");
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v9, @"pG");

  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v8, @"e");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, @"cS");

  -[APSIDSProxyManager sendProxyMessage:](self, "sendProxyMessage:", v11);
}

- (void)removeAllPendingAPSMessages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    apsOutgoingMessageMap = self->_apsOutgoingMessageMap;
    int v5 = 138412546;
    BOOL v6 = self;
    __int16 v7 = 2112;
    id v8 = apsOutgoingMessageMap;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ removed all pending messages in APSOutgoingMessageMap %@",  (uint8_t *)&v5,  0x16u);
  }

  id v4 = self->_apsOutgoingMessageMap;
  self->_apsOutgoingMessageMap = 0LL;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v23 = self;
    if (v8) {
      id v16 = @"YES";
    }
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    __int16 v27 = v16;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ identifier %@ didSendWithSuccess %@ error %@",  buf,  0x2Au);
  }

  if (!v8 && self->_nearby && -[NSString isEqualToString:](self->_recentDaemonAliveGuid, "isEqualToString:", v14))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ previous daemonAlive failed, resending one now",  buf,  0xCu);
    }

    -[APSIDSProxyManager _sendDaemonAliveMessage](self, "_sendDaemonAliveMessage");
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_apsOutgoingMessageMap, "objectForKey:", v14));
  id v18 = v17;
  if (v17)
  {
    if (!v8)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 originator]);
      uint64_t v20 = APSError(4LL, @"IDS message sent failed with error %@");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v19, "handleResult:forSendingOutgoingMessageWithID:", v21, objc_msgSend(v18, "messageID", v15));
    }

    -[NSMutableDictionary removeObjectForKey:](self->_apsOutgoingMessageMap, "removeObjectForKey:", v14);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v93 = a3;
  id v94 = a4;
  id v12 = a5;
  id v98 = a6;
  id v96 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v105 = self;
    __int16 v106 = 2112;
    id v107 = v12;
    __int16 v108 = 2112;
    id v109 = v98;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ incomingData %@ fromID %@",  buf,  0x20u);
  }

  v95 = v12;
  uint64_t v13 = APSDecodeDictionary(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000BF984((uint64_t)self);
    }

    id v14 = 0LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v105 = self;
    __int16 v106 = 2112;
    id v107 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received dictionary %@",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"c"]);
  id v18 = [v17 integerValue];

  v97 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"pG"]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"e"]);
  uint64_t v20 = (void *)v19;
  switch((unint64_t)v18)
  {
    case 1uLL:
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"ce"]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"no"]);
      v92 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"si"]);
      v91 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"hw"]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"sv"]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"sb"]);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412546;
        v105 = self;
        __int16 v106 = 2112;
        id v107 = WeakRetained;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sending presence request to delegate %@",  buf,  0x16u);
      }

      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      [v27 proxyManager:self incomingPresenceWithGuid:v97 token:v91 hwVersion:v23 swVersion:v24 swBuild:v25 certificate:v21 nonce:v22 signature:v92 environmentName:v20];

      goto LABEL_149;
    case 2uLL:
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
      if (v20) {
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        id v29 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v29, "proxyManager:incomingPushToken:guid:environmentName:") & 1) != 0) {
        [v29 proxyManager:self incomingPushToken:v28 guid:v97 environmentName:v20];
      }
      goto LABEL_143;
    case 3uLL:
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      id v30 = self->_environmentToListener;
      id v31 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v99,  v103,  16LL);
      if (v31)
      {
        uint64_t v32 = *(void *)v100;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v100 != v32) {
              objc_enumerationMutation(v30);
            }
            int v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_environmentToListener,  "objectForKey:",  *(void *)(*((void *)&v99 + 1) + 8LL * (void)i)));
            if ((objc_opt_respondsToSelector(v34, "proxyManagerReceivedDaemonAliveNotification:") & 1) != 0) {
              [v34 proxyManagerReceivedDaemonAliveNotification:self];
            }
          }

          id v31 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v99,  v103,  16LL);
        }

        while (v31);
      }

      goto LABEL_149;
    case 4uLL:
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"eT"]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"iT"]);
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"oT"]);
      int64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"nT"]);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"tSal"]);
      if (v20) {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v40 = 0LL;
      }
      if ((objc_opt_respondsToSelector( v40,  "proxyManager:incomingFilterForGuid:environmentName:enabledTopics:ignoredTopics:opportunisticTopics:nonWaki ngTopics:topicSalts:") & 1) != 0) {
        [v40 proxyManager:self incomingFilterForGuid:v97 environmentName:v20 enabledTopics:v35 ignoredTopics:v36 opportunisticTopics:v37 nonWakingTo pics:v38 topicSalts:v39];
      }

      goto LABEL_149;
    case 5uLL:
      if (v19) {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v19));
      }
      else {
        v41 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v41, "proxyManager:inactiveReceivedForGuid:environmentName:") & 1) != 0) {
        [v41 proxyManager:self inactiveReceivedForGuid:v97 environmentName:v20];
      }
      goto LABEL_148;
    case 6uLL:
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"p"]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"i"]);
      if (sub_100005B98((unint64_t)[v29 integerValue]))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"g"]);
        if (v20) {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
        }
        else {
          v43 = 0LL;
        }
        if ((objc_opt_respondsToSelector( v43,  "proxyManager:receivedPush:connectionType:generation:guid:environmentName:") & 1) != 0) {
          [v43 proxyManager:self receivedPush:v28 connectionType:v29 generation:v42 guid:v97 environmentName:v20];
        }

        goto LABEL_143;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_143;
      }
      goto LABEL_71;
    case 7uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"r"]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"i"]);
      if (sub_100005B98((unint64_t)[v45 integerValue]))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"g"]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mI"]);
        if (v20) {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
        }
        else {
          v49 = 0LL;
        }
        if ((objc_opt_respondsToSelector( v49,  "proxyManager:receivedPushAckResponse:messageId:token:connectionType:generation:guid:environmentName:") & 1) != 0) {
          [v49 proxyManager:self receivedPushAckResponse:v44 messageId:v48 token:v47 connectionType:v45 generation:v46 guid:v97 environmentName:v20];
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v87 = (APSIDSProxyManager *)[v45 integerValue];
        *(_DWORD *)buf = 134217984;
        v105 = v87;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for interface: %ld, failed to deliver",  buf,  0xCu);
      }

      goto LABEL_149;
    case 8uLL:
      v50 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"rP"]);
      v51 = -[APSOutgoingMessage initWithDictionary:]( objc_alloc(&OBJC_CLASS___APSOutgoingMessage),  "initWithDictionary:",  v50);
      if (v20) {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v52 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v52, "proxyManager:sendReversePush:guid:environmentName:") & 1) != 0) {
        [v52 proxyManager:self sendReversePush:v51 guid:v97 environmentName:v20];
      }
      goto LABEL_111;
    case 9uLL:
      v53 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"r"]);
      v54 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mG"]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mI"]);
      if (v20) {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v56 = 0LL;
      }
      if ((objc_opt_respondsToSelector( v56,  "proxyManager:reversePushResponse:messageGUID:messageId:guid:environmentName:") & 1) != 0) {
        [v56 proxyManager:self reversePushResponse:v53 messageGUID:v54 messageId:v55 guid:v97 environmentName:v20];
      }

      goto LABEL_149;
    case 0xAuLL:
      v57 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"st"]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"rT"]);

      if (v20) {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v59 = 0LL;
      }
      if ((objc_opt_respondsToSelector( v59,  "proxyManager:expiredNonceWithServerTime:shouldRollToken:guid:environmentName:") & 1) != 0) {
        [v59 proxyManager:self expiredNonceWithServerTime:v57 shouldRollToken:v58 != 0 guid:v97 environmentName:v20];
      }

      goto LABEL_149;
    case 0xBuLL:
      v50 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mS"]);
      v51 = (APSOutgoingMessage *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"lS"]);
      if (v20) {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v52 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v52, "proxyManager:incomingMessageSize:largeMessageSize:guid:environmentName:") & 1) != 0) {
        [v52 proxyManager:self incomingMessageSize:v50 largeMessageSize:v51 guid:v97 environmentName:v20];
      }
      goto LABEL_111;
    case 0xCuLL:
      v60 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"tH"]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
      v62 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"a"]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"eTTL"]);
      v64 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"vPK"]);
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"tT"]);
      v66 = (void *)v65;
      v67 = &off_10012B6B0;
      if (v65) {
        v67 = (_UNKNOWN **)v65;
      }
      v68 = v67;

      if (v20) {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v69 = 0LL;
      }
      if ((objc_opt_respondsToSelector( v69,  "proxyManager:tokenGenerateWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:guid:environmentName:") & 1) != 0) {
        [v69 proxyManager:self tokenGenerateWithTopicHash:v60 baseToken:v61 appId:v62 expirationTTL:v63 vapidPublicKeyHash:v64 type:v68 guid:v97 environmentName:v20];
      }

      goto LABEL_149;
    case 0xDuLL:
      v50 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"r"]);
      v51 = (APSOutgoingMessage *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"er"]);
      if (v20) {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v52 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v52, "proxyManager:appTokenGenerateResponse:error:guid:environmentName:") & 1) != 0) {
        [v52 proxyManager:self appTokenGenerateResponse:v50 error:v51 guid:v97 environmentName:v20];
      }
LABEL_111:

      goto LABEL_149;
    case 0xEuLL:
      v70 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"cS"]);
      id v71 = [v70 BOOLValue];

      if (v20) {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v72 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v72, "proxyManager:isConnected:guid:environmentName:") & 1) != 0) {
        [v72 proxyManager:self isConnected:v71 guid:v97 environmentName:v20];
      }

      goto LABEL_149;
    case 0xFuLL:
      v73 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"r"]);
      id v74 = [v73 intValue];

      v75 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"tS"]);
      v76 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"u"]);
      v77 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
      if (v20) {
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        v78 = 0LL;
      }
      if ((objc_opt_respondsToSelector( v78,  "proxyManager:messageTracingWithStatus:topic:tracingUUID:token:guid:environmentName:") & 1) != 0) {
        [v78 proxyManager:self messageTracingWithStatus:v74 topic:v75 tracingUUID:v76 token:v77 guid:v97 environmentName:v20];
      }

      goto LABEL_149;
    case 0x10uLL:
      v79 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"cl"]);
      v80 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mI"]);
      id v81 = [v80 unsignedIntValue];

      v82 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"t"]);
      v83 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"i"]);
      if (sub_100005B98((unint64_t)[v83 integerValue]))
      {
        if (v20) {
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
        }
        else {
          v84 = 0LL;
        }
        if ((objc_opt_respondsToSelector( v84,  "proxyManager:sendPubSubChannelList:messageID:token:connectionType:environmentName:guid:") & 1) != 0) {
          objc_msgSend( v84,  "proxyManager:sendPubSubChannelList:messageID:token:connectionType:environmentName:guid:",  self,  v79,  v81,  v82,  objc_msgSend(v83, "integerValue"),  v20,  v97);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v90 = (APSIDSProxyManager *)[v83 integerValue];
        *(_DWORD *)buf = 134217984;
        v105 = v90;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for channel list interface: %ld, failed to deliver",  buf,  0xCu);
      }

      goto LABEL_149;
    case 0x11uLL:
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"p"]);
      if (v20) {
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
      }
      else {
        id v29 = 0LL;
      }
      if ((objc_opt_respondsToSelector(v29, "proxyManager:handlePubSubChannelListResponse:environmentName:guid:") & 1) != 0) {
        [v29 proxyManager:self handlePubSubChannelListResponse:v28 environmentName:v20 guid:v97];
      }
      goto LABEL_143;
    case 0x12uLL:
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"p"]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"i"]);
      if (sub_100005B98((unint64_t)[v29 integerValue]))
      {
        if (v20) {
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_environmentToListener, "objectForKey:", v20));
        }
        else {
          v85 = 0LL;
        }
        if ((objc_opt_respondsToSelector( v85,  "proxyManager:handlePubSubUpdateMessage:connectionType:environmentName:guid:") & 1) != 0) {
          objc_msgSend( v85,  "proxyManager:handlePubSubUpdateMessage:connectionType:environmentName:guid:",  self,  v28,  objc_msgSend(v29, "integerValue"),  v20,  v97);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_71:
        v88 = (APSIDSProxyManager *)[v29 integerValue];
        *(_DWORD *)buf = 134218242;
        v105 = v88;
        __int16 v106 = 2112;
        id v107 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for interface: %ld message parameters %@, failed to deliver",  buf,  0x16u);
      }

+ (BOOL)shouldAssertWiFi
{
  return 0;
}

- (void)__assertWiFiIfPossible
{
  BOOL nearby = self->_nearby;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_nearby) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    *(_DWORD *)id v10 = 136315906;
    *(void *)&v10[4] = "-[APSIDSProxyManager __assertWiFiIfPossible]";
    if (+[APSIDSProxyManager shouldAssertWiFi](&OBJC_CLASS___APSIDSProxyManager, "shouldAssertWiFi")) {
      int v5 = @"YES";
    }
    else {
      int v5 = @"NO";
    }
    if (nearby) {
      BOOL v6 = @"NO";
    }
    else {
      BOOL v6 = @"YES";
    }
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: isNearby: %@ shouldAssertWiFi: %@ assertWiFi: %@",  v10,  0x2Au);
  }

  BOOL v7 = !nearby;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance",  *(_OWORD *)v10));
  [v8 enableWiFiAutoAssociation:v7 forDelegate:self];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance"));
  [v9 enableWakeOnWiFi:v7 forDelegate:self];
}

- (void)_assertWiFiIfPossible
{
  if (+[APSIDSProxyManager shouldAssertWiFi](&OBJC_CLASS___APSIDSProxyManager, "shouldAssertWiFi"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__assertWiFiIfPossible",  0LL);
    if (self->_nearby) {
      -[APSIDSProxyManager __assertWiFiIfPossible](self, "__assertWiFiIfPossible");
    }
    else {
      -[APSIDSProxyManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__assertWiFiIfPossible",  0LL,  10.0);
    }
  }

- (void)_checkNearbyDevices:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_idsSendQueue");
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007D78C;
  v9[3] = &unk_10011DC60;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)_onQueue_checkNearbyDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2(&_dispatch_main_q);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 isNearby] && (objc_msgSend(v9, "isActive") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_retrieveAllDevicesAndDo:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007DC38;
  v8[3] = &unk_10011F6B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007DD3C;
  v4[3] = &unk_10011FD00;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007DDDC;
  v4[3] = &unk_10011FD00;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007DE38;
  v4[3] = &unk_10011FD00;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = a5;
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_idsSendQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007DF20;
  v11[3] = &unk_10011FCD8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (APSIDSProxyManagerDelegate)delegate
{
  return (APSIDSProxyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_nearby;
}

- (NSString)recentDaemonAliveGuid
{
  return self->_recentDaemonAliveGuid;
}

- (void)setRecentDaemonAliveGuid:(id)a3
{
}

- (NSMutableArray)deviceNotFoundMessageQueue
{
  return self->_deviceNotFoundMessageQueue;
}

- (void)setDeviceNotFoundMessageQueue:(id)a3
{
}

- (PCPersistentTimer)deviceNotFoundTimer
{
  return self->_deviceNotFoundTimer;
}

- (void)setDeviceNotFoundTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end