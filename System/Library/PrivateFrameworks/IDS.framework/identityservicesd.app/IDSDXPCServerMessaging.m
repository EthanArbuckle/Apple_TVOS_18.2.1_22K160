@interface IDSDXPCServerMessaging
- (BOOL)_entitledForTopic:(id)a3;
- (BOOL)entitledForAllTopics;
- (FTMessageDelivery)messageDelivery;
- (IDSDXPCServerMessaging)initWithQueue:(id)a3 connection:(id)a4 messageDelivery:(id)a5 pushHandler:(id)a6;
- (IDSPushHandler)pushHandler;
- (NSArray)serverMessagingEntitlements;
- (NSMutableDictionary)clientContextByTopic;
- (NSMutableDictionary)messagesToCancelOnDeallocByTopic;
- (NSMutableDictionary)pendingFetchMessagesWaiting;
- (OS_dispatch_queue)queue;
- (id)_commands;
- (id)_topics;
- (void)_handlePendingFetchBlocksForIdentifier:(id)a3 topic:(id)a4;
- (void)_recalculateTopics;
- (void)cancelMessageWithIdentifier:(id)a3 onTopic:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6;
- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5;
- (void)sendCertifiedDeliveryReceipt:(id)a3;
- (void)sendMessageData:(id)a3 onTopic:(id)a4 withOptions:(id)a5 identifier:(id)a6 completion:(id)a7;
- (void)sendServerStorageFetchForTopic:(id)a3 completion:(id)a4;
- (void)setClientContextByTopic:(id)a3;
- (void)setEntitledForAllTopics:(BOOL)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setMessagesToCancelOnDeallocByTopic:(id)a3;
- (void)setPendingFetchMessagesWaiting:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerMessagingEntitlements:(id)a3;
- (void)setupServerMessagingClient:(id)a3 withUUID:(id)a4 forTopic:(id)a5 commands:(id)a6;
@end

@implementation IDSDXPCServerMessaging

- (IDSDXPCServerMessaging)initWithQueue:(id)a3 connection:(id)a4 messageDelivery:(id)a5 pushHandler:(id)a6
{
  id v11 = a3;
  v12 = (IDSDXPCServerMessaging *)a4;
  id obj = a5;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging valueForEntitlement:]( v12,  "valueForEntitlement:",  kIDSServerMessagingEntitlement));
  v17 = (IDSDXPCServerMessaging *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging valueForEntitlement:]( v12,  "valueForEntitlement:",  kIDSTestToolEntitlement));
  if (!v15)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1006A4D9C();
    }
    goto LABEL_30;
  }

  id v45 = a6;
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
  BOOL v20 = (objc_opt_isKindOfClass(v15, v18) & 1) != 0 && [v15 count] != 0;
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
  if ((objc_opt_isKindOfClass(v15, v22) & 1) != 0
    && [v15 BOOLValue]
    && (uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v23), (objc_opt_isKindOfClass(v17, v24) & 1) != 0))
  {
    unsigned int v25 = -[IDSDXPCServerMessaging BOOLValue](v17, "BOOLValue");
  }

  else
  {
    unsigned int v25 = 0;
  }

  if (((v20 | v25) & 1) == 0)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v54 = v12;
      __int16 v55 = 2112;
      v56 = v15;
      __int16 v57 = 2112;
      v58 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Invalid server messaging entitlement -- failing creation of IDSDXPCServerMessaging collaborator {connection: %@, serverMessagingEntitlementValue: %@, testToolEntitlementValue: %@}",  buf,  0x20u);
    }

- (void)dealloc
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic](self, "messagesToCancelOnDeallocByTopic"));
  id v15 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v3;
        uint64_t v4 = *(void *)(*((void *)&v22 + 1) + 8 * v3);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic]( self,  "messagesToCancelOnDeallocByTopic"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v32 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
              v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSServerMessaging]( &OBJC_CLASS___IDSFoundationLog,  "IDSServerMessaging"));
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                id v27 = self;
                __int16 v28 = 2112;
                uint64_t v29 = v11;
                __int16 v30 = 2112;
                uint64_t v31 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cancelling pending message {self: %p, identifier: %@, topic: %@}",  buf,  0x20u);
              }

              -[IDSDXPCServerMessaging cancelMessageWithIdentifier:onTopic:completion:]( self,  "cancelMessageWithIdentifier:onTopic:completion:",  v11,  v4,  &stru_1008FF1B8);
            }

            id v8 = [v6 countByEnumeratingWithState:&v18 objects:v32 count:16];
          }

          while (v8);
        }

        uint64_t v3 = v16 + 1;
      }

      while ((id)(v16 + 1) != v15);
      id v15 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
    }

    while (v15);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSDXPCServerMessaging;
  -[IDSDXPCServerMessaging dealloc](&v17, "dealloc");
}

- (BOOL)_entitledForTopic:(id)a3
{
  id v4 = a3;
  if (-[IDSDXPCServerMessaging entitledForAllTopics](self, "entitledForAllTopics")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging serverMessagingEntitlements](self, "serverMessagingEntitlements")),
        unsigned __int8 v6 = [v5 containsObject:v4],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1006A4E5C(self, (uint64_t)v4, v8);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)_commands
{
  uint64_t v3 = -[NSMutableSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithObjects:",  &off_100947650,  &off_100947668,  &off_100947680,  &off_100947698,  0LL);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
  id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v4;
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * v4);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v11);
              id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v5]);
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);

              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 commands]);
              if (v16)
              {
                objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v15 commands]);
                -[NSMutableSet unionSet:](v3, "unionSet:", v17);
              }

              uint64_t v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v9);
        }

        uint64_t v4 = v23 + 1;
      }

      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v22);
  }

  id v18 = -[NSMutableSet copy](v3, "copy");
  return v18;
}

- (id)_topics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imSetFromArray"));

  return v4;
}

- (void)_recalculateTopics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
  id v4 = [v3 count];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pushHandler](self, "pushHandler"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imSetFromArray"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging _commands](self, "_commands"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging queue](self, "queue"));
    [v10 addListener:self topics:v7 commands:v8 queue:v9];
  }

  else
  {
    [v10 removeListener:self];
  }
}

- (void)_handlePendingFetchBlocksForIdentifier:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pendingFetchMessagesWaiting](self, "pendingFetchMessagesWaiting"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if ([v9 count])
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      __int128 v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Calling pending fetch blocks { topic: %@, identifier: %@, blocks: %@ }",  buf,  0x20u);
    }

    if (v6)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
      id v12 = (id)v11;
      if (v11) {
        (*(void (**)(uint64_t))(v11 + 16))(v11);
      }
    }

    else
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_super v17 = (void (**)(void))objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)v16),  (void)v18));
            v17[2]();

            uint64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v14);
      }
    }
  }
}

- (void)setupServerMessagingClient:(id)a3 withUUID:(id)a4 forTopic:(id)a5 commands:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[IDSDXPCServerMessaging _entitledForTopic:](self, "_entitledForTopic:", v12))
  {
    if (v10)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxy]);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 134218498;
          v35 = self;
          __int16 v36 = 2112;
          id v37 = v11;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Adding server messaging client {self: %p, uuid: %@, topic: %@}",  (uint8_t *)&v34,  0x20u);
        }

        objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
        if (!v17)
        {
          __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[IDSDXPCServerMessaging setClientContextByTopic:](self, "setClientContextByTopic:", v18);
        }

        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v12]);

        if (!v20)
        {
          __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
          [v22 setObject:v21 forKeyedSubscript:v12];
        }

        uint64_t v16 = objc_alloc_init(&OBJC_CLASS___IDSXPCServerMessagingClientContext);
        -[os_log_s setClient:](v16, "setClient:", v14);
        -[os_log_s setCommands:](v16, "setCommands:", v13);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v12]);
        [v24 setObject:v16 forKeyedSubscript:v11];

        -[IDSDXPCServerMessaging _recalculateTopics](self, "_recalculateTopics");
      }

      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v34 = 134218498;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v11;
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Error creating proxy for server messaging client {self: %p, uuid: %@, topic: %@}",  (uint8_t *)&v34,  0x20u);
      }
    }

    else
    {
      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 134218498;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v11;
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Removing server messaging client {self: %p, uuid: %@, topic: %@}",  (uint8_t *)&v34,  0x20u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v12]);
      [v27 setObject:0 forKeyedSubscript:v11];

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v12]);
      id v30 = [v29 count];

      if (!v30)
      {
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
        [v31 setObject:0 forKeyedSubscript:v12];
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
      id v33 = [v32 count];

      if (!v33) {
        -[IDSDXPCServerMessaging setClientContextByTopic:](self, "setClientContextByTopic:", 0LL);
      }
      -[IDSDXPCServerMessaging _recalculateTopics](self, "_recalculateTopics");
    }
  }
}

- (void)sendMessageData:(id)a3 onTopic:(id)a4 withOptions:(id)a5 identifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  LOBYTE(a7) = -[IDSDXPCServerMessaging _entitledForTopic:](self, "_entitledForTopic:", v13);
  objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
  __int128 v18 = v17;
  if ((a7 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v15;
      __int16 v54 = 2112;
      id v55 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "daemon requested sendMessageData { guid: %@, options: %@ }",  buf,  0x16u);
    }

    id v19 = objc_alloc_init(&OBJC_CLASS___IDSServerMessagingMessage);
    id v45 = v12;
    [v19 setMessageData:v12];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v14 timeout]);

    if (v20)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 timeout]);
      [v21 doubleValue];
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

      [v19 setExpirationDate:v22];
    }

    [v19 setMessageID:v15];
    [v19 setTopic:v13];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 command]);
    [v19 setUserSpecifiedCommand:v23];

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pushHandler](self, "pushHandler"));
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pushToken]);
    [v19 setPushToken:v25];

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 additionalTopLevelFields]);
    [v19 setUserDefinedTopLevelFields:v26];

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10026FABC;
    v46[3] = &unk_1008FF1E0;
    id v51 = v16;
    id v27 = v14;
    id v47 = v27;
    __int128 v48 = self;
    id v28 = v13;
    id v49 = v28;
    id v29 = v15;
    id v50 = v29;
    [v19 setCompletionBlock:v46];
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v53 = v19;
      __int16 v54 = 2112;
      id v55 = v29;
      __int16 v56 = 2112;
      id v57 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Sending server message { guid: %@, topic: %@, message: %@ } ",  buf,  0x20u);
    }

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](self, "messageDelivery"));
    [v31 sendMessage:v19];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v27 cancelOnClientCrash]);
    unsigned int v33 = [v32 BOOLValue];

    if (v33)
    {
      int v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic]( self,  "messagesToCancelOnDeallocByTopic"));

      if (!v34)
      {
        v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[IDSDXPCServerMessaging setMessagesToCancelOnDeallocByTopic:]( self,  "setMessagesToCancelOnDeallocByTopic:",  v35);
      }

      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic]( self,  "messagesToCancelOnDeallocByTopic"));
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v28]);

      if (!v37)
      {
        __int16 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v39 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic]( self,  "messagesToCancelOnDeallocByTopic"));
        [v39 setObject:v38 forKeyedSubscript:v28];
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCServerMessaging messagesToCancelOnDeallocByTopic]( self,  "messagesToCancelOnDeallocByTopic"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v28]);
      [v41 addObject:v29];
    }

    id v12 = v45;
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1006A4F14();
    }

    uint64_t v42 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v58 = NSUnderlyingErrorKey;
    id v43 = (void *)objc_claimAutoreleasedReturnValue( +[IDSXPCConnection errorForMissingEntitlement:]( &OBJC_CLASS___IDSXPCConnection,  "errorForMissingEntitlement:",  kIDSServerMessagingEntitlement));
    v59 = v43;
    id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v42,  1LL,  v44));

    (*((void (**)(id, void, id))v16 + 2))(v16, 0LL, v19);
  }
}

- (void)cancelMessageWithIdentifier:(id)a3 onTopic:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  __int16 v36 = self;
  unsigned __int8 v11 = -[IDSDXPCServerMessaging _entitledForTopic:](self, "_entitledForTopic:", v9);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
  id v13 = v12;
  if ((v11 & 1) != 0)
  {
    v35 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "daemon requested cancelMessageWithIdentifier { identifier: %@, topic: %@ }",  buf,  0x16u);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](self, "messageDelivery"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 queuedMessages]);
    id v16 = [v15 _copyForEnumerating];

    id v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v17)
    {
      id v19 = v17;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___IDSServerMessagingMessage, v18);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            id v24 = v22;
            __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 topic]);
            unsigned int v26 = [v25 isEqualToString:v9];

            if (v26)
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 messageID]);
              unsigned int v28 = [v27 isEqualToString:v8];

              if (v28)
              {
                id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSServerMessaging]( &OBJC_CLASS___IDSFoundationLog,  "IDSServerMessaging"));
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  id v42 = v24;
                  __int16 v43 = 2112;
                  id v44 = v8;
                  __int16 v45 = 2112;
                  id v46 = v9;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Cancelling server message { guid: %@, topic: %@, message: %@ } ",  buf,  0x20u);
                }

                id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](v36, "messageDelivery"));
                [v30 cancelMessage:v24];
              }
            }
          }
        }

        id v19 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }

      while (v19);
    }

    id v10 = v35;
    if (v35) {
      v35[2](v35, 1LL, 0LL);
    }
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A4FD4();
    }

    uint64_t v31 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v48 = NSUnderlyingErrorKey;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSXPCConnection errorForMissingEntitlement:]( &OBJC_CLASS___IDSXPCConnection,  "errorForMissingEntitlement:",  kIDSServerMessagingEntitlement));
    id v49 = v32;
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v31,  1LL,  v33));

    v10[2](v10, 0LL, v34);
  }
}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1006A5094(v5);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
  if (-[IDSDXPCServerMessaging _entitledForTopic:](self, "_entitledForTopic:", v6))
  {
    id v7 = [[IDSCertifiedDeliveryReceiptMessage alloc] initWithCertifiedDeliveryContext:v4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
    [v7 setTopic:v8];

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 originalGUID]);
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending certified delivery receipt to server { topic: %@, guid: %@, context: %@ }",  (uint8_t *)&v12,  0x20u);
    }

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](self, "messageDelivery"));
    [v11 sendMessage:v7];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_1006A5034();
    }
  }
}

- (void)sendServerStorageFetchForTopic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IDSDXPCServerMessaging _entitledForTopic:](self, "_entitledForTopic:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    if (v7)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pendingFetchMessagesWaiting](self, "pendingFetchMessagesWaiting"));

      if (!v10)
      {
        unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[IDSDXPCServerMessaging setPendingFetchMessagesWaiting:](self, "setPendingFetchMessagesWaiting:", v11);
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pendingFetchMessagesWaiting](self, "pendingFetchMessagesWaiting"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v6]);

      if (!v13)
      {
        __int16 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pendingFetchMessagesWaiting](self, "pendingFetchMessagesWaiting"));
        [v15 setObject:v14 forKeyedSubscript:v6];
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002706B0;
      v26[3] = &unk_1008F6330;
      id v27 = v7;
      __int16 v16 = objc_retainBlock(v26);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging pendingFetchMessagesWaiting](self, "pendingFetchMessagesWaiting"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v6]);
      [v18 setObject:v16 forKeyedSubscript:v9];
    }

    id v19 = objc_alloc_init(&OBJC_CLASS___IDSPendingOfflineMessageResponse);
    [v19 setTopic:v6];
    [v19 setMessageIdentifier:v9];
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Client triggered sending pending offline to server in IDSServerMessaging { topic: %@ }",  buf,  0xCu);
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](self, "messageDelivery"));
    [v21 sendMessage:v19];
  }

  else
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1006A50D4();
    }

    uint64_t v23 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v30 = NSUnderlyingErrorKey;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSXPCConnection errorForMissingEntitlement:]( &OBJC_CLASS___IDSXPCConnection,  "errorForMissingEntitlement:",  kIDSServerMessagingEntitlement));
    uint64_t v31 = v24;
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  1LL,  v25));

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"U"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"U"]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v15));
LABEL_5:
    id v19 = (void *)v16;
    uint64_t v20 = JWUUIDPushObjectToString(v16);
    uint64_t v115 = objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_7;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"U"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData, v17);
  if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"U"]);
    goto LABEL_5;
  }

  uint64_t v21 = JWUUIDPushObjectToString(0LL);
  uint64_t v115 = objc_claimAutoreleasedReturnValue(v21);
LABEL_7:

  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v124 = v115;
    __int16 v125 = 2112;
    id v126 = v10;
    __int16 v127 = 2112;
    id v128 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received incoming server message over push in IDSDXPCServerMessaging { guid: %@, topic: %@, fromID: %@ }",  buf,  0x20u);
  }

  uint64_t v23 = IDSPayloadKey;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSPayloadKey]);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v25);
  id v114 = v10;
  v105 = v11;
  uint64_t v109 = v23;
  if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v23]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v27));
LABEL_13:
    v112 = (void *)v28;
    goto LABEL_15;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v23]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData, v29);
  if ((objc_opt_isKindOfClass(v27, v30) & 1) != 0)
  {
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v23]);
    goto LABEL_13;
  }

  v112 = 0LL;
LABEL_15:

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber, v31);
  id v33 = sub_100271078(v32, v9, @"H");
  int v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber, v35);
  id v37 = sub_100271078(v36, v9, @"c");
  v116 = (void *)objc_claimAutoreleasedReturnValue(v37);
  unsigned __int8 v108 = [v34 unsignedIntValue];
  v104 = v34;
  unsigned __int8 v38 = [v34 unsignedIntValue];
  uint64_t v39 = IDSTokenKey;
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSTokenKey]);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString, v41);
  if ((objc_opt_isKindOfClass(v40, v42) & 1) != 0)
  {
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v39]);
    uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v43));
LABEL_19:
    v106 = (void *)v44;
    goto LABEL_21;
  }

  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v39]);
  uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSData, v45);
  if ((objc_opt_isKindOfClass(v43, v46) & 1) != 0)
  {
    uint64_t v44 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v39]);
    goto LABEL_19;
  }

  v106 = 0LL;
LABEL_21:

  uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSNumber, v47);
  uint64_t v102 = IDSCertifiedDeliveryVersionKey;
  id v49 = sub_100271078(v48, v9, IDSCertifiedDeliveryVersionKey);
  id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  id v100 = [v50 integerValue];

  uint64_t v51 = IDSCertifiedDeliveryRTSKey;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSCertifiedDeliveryRTSKey]);
  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString, v53);
  if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v51]);
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v55));
    __int16 v56 = v114;
  }

  else
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v51]);
    uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSData, v57);
    __int16 v56 = v114;
    if ((objc_opt_isKindOfClass(v55, v58) & 1) != 0) {
      v107 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v51]);
    }
    else {
      v107 = 0LL;
    }
  }

  uint64_t v59 = IDSStorageFetchIdentifierKey;
  v60 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSStorageFetchIdentifierKey]);
  uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString, v61);
  if ((objc_opt_isKindOfClass(v60, v62) & 1) != 0)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v59]);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v63));
    uint64_t v65 = JWUUIDPushObjectToString(v64);
    v111 = (void *)objc_claimAutoreleasedReturnValue(v65);
  }

  else
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v59]);
    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSData, v66);
    if ((objc_opt_isKindOfClass(v63, v67) & 1) != 0)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v59]);
      uint64_t v69 = JWUUIDPushObjectToString(v68);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v69);
    }

    else
    {
      uint64_t v70 = JWUUIDPushObjectToString(0LL);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v70);
    }
  }

  v71 = self;

  id v72 = [v9 mutableCopy];
  v122[0] = v109;
  v122[1] = @"H";
  v122[2] = @"c";
  v122[3] = v39;
  v122[4] = v102;
  v122[5] = v51;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 6LL));
  [v72 removeObjectsForKeys:v73];

  if (v107)
  {
    v74 = (void *)v115;
    id v75 = [[IDSCertifiedDeliveryContext alloc] initWithGUID:v115 service:v56 certifiedDeliveryVersion:v100 certifiedDeliveryRTS:v107 senderToken:v106];
  }

  else
  {
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    v74 = (void *)v115;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      sub_1006A5194();
    }

    id v75 = 0LL;
  }

  v101 = v72;
  v103 = v75;
  id v110 = [[IDSServerMessagingIncomingContext alloc] initWithFromServerStorage:v108 & 1 certifiedDeliveryContext:v75 command:v116 identifier:v74 additionalTopLevelFields:v72];
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:v56]);
  id v79 = [v78 count];

  if (v79)
  {
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:v56]);

    id v82 = [v81 countByEnumeratingWithState:&v117 objects:v121 count:16];
    if (v82)
    {
      id v83 = v82;
      id v99 = v9;
      uint64_t v84 = *(void *)v118;
      while (1)
      {
        for (i = 0LL; i != v83; i = (char *)i + 1)
        {
          if (*(void *)v118 != v84) {
            objc_enumerationMutation(v81);
          }
          v86 = *(void **)(*((void *)&v117 + 1) + 8LL * (void)i);
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSServerMessaging]( &OBJC_CLASS___IDSFoundationLog,  "IDSServerMessaging"));
          BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
          if ((v38 & 2) != 0)
          {
            if (!v88) {
              goto LABEL_48;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v124 = v115;
            __int16 v125 = 2112;
            id v126 = v86;
            v89 = v87;
            v90 = "Giving message to client - and last storage indication { guid: %@, clientUUID: %@ }";
          }

          else
          {
            if (!v88) {
              goto LABEL_48;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v124 = v115;
            __int16 v125 = 2112;
            id v126 = v86;
            v89 = v87;
            v90 = "Giving message to client { guid: %@, clientUUID: %@ }";
          }

          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, v90, buf, 0x16u);
LABEL_48:

          if ([v116 longValue] != (id)255)
          {
            v91 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](v71, "clientContextByTopic"));
            v92 = (void *)objc_claimAutoreleasedReturnValue([v91 objectForKeyedSubscript:v56]);
            v93 = (void *)objc_claimAutoreleasedReturnValue([v92 objectForKeyedSubscript:v86]);
            v94 = (void *)objc_claimAutoreleasedReturnValue([v93 client]);
            [v94 handleReceivedIncomingMessageData:v112 identifier:v115 context:v110];

            v71 = self;
            __int16 v56 = v114;
          }

          if ((v38 & 2) != 0)
          {
            -[IDSDXPCServerMessaging _handlePendingFetchBlocksForIdentifier:topic:]( v71,  "_handlePendingFetchBlocksForIdentifier:topic:",  v111,  v56);
            v95 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](v71, "clientContextByTopic"));
            v96 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKeyedSubscript:v56]);
            v97 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:v86]);
            v98 = (void *)objc_claimAutoreleasedReturnValue([v97 client]);
            [v98 handleReceivedFinalStorageIndication];

            __int16 v56 = v114;
            v71 = self;
          }
        }

        id v83 = [v81 countByEnumeratingWithState:&v117 objects:v121 count:16];
        if (!v83)
        {
          id v9 = v99;
          v74 = (void *)v115;
          break;
        }
      }
    }
  }

  else
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR)) {
      sub_1006A5134();
    }
  }
}

- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___IDSPendingOfflineMessageResponse);
  [v7 setTopic:v6];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending pending offline message response to server in IDSServerMessaging { topic: %@ }",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging messageDelivery](self, "messageDelivery"));
  [v9 sendMessage:v7];
}

- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);
  id v12 = [v11 count];

  if (v12)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v8]);

    id obj = v14;
    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      id v25 = v9;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSServerMessaging]( &OBJC_CLASS___IDSFoundationLog,  "IDSServerMessaging"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v32 = v8;
            __int16 v33 = 2112;
            uint64_t v34 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Giving no storage response indication to client { topic: %@, clientUUID: %@ }",  buf,  0x16u);
          }

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCServerMessaging clientContextByTopic](self, "clientContextByTopic"));
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v8]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v19]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 client]);
          [v24 handleReceivedFinalStorageIndication];
        }

        id v16 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v16);
      id v9 = v25;
    }
  }

  else
  {
    id obj = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSServerMessaging](&OBJC_CLASS___IDSFoundationLog, "IDSServerMessaging"));
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR)) {
      sub_1006A5270();
    }
  }

  -[IDSDXPCServerMessaging _handlePendingFetchBlocksForIdentifier:topic:]( self,  "_handlePendingFetchBlocksForIdentifier:topic:",  v9,  v8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)entitledForAllTopics
{
  return self->_entitledForAllTopics;
}

- (void)setEntitledForAllTopics:(BOOL)a3
{
  self->_entitledForAllTopics = a3;
}

- (NSArray)serverMessagingEntitlements
{
  return self->_serverMessagingEntitlements;
}

- (void)setServerMessagingEntitlements:(id)a3
{
}

- (NSMutableDictionary)clientContextByTopic
{
  return self->_clientContextByTopic;
}

- (void)setClientContextByTopic:(id)a3
{
}

- (NSMutableDictionary)messagesToCancelOnDeallocByTopic
{
  return self->_messagesToCancelOnDeallocByTopic;
}

- (void)setMessagesToCancelOnDeallocByTopic:(id)a3
{
}

- (NSMutableDictionary)pendingFetchMessagesWaiting
{
  return self->_pendingFetchMessagesWaiting;
}

- (void)setPendingFetchMessagesWaiting:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end