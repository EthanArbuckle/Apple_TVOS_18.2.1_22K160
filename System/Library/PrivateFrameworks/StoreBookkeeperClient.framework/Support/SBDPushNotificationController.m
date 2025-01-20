@interface SBDPushNotificationController
- (APSConnection)connection;
- (BOOL)isEnabledForDomain:(id)a3;
- (NSMutableDictionary)pendingAccountRequests;
- (NSMutableDictionary)registeredAccountsForDomains;
- (NSMutableDictionary)weakDomainDelegates;
- (NSSet)enabledDomains;
- (OS_dispatch_queue)queue;
- (SBDPushNotificationController)init;
- (id)_portNameForEnvironmentName:(id)a3;
- (id)_registeredAccountIDs;
- (void)_loadURLBagWithCompletionHandler:(id)a3;
- (void)_onQueue_updateConnectionTopicsAndStoreRegistrations;
- (void)_onQueue_updateStoreBookkeeperNotificationRegistration:(id)a3;
- (void)_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 withCompletionHandler:(id)a6;
- (void)_startServiceConnectionsWithCompletionHandler:(id)a3;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3 forBookkeeperDomain:(id)a4;
- (void)setEnabledDomains:(id)a3;
- (void)updateNotificationRegistrationsWithCompletionBlock:(id)a3;
- (void)updateStoreBookkeeperNotificationRegistration:(id)a3;
@end

@implementation SBDPushNotificationController

- (SBDPushNotificationController)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SBDPushNotificationController;
  v2 = -[SBDPushNotificationController init](&v25, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SBD.push-notification-controller", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    enabledDomains = v2->_enabledDomains;
    v2->_enabledDomains = (NSSet *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    weakDomainDelegates = v2->_weakDomainDelegates;
    v2->_weakDomainDelegates = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingAccountRequests = v2->_pendingAccountRequests;
    v2->_pendingAccountRequests = (NSMutableDictionary *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SBKPreferences storeBookkeeperPreferences]( &OBJC_CLASS___SBKPreferences,  "storeBookkeeperPreferences"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 objectForKey:@"SBKPushNotificationRegisteredDomains" withDefaultValue:0]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v30[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      v30[1] = objc_opt_class(&OBJC_CLASS___NSMutableSet);
      v30[2] = objc_opt_class(&OBJC_CLASS___NSString);
      v30[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
      id v24 = 0LL;
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v12,  &v24));
      v17 = (NSMutableDictionary *)v24;
      registeredAccountsForDomains = v2->_registeredAccountsForDomains;
      v2->_registeredAccountsForDomains = (NSMutableDictionary *)v16;

      if (v17)
      {
        v19 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v12;
          __int16 v28 = 2112;
          v29 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Error: SBDPushNotificationController init: Error unarchiving _registeredDomains from registeredDomains. regi steredDomains=%@ error=%@",  buf,  0x16u);
        }

        uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v21 = v2->_registeredAccountsForDomains;
        v2->_registeredAccountsForDomains = (NSMutableDictionary *)v20;
      }
    }

    else
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v17 = v2->_registeredAccountsForDomains;
      v2->_registeredAccountsForDomains = (NSMutableDictionary *)v22;
    }

    -[SBDPushNotificationController _startServiceConnectionsWithCompletionHandler:]( v2,  "_startServiceConnectionsWithCompletionHandler:",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000EB10;
  v7[3] = &unk_10001D2C8;
  v7[4] = self;
  dispatch_queue_t v3 = objc_retainBlock(v7);
  queue = (dispatch_queue_s *)self->_queue;
  if (queue) {
    dispatch_async(queue, v3);
  }
  else {
    ((void (*)(void *))v3[2])(v3);
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self->_fakeNotificationObserver];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SBDPushNotificationController;
  -[SBDPushNotificationController dealloc](&v6, "dealloc");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didReceivePublicToken:%@",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didReceiveMessageForTopic:%@ userInfo:%@",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000E744;
  v16[3] = &unk_10001CF40;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(queue, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didReceiveIncomingMessage:%@",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didSendOutgoingMessage:%@",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138413058;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didFailToSendOutgoingMessage:%@, error = %@",  (uint8_t *)&v12,  0x2Au);
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412802;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@ connection:%@ didChangeConnectedStatus: connected = %d",  (uint8_t *)&v8,  0x1Cu);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@ connectionDidReconnect:%@",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)_onQueue_updateConnectionTopicsAndStoreRegistrations
{
  if (self->_connection)
  {
    if (-[NSSet count](self->_enabledDomains, "count"))
    {
      BOOL v13 = @"com.apple.storebookkeeper";
      dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    }

    else
    {
      dispatch_queue_t v3 = 0LL;
    }

    -[APSConnection setEnabledTopics:](self->_connection, "setEnabledTopics:", v3);
    id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412546;
      __int16 v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = connection;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Setting APNS connection enabled topics to %@ on connection %@",  buf,  0x16u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E738;
    block[3] = &unk_10001D2C8;
    block[4] = self;
    dispatch_async(v7, block);
  }

- (void)setDelegate:(id)a3 forBookkeeperDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E6D4;
  block[3] = &unk_10001CF68;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)isEnabledForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E66C;
  block[3] = &unk_10001CF90;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)setEnabledDomains:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E624;
  block[3] = &unk_10001CFB8;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NSSet)enabledDomains
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10000E5D4;
  id v10 = sub_10000E5E4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E5EC;
  v5[3] = &unk_10001CFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)updateNotificationRegistrationsWithCompletionBlock:(id)a3
{
}

- (void)_startServiceConnectionsWithCompletionHandler:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000DF08;
  v9[3] = &unk_10001D2C8;
  v9[4] = self;
  id v4 = objc_retainBlock(v9);
  uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ Beginning APS bringup - creating connections...",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DF60;
  v7[3] = &unk_10001D008;
  v7[4] = self;
  id v8 = v4;
  uint64_t v6 = v4;
  -[SBDPushNotificationController _loadURLBagWithCompletionHandler:](self, "_loadURLBagWithCompletionHandler:", v7);
}

- (void)_loadURLBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XPCTransactionController sharedInstance](&OBJC_CLASS___XPCTransactionController, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 beginTransactionWithIdentifier:@"PushNotificationConfiguration-LoadURLBag"]);

  id v7 = objc_alloc_init(&OBJC_CLASS___SSURLBagContext);
  id v8 = [[SSURLBag alloc] initWithURLBagContext:v7];
  id v9 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Loading URL Bag", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000DA78;
  v12[3] = &unk_10001D058;
  id v13 = v6;
  id v14 = v4;
  v12[4] = self;
  id v10 = v6;
  id v11 = v4;
  [v8 loadWithCompletionBlock:v12];
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    id v4 = @"com.apple.aps.storebookkeeperd";
  }

  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    id v4 = @"com.apple.aps.storebookkeeperd.dev";
  }

  else if ([v3 isEqualToString:APSEnvironmentDemo])
  {
    id v4 = @"com.apple.aps.storebookkeeperd.demo";
  }

  else
  {
    id v4 = 0LL;
  }

  return (id)v4;
}

- (id)_registeredAccountIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_registeredAccountsForDomains, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 unionSet:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  id v9 = [v3 copy];
  return v9;
}

- (void)_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = (__CFString *)a3;
  __int128 v11 = (__CFString *)a5;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10000D02C;
  v46[3] = &unk_10001D080;
  id v12 = a6;
  id v47 = v12;
  __int128 v13 = objc_retainBlock(v46);
  if (!self->_bagLoaded)
  {
    __int128 v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    *(_DWORD *)buf = 138412802;
    v49 = v15;
    __int16 v50 = 2112;
    v51 = v10;
    __int16 v52 = 2112;
    v53 = v11;
    __int16 v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'URL bag has not been loaded'.";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x20u);

    goto LABEL_22;
  }

  if (!self->_typeRegistrationURL)
  {
    __int128 v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    *(_DWORD *)buf = 138412802;
    v49 = v15;
    __int16 v50 = 2112;
    v51 = v10;
    __int16 v52 = 2112;
    v53 = v11;
    __int16 v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'type registrat"
          "ion URL not found in URL bag'.";
    goto LABEL_21;
  }

  if (!self->_pushEnabled && v8)
  {
    __int128 v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v10;
      __int16 v50 = 2112;
      v51 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Skipping opt-in push notification registration attempt for domain '%@' (accountID %@).  reason = 'push is not en abled at the moment'.",  buf,  0x16u);
    }

    goto LABEL_22;
  }

  if (!v11)
  {
    __int128 v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      *(_DWORD *)buf = 138412802;
      v49 = v15;
      __int16 v50 = 2112;
      v51 = v10;
      __int16 v52 = 2112;
      v53 = 0LL;
      __int16 v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'account ID m"
            "issing, not set, or unspecified'.";
      goto LABEL_21;
    }

- (void)updateStoreBookkeeperNotificationRegistration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CEE8;
  block[3] = &unk_10001D008;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)_onQueue_updateStoreBookkeeperNotificationRegistration:(id)a3
{
  id v40 = a3;
  if (v40) {
    dispatch_group_t v3 = dispatch_group_create();
  }
  else {
    dispatch_group_t v3 = 0LL;
  }
  id v48 = -[NSMutableDictionary copy](self->_registeredAccountsForDomains, "copy");
  id v44 = -[NSSet copy](self->_enabledDomains, "copy");
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_10000CB7C;
  v77[3] = &unk_10001D0D0;
  v39 = v3;
  v78 = v39;
  v79 = self;
  id v4 = objc_retainBlock(v77);
  uint64_t v5 = SBKStoreAccountIdentifiers();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SBDPushNotificationController _registeredAccountIDs](self, "_registeredAccountIDs"));
  id v7 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v74 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
        if (([v6 containsObject:v11] & 1) == 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingAccountRequests,  "objectForKeyedSubscript:",  v11));
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472LL;
          v71[2] = sub_10000CC38;
          v71[3] = &unk_10001D0F8;
          v71[4] = v11;
          id v72 = v12;
          id v14 = v12;
          [v13 enumerateKeysAndObjectsUsingBlock:v71];

          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingAccountRequests,  "objectForKeyedSubscript:",  v11));
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"domain"]);
          [v15 removeObjectsForKeys:v16];

          [v14 makeObjectsPerformSelector:"cancel"];
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472LL;
          v69[2] = sub_10000CCA8;
          v69[3] = &unk_10001D148;
          v69[4] = v11;
          v70 = v4;
          [v48 enumerateKeysAndObjectsUsingBlock:v69];
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
    }

    while (v8);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v41 = v6;
  BOOL v45 = (char *)[v41 countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v66;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v66 != v43) {
          objc_enumerationMutation(v41);
        }
        obja = v17;
        uint64_t v18 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v17);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_10000CD00;
        v61[3] = &unk_10001D120;
        id v19 = v44;
        id v62 = v19;
        unsigned __int8 v20 = v4;
        v63 = v18;
        id v64 = v20;
        [v48 enumerateKeysAndObjectsUsingBlock:v61];
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v21 = v19;
        id v22 = [v21 countByEnumeratingWithState:&v57 objects:v81 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v58;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v58 != v24) {
                objc_enumerationMutation(v21);
              }
              if (v18)
              {
                uint64_t v26 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
                if ((sub_10000CD54(v18) & 1) == 0)
                {
                  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v26]);
                  unsigned __int8 v28 = [v27 containsObject:v18];

                  if ((v28 & 1) == 0) {
                    ((void (*)(void *, uint64_t, uint64_t, void *))v4[2])(v20, v26, 1LL, v18);
                  }
                }
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v57 objects:v81 count:16];
          }

          while (v23);
        }

        if (sub_10000CD54(v18))
        {
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472LL;
          v55[2] = sub_10000CEB0;
          v55[3] = &unk_10001D148;
          v29 = v20;
          v55[4] = v18;
          id v56 = v29;
          [v48 enumerateKeysAndObjectsUsingBlock:v55];
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v30 = v21;
          id v31 = [v30 countByEnumeratingWithState:&v51 objects:v80 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v52;
            do
            {
              for (k = 0LL; k != v32; k = (char *)k + 1)
              {
                if (*(void *)v52 != v33) {
                  objc_enumerationMutation(v30);
                }
                ((void (*)(id, void, void, void *))v4[2])( v29,  *(void *)(*((void *)&v51 + 1) + 8LL * (void)k),  0LL,  v18);
              }

              id v32 = [v30 countByEnumeratingWithState:&v51 objects:v80 count:16];
            }

            while (v32);
          }
        }

        id v17 = obja + 1;
      }

      while (obja + 1 != v45);
      BOOL v45 = (char *)[v41 countByEnumeratingWithState:&v65 objects:v82 count:16];
    }

    while (v45);
  }

  if (v39)
  {
    id v35 = [v40 copy];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CEC4;
    block[3] = &unk_10001D080;
    id v38 = v35;
    id v50 = v38;
    dispatch_group_notify(v39, v37, block);
  }

  else
  {
    id v38 = v40;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (APSConnection)connection
{
  return self->_connection;
}

- (NSMutableDictionary)weakDomainDelegates
{
  return self->_weakDomainDelegates;
}

- (NSMutableDictionary)pendingAccountRequests
{
  return self->_pendingAccountRequests;
}

- (NSMutableDictionary)registeredAccountsForDomains
{
  return self->_registeredAccountsForDomains;
}

- (void).cxx_destruct
{
}

@end