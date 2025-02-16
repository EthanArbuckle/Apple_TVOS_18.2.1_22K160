@interface PDPushNotificationManager
- (NSArray)currentConsumers;
- (NSArray)topics;
- (NSString)pushToken;
- (PDPushNotificationManager)init;
- (void)_handleToken:(id)a3 forTokenInfo:(id)a4 fromTimeout:(BOOL)a5;
- (void)connect;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
- (void)dealloc;
- (void)disableCriticalReliability;
- (void)enableCriticalReliability;
- (void)generateSingleUsePushTokenForTopic:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)recalculatePushTopics;
- (void)registerConsumer:(id)a3;
- (void)setPushToken:(id)a3;
- (void)simulatePushForTopic:(id)a3;
- (void)unregisterAllConsumers;
- (void)unregisterConsumer:(id)a3;
@end

@implementation PDPushNotificationManager

- (PDPushNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPushNotificationManager;
  v2 = -[PDPushNotificationManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    registeredTopics = v2->_registeredTopics;
    v2->_registeredTopics = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v5;

    *(void *)&v2->_consumersLock._os_unfair_lock_opaque = 0LL;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passkitcore.pushmanager.replyQueue", 0LL);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v7;

    v2->_outstandingTokenRequestsLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPushNotificationManager;
  -[PDPushNotificationManager dealloc](&v3, "dealloc");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "hexEncoding", a3));
    os_unfair_lock_lock(&self->_consumersLock);
    -[PDPushNotificationManager setPushToken:](self, "setPushToken:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
    os_unfair_lock_unlock(&self->_consumersLock);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
          replyQueue = self->_replyQueue;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          v14[2] = sub_1001CE200;
          v14[3] = &unk_1006392B0;
          v14[4] = v12;
          id v15 = v5;
          dispatch_async((dispatch_queue_t)replyQueue, v14);

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_lock(&self->_consumersLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
  uint64_t v10 = self->_pushToken;
  os_unfair_lock_unlock(&self->_consumersLock);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v14);
        replyQueue = self->_replyQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001CE3D0;
        block[3] = &unk_10063B060;
        block[4] = v15;
        __int128 v19 = v10;
        id v20 = v7;
        id v21 = v8;
        dispatch_async((dispatch_queue_t)replyQueue, block);

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
}

- (void)registerConsumer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_consumersLock);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
    v6 = self->_pushToken;
    os_unfair_lock_unlock(&self->_consumersLock);
    if (([v5 containsObject:v4] & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 pushNotificationTopics]);
      replyQueue = self->_replyQueue;
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      uint64_t v13 = sub_1001CE58C;
      v14 = &unk_1006392B0;
      id v9 = v4;
      id v15 = v9;
      __int128 v16 = v6;
      dispatch_async((dispatch_queue_t)replyQueue, &v11);
      os_unfair_lock_lock(&self->_consumersLock);
      -[NSHashTable addObject:](self->_consumers, "addObject:", v9, v11, v12, v13, v14);
      -[NSMutableSet unionSet:](self->_registeredTopics, "unionSet:", v7);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_registeredTopics, "allObjects"));
      os_unfair_lock_unlock(&self->_consumersLock);
      -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v10);
    }
  }
}

- (void)unregisterConsumer:(id)a3
{
  p_consumersLock = &self->_consumersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_consumersLock);
  -[NSHashTable removeObject:](self->_consumers, "removeObject:", v5);
  os_unfair_lock_unlock(p_consumersLock);
  -[PDPushNotificationManager recalculatePushTopics](self, "recalculatePushTopics");
}

- (void)unregisterAllConsumers
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
  -[NSHashTable removeAllObjects](self->_consumers, "removeAllObjects");
  os_unfair_lock_unlock(p_consumersLock);
  -[PDPushNotificationManager recalculatePushTopics](self, "recalculatePushTopics");
}

- (void)recalculatePushTopics
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
  os_unfair_lock_unlock(&self->_consumersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v9),  "pushNotificationTopics",  (void)v13));
        -[NSMutableSet unionSet:](v3, "unionSet:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v3, "allObjects"));
  -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v11);
  os_unfair_lock_lock(&self->_consumersLock);
  registeredTopics = self->_registeredTopics;
  self->_registeredTopics = v3;

  os_unfair_lock_unlock(&self->_consumersLock);
}

- (NSArray)topics
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_registeredTopics, "allObjects"));
  os_unfair_lock_unlock(p_consumersLock);
  return (NSArray *)v4;
}

- (NSArray)currentConsumers
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
  os_unfair_lock_unlock(p_consumersLock);
  return (NSArray *)v4;
}

- (void)enableCriticalReliability
{
  p_criticalReliabilityLock = &self->_criticalReliabilityLock;
  os_unfair_lock_lock(&self->_criticalReliabilityLock);
  int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  if (enableCriticalReliabilityCount <= 0)
  {
    -[APSConnection setEnableCriticalReliability:](self->_apsConnection, "setEnableCriticalReliability:", 1LL);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Critical push reliability enabled", v7, 2u);
    }

    int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  }

  self->_int64_t enableCriticalReliabilityCount = enableCriticalReliabilityCount + 1;
  os_unfair_lock_unlock(p_criticalReliabilityLock);
}

- (void)disableCriticalReliability
{
  p_criticalReliabilityLock = &self->_criticalReliabilityLock;
  os_unfair_lock_lock(&self->_criticalReliabilityLock);
  int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  BOOL v5 = enableCriticalReliabilityCount == 1;
  BOOL v6 = enableCriticalReliabilityCount < 1;
  int64_t v7 = enableCriticalReliabilityCount - 1;
  if (!v6)
  {
    self->_int64_t enableCriticalReliabilityCount = v7;
    if (v5)
    {
      -[APSConnection setEnableCriticalReliability:](self->_apsConnection, "setEnableCriticalReliability:", 0LL);
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Critical push reliability disabled",  v10,  2u);
      }
    }
  }

  os_unfair_lock_unlock(p_criticalReliabilityLock);
}

- (void)generateSingleUsePushTokenForTopic:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[APSAppTokenInfo alloc] initWithTopic:v8 identifier:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1209600.0));
  [v11 setExpirationDate:v12];

  if (v11)
  {
    id v25 = v9;
    id v26 = v8;
    os_unfair_lock_lock(&self->_outstandingTokenRequestsLock);
    if (!self->_outstandingTokenRequests)
    {
      __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      outstandingTokenRequests = self->_outstandingTokenRequests;
      self->_outstandingTokenRequests = v13;
    }

    id v15 = objc_retainBlock(v10);
    __int128 v16 = self->_outstandingTokenRequests;
    id v17 = v11;
    __int128 v18 = objc_alloc(&OBJC_CLASS___NSString);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 topic]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);

    id v21 = -[NSString initWithFormat:](v18, "initWithFormat:", @"%@-%@", v19, v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v21);

    os_unfair_lock_unlock(&self->_outstandingTokenRequestsLock);
    -[APSConnection requestTokenForInfo:](self->_apsConnection, "requestTokenForInfo:", v17);
    objc_initWeak(&location, self);
    dispatch_time_t v22 = dispatch_time(0LL, 5000000000LL);
    id v23 = PDDefaultQueue();
    __int128 v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001CEC04;
    block[3] = &unk_1006393A0;
    objc_copyWeak(&v29, &location);
    id v28 = v17;
    dispatch_after(v22, v24, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    id v9 = v25;
    id v8 = v26;
  }

  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)connect
{
  if (!self->_apsConnection)
  {
    int v3 = PKIsAPNSDevelopmentEnvironmentEnabled();
    id v4 = (id *)&APSEnvironmentDevelopment;
    if (!v3) {
      id v4 = (id *)&APSEnvironmentProduction;
    }
    id v5 = *v4;
    BOOL v6 = objc_alloc(&OBJC_CLASS___APSConnection);
    id v7 = PDDefaultQueue();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v6,  "initWithEnvironmentName:namedDelegatePort:queue:",  v5,  @"com.apple.passd.aps",  v8);

    apsConnection = self->_apsConnection;
    self->_apsConnection = v9;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](self->_apsConnection, "publicToken"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v11 hexEncoding]);

    -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", self);
    -[PDPushNotificationManager setPushToken:](self, "setPushToken:", v12);
  }

- (void)simulatePushForTopic:(id)a3
{
}

- (void)_handleToken:(id)a3 forTokenInfo:(id)a4 fromTimeout:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_outstandingTokenRequestsLock);
  id v10 = v9;
  id v11 = objc_alloc(&OBJC_CLASS___NSString);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 topic]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  __int128 v14 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@-%@", v12, v13);
  id v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_outstandingTokenRequests,  "objectForKeyedSubscript:",  v14));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outstandingTokenRequests,  "setObject:forKeyedSubscript:",  0LL,  v14);
  if (!-[NSMutableDictionary count](self->_outstandingTokenRequests, "count"))
  {
    outstandingTokenRequests = self->_outstandingTokenRequests;
    self->_outstandingTokenRequests = 0LL;
  }

  os_unfair_lock_unlock(&self->_outstandingTokenRequestsLock);
  if (v15)
  {
    if (v8 || !v5)
    {
      ((void (**)(void, id, void))v15)[2](v15, v8, 0LL);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Error: Timed out generating push token for tokenInfo: (%@)",  buf,  0xCu);
      }

      uint64_t v19 = PDBasicError(@"Timed out generating push token");
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      ((void (**)(void, void, void *))v15)[2](v15, 0LL, v20);
    }
  }
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end