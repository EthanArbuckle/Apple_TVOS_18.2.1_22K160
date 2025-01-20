@interface DDIDSService
- (BOOL)_sendIDSMessage:(id)a3;
- (BOOL)hasDestination:(id)a3;
- (DAIDSMessageReceiver)receiver;
- (DDIDSService)initWithServiceType:(int64_t)a3;
- (IDSService)service;
- (NSMutableDictionary)messageStorage;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_destinationFromID:(id)a3;
- (id)_selfTokenFromID:(id)a3;
- (int64_t)type;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMessageStorage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setService:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation DDIDSService

- (DDIDSService)initWithServiceType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DDIDSService;
  v3 = -[DDIDSService init](&v11, "init", a3);
  if (v3)
  {
    v4 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.iosdiagnostics");
    service = v3->_service;
    v3->_service = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Diagnostics.IDSDelegateQueue", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    -[IDSService addDelegate:queue:](v3->_service, "addDelegate:queue:", v3, v3->_queue);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    messageStorage = v3->_messageStorage;
    v3->_messageStorage = v8;
  }

  return v3;
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = -[DDIDSOutgoingMessage initWithDestination:message:data:forceLocalDelivery:expectsResponse:response:]( objc_alloc(&OBJC_CLASS___DDIDSOutgoingMessage),  "initWithDestination:message:data:forceLocalDelivery:expectsResponse:response:",  v15,  v17,  v16,  v9,  v8,  v14);

  -[DDIDSService _sendIDSMessage:](self, "_sendIDSMessage:", v18);
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);

  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      objc_super v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[DAIDSDestination initWithIDSDevice:]( objc_alloc(&OBJC_CLASS___DAIDSDestination),  "initWithIDSDevice:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)v11));
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        objc_super v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 linkedDevicesWithRelationship:2]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v19);
        v21 = objc_alloc(&OBJC_CLASS___DAIDSDestination);
        v22 = -[DAIDSDestination initWithIDSDevice:](v21, "initWithIDSDevice:", v20, (void)v24);
        -[NSMutableArray addObject:](v5, "addObject:", v22);

        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v17);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  v4[2](v4, v23);
}

- (BOOL)hasDestination:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 linkedDevicesWithRelationship:2]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 devices]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v6]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend( v4,  "isEqual:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)i),  (void)v15))
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (BOOL)_sendIDSMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 peerResponseIdentifier]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 peerResponseIdentifier]);
    [v5 setObject:v7 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 expectsResponse]));
  [v5 setObject:v8 forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];

  [v5 setObject:&off_1000197C8 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionary]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDestination]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
  id v33 = 0LL;
  id v34 = 0LL;
  unsigned int v14 = [v9 sendMessage:v10 toDestinations:v13 priority:300 options:v5 identifier:&v34 error:&v33];
  id v15 = v34;
  id v28 = v33;

  if (v14)
  {
    __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DDIDSService queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000D368;
    block[3] = &unk_100018960;
    id v17 = v4;
    __int128 v30 = (void (**)(void, void, void, void, void))v17;
    id v18 = v15;
    id v31 = v18;
    v32 = self;
    dispatch_async(v16, block);

    uint64_t v19 = DiagnosticLogHandleForCategory(7LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v17 peerResponseIdentifier]);
      *(_DWORD *)buf = 138412802;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 2112;
      id v40 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] > Outgoing message: %@, peer response identifier: %@",  buf,  0x20u);
    }

    v22 = v30;
    v23 = v28;
    goto LABEL_11;
  }

  uint64_t v24 = DiagnosticLogHandleForCategory(7LL);
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  v23 = v28;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2112;
    id v40 = v28;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[%@] Failed to send IDS message: %@, error: %@",  buf,  0x20u);
  }

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);
  if (v26)
  {
    v22 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue([v4 response]);
    ((void (**)(void, void, id, void, void))v22)[2](v22, 0LL, v28, 0LL, 0LL);
LABEL_11:
  }

  return v14;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService messageStorage](self, "messageStorage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);

  uint64_t v14 = DiagnosticLogHandleForCategory(7LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      int v25 = 138413058;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      __int128 v30 = v17;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Did send message %@, success: %@, error: %@",  (uint8_t *)&v25,  0x2Au);
    }

    if (v8)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService messageStorage](self, "messageStorage"));
      [v18 removeObjectForKey:v10];
      goto LABEL_16;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService messageStorage](self, "messageStorage"));
    [v19 removeObjectForKey:v10];

    objc_msgSend(v13, "setRetryCount:", (char *)objc_msgSend(v13, "retryCount") - 1);
    uint64_t v20 = (uint64_t)[v13 retryCount];
    uint64_t v21 = DiagnosticLogHandleForCategory(7LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
    BOOL v22 = os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR);
    if (v20 < 1)
    {
      if (v22) {
        sub_10000ECDC(v13, (uint64_t)v11, (os_log_s *)v18);
      }
LABEL_16:

      v23 = (void *)objc_claimAutoreleasedReturnValue([v13 response]);
      if (v23)
      {
        uint64_t v24 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue([v13 response]);
        ((void (**)(void, BOOL, id, void, void))v24)[2](v24, v8, v11, 0LL, 0LL);
      }

      goto LABEL_18;
    }

    if (v22) {
      sub_10000EC5C(v13);
    }

    -[DDIDSService _sendIDSMessage:](self, "_sendIDSMessage:", v13);
  }

  else
  {
    if (v16)
    {
      int v25 = 138412290;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Invalid outgoing message",  (uint8_t *)&v25,  0xCu);
    }
  }

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService _destinationFromID:](self, "_destinationFromID:", v11));
  if (v13)
  {
    uint64_t v14 = -[DDIDSIncomingMessage initWithIncomingDictionary:destination:]( objc_alloc(&OBJC_CLASS___DDIDSIncomingMessage),  "initWithIncomingDictionary:destination:",  v10,  v13);
    if (!v14)
    {
      uint64_t v26 = DiagnosticLogHandleForCategory(7LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
        *(_DWORD *)buf = 138412546;
        v46 = v27;
        __int16 v47 = 2112;
        id v48 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Invalid incoming message: %@",  buf,  0x16u);
      }

      goto LABEL_20;
    }

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 incomingResponseIdentifier]);
    if (v15)
    {
      uint64_t v16 = DiagnosticLogHandleForCategory(7LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v15;
        __int16 v47 = 2112;
        id v48 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] < Incoming response message: %@",  buf,  0x16u);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService messageStorage](self, "messageStorage"));
      uint64_t v19 = (DDIDSIncomingMessage *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v15]);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService messageStorage](self, "messageStorage"));
      [v20 removeObjectForKey:v15];

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage response](v19, "response"));
      if (v21)
      {
        BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage response](v19, "response"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage message](v14, "message"));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage data](v14, "data"));
        (*((void (**)(os_log_s *, uint64_t, void, void *, void *))v22 + 2))(v22, 1LL, 0LL, v23, v24);
      }

      else
      {
        uint64_t v37 = DiagnosticLogHandleForCategory(7LL);
        BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[%@] No response handler for message. Dropping response.",  buf,  0xCu);
        }
      }
    }

    else
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService receiver](self, "receiver"));
      char v29 = objc_opt_respondsToSelector(v28, "receiveMessage:data:fromDestination:expectsResponse:response:");

      if ((v29 & 1) == 0)
      {
LABEL_20:

        goto LABEL_21;
      }

      uint64_t v30 = DiagnosticLogHandleForCategory(7LL);
      __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 expectsPeerResponse]));
        *(_DWORD *)buf = 138412802;
        v46 = v32;
        __int16 v47 = 2112;
        id v48 = v10;
        __int16 v49 = 2112;
        v50 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[%@] < New incoming message: %@, expects response: %@",  buf,  0x20u);
      }

      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService receiver](self, "receiver"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage message](v14, "message"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage data](v14, "data"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage destination](v14, "destination"));
      unsigned int v38 = [v12 expectsPeerResponse];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10000DAEC;
      v40[3] = &unk_100018988;
      v41 = v14;
      id v42 = v12;
      id v43 = v10;
      v44 = self;
      [v39 receiveMessage:v34 data:v35 fromDestination:v36 expectsResponse:v38 response:v40];

      uint64_t v19 = v41;
    }

    goto LABEL_20;
  }

  uint64_t v25 = DiagnosticLogHandleForCategory(7LL);
  uint64_t v14 = (DDIDSIncomingMessage *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
    sub_10000ED94(v12);
  }
LABEL_21:
}

- (id)_destinationFromID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService _selfTokenFromID:](self, "_selfTokenFromID:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 linkedDevicesWithRelationship:2]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 devices]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v6]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
      uint64_t v16 = (void *)IDSCopyForDevice(v15);
      unsigned __int8 v17 = objc_msgSend(v16, "isEqualToString:", v4, (void)v21);

      if ((v17 & 1) != 0) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v18 = v15;

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v19 = -[DAIDSDestination initWithIDSDevice:](objc_alloc(&OBJC_CLASS___DAIDSDestination), "initWithIDSDevice:", v18);
  }

  else
  {
LABEL_9:

    id v18 = 0LL;
LABEL_12:
    uint64_t v19 = 0LL;
  }

  return v19;
}

- (id)_selfTokenFromID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (([v3 containsString:@"self-token:"] & 1) == 0)
  {
    id v5 = [v3 mutableCopy];
    objc_msgSend( v5,  "replaceOccurrencesOfString:withString:options:range:",  @"token",  @"self-token",  1,  0,  objc_msgSend(v5, "length"));
    id v4 = [v5 copy];
  }

  return v4;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSService service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3));

  return (NSString *)v4;
}

- (DAIDSMessageReceiver)receiver
{
  return (DAIDSMessageReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)messageStorage
{
  return self->_messageStorage;
}

- (void)setMessageStorage:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end