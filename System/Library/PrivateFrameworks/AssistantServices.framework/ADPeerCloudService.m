@interface ADPeerCloudService
+ (id)_pointerToBlockMap;
+ (id)_timedOutError;
+ (id)_unexpectedMessageError;
+ (id)_wrappedSendFailureError:(id)a3;
+ (id)sharedInstance;
- (BOOL)_handleRemoteExecution:(id)a3 peer:(id)a4 completion:(id)a5;
- (BOOL)hasActiveAccount;
- (id)_cachedSharedDataForUniqueId:(id)a3;
- (id)_companionPeer;
- (id)_destinationsForPeers:(id)a3;
- (id)_init;
- (id)_peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4;
- (id)_peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4;
- (id)_peers;
- (id)_service;
- (id)_uniqueIdentifierForPeer:(id)a3;
- (id)cachedSharedDataForUniqueId:(id)a3;
- (id)companionPeer;
- (id)companionPeerUniqueIdentifier;
- (id)localPeerIDSDeviceUniqueIdentifier;
- (id)peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4;
- (id)peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4;
- (id)peers;
- (id)uniqueIdentifierForPeer:(id)a3;
- (void)_airplayRouteDidChange:(id)a3;
- (void)_companionIdentifierDidChangeNotification:(id)a3;
- (void)_handleMessageResponse:(id)a3 ofType:(unsigned __int16)a4 orError:(id)a5 fromID:(id)a6 handler:(id)a7;
- (void)_notifyObserversOfRequestInfo:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_notifyObserversOfSharedData:(id)a3 fromPeer:(id)a4;
- (void)_notifyObserversOfSharedDataRequestFromPeer:(id)a3 completion:(id)a4;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 originalRequestId:(id)a5 toPeers:(id)a6 responseType:(unsigned __int16)a7 completion:(id)a8;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5 responseType:(unsigned __int16)a6 completion:(id)a7;
- (void)_setCachedSharedData:(id)a3 forUniqueId:(id)a4;
- (void)_startRemoteRequest:(id)a3 onPeers:(id)a4 completion:(id)a5;
- (void)_updateActiveAccountState;
- (void)_updateAirPlayRouteIdentifierWithCompletion:(id)a3;
- (void)getSharedDataFromPeers:(id)a3 completion:(id)a4;
- (void)sendSharedData:(id)a3 toPeers:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setRemoteRequestObserver:(id)a3 withHandle:(void *)a4;
- (void)setSharedDataObserver:(id)a3 withHandle:(void *)a4;
- (void)setSharedDataRequestObserver:(id)a3 withHandler:(void *)a4;
- (void)startListeningForRemote;
- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
@end

@implementation ADPeerCloudService

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADPeerCloudService;
  v2 = -[ADPeerCloudService init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADPeerCloudService", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100174210;
    block[3] = &unk_1004FD940;
    v10 = v2;
    dispatch_async(v7, block);
  }

  return v2;
}

- (id)_service
{
  return self->_service;
}

- (id)_destinationsForPeers:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (v4)
  {
    __int128 v37 = 0uLL;
    __int128 v38 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) idsIdentifier]);
          if (v11) {
            -[NSMutableSet addObject:](v5, "addObject:", v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }

      while (v8);
    }
  }

  else
  {
    __int128 v33 = 0uLL;
    __int128 v34 = 0uLL;
    __int128 v31 = 0uLL;
    __int128 v32 = 0uLL;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v12 devices]);

    id v13 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      v26 = v5;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v6);
          }
          v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          v18 = (void *)IDSCopyIDForDevice(v17);
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v17 modelIdentifier]);
            if (v19)
            {
              __int128 v29 = 0u;
              __int128 v30 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"AudioAccessory",  @"AppleTV",  0LL));
              id v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v28;
                while (2)
                {
                  for (k = 0LL; k != v22; k = (char *)k + 1)
                  {
                    if (*(void *)v28 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    if ([v19 hasPrefix:*(void *)(*((void *)&v27 + 1) + 8 * (void)k)])
                    {

                      -[NSMutableSet addObject:](v26, "addObject:", v18);
                      goto LABEL_29;
                    }
                  }

                  id v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }
            }

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5
{
}

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5 responseType:(unsigned __int16)a6 completion:(id)a7
{
}

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 originalRequestId:(id)a5 toPeers:(id)a6 responseType:(unsigned __int16)a7 completion:(id)a8
{
  uint64_t v9 = a7;
  uint64_t v12 = a4;
  id v41 = a3;
  id v14 = a5;
  id v42 = a6;
  uint64_t v15 = (void (**)(id, void, NSError *))a8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  LODWORD(a6) = [v16 isLostModeActive];

  if (!(_DWORD)a6)
  {
    v18 = (NSError *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _destinationsForPeers:](self, "_destinationsForPeers:", v42));
    id v19 = -[NSError count](v18, "count");
    if (!v19)
    {
      __int128 v35 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[ADPeerCloudService _sendProto:ofType:originalRequestId:toPeers:responseType:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s No place to send this", buf, 0xCu);
      }

      if (v15)
      {
        v40 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  5LL,  0LL);
        v15[2](v15, 0LL, v40);
      }

      goto LABEL_26;
    }

    id v20 = v19;
    id v21 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v41 data]);
    id v39 = [v21 initWithProtobufData:v22 type:v12 isResponse:v14 != 0];

    uint64_t v23 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
    -[NSMutableDictionary setObject:forKey:]( v23,  "setObject:forKey:",  &__kCFBooleanTrue,  IDSSendMessageOptionAllowCloudDeliveryKey);
    if (v14) {
      -[NSMutableDictionary setObject:forKey:]( v23,  "setObject:forKey:",  v14,  IDSSendMessageOptionPeerResponseIdentifierKey);
    }
    if (v15) {
      -[NSMutableDictionary setObject:forKey:]( v23,  "setObject:forKey:",  &__kCFBooleanTrue,  IDSSendMessageOptionExpectsPeerResponseKey);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
    id v45 = 0LL;
    id v46 = 0LL;
    unsigned __int8 v25 = [v24 sendProtobuf:v39 toDestinations:v18 priority:300 options:v23 identifier:&v46 error:&v45];
    id v38 = v46;
    id v37 = v45;

    if ((v25 & 1) != 0)
    {
      if (v15)
      {
        if (v38)
        {
          v26 = objc_alloc_init(&OBJC_CLASS___ADCloudResponseHandler);
          -[ADCloudResponseHandler setIdentifier:](v26, "setIdentifier:", v38);
          -[ADCloudResponseHandler setOutstandingResponses:]( v26,  "setOutstandingResponses:",  -[NSError count](v18, "count"));
          -[ADCloudResponseHandler setResponseType:](v26, "setResponseType:", v9);
          __int128 v27 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v20);
          -[ADCloudResponseHandler setResponses:](v26, "setResponses:", v27);

          -[ADCloudResponseHandler setCompletion:](v26, "setCompletion:", v15);
          objc_initWeak((id *)buf, v26);
          __int128 v28 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
          queue = self->_queue;
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_1001741A4;
          v43[3] = &unk_1004FBF48;
          v43[4] = self;
          objc_copyWeak(&v44, (id *)buf);
          __int128 v30 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v28,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v43,  300.0);
          -[ADCloudResponseHandler setTimeoutTimer:](v26, "setTimeoutTimer:", v30);
          -[AFWatchdogTimer start](v30, "start");
          completions = self->_completions;
          if (!completions)
          {
            __int128 v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int128 v34 = self->_completions;
            p_completions = &self->_completions;
            *p_completions = v32;

            completions = *p_completions;
          }

          -[NSMutableDictionary setObject:forKey:](completions, "setObject:forKey:", v26, v38);

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);
          goto LABEL_24;
        }

        goto LABEL_23;
      }
    }

    else
    {
      __int128 v36 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[ADPeerCloudService _sendProto:ofType:originalRequestId:toPeers:responseType:completion:]";
        __int16 v49 = 1024;
        int v50 = v12;
        __int16 v51 = 2114;
        id v52 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s Failed sending message type %d %{public}@",  buf,  0x1Cu);
        if (!v15) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }

      if (v15)
      {
LABEL_23:
        v26 = (ADCloudResponseHandler *)objc_claimAutoreleasedReturnValue( +[ADPeerCloudService _wrappedSendFailureError:]( &OBJC_CLASS___ADPeerCloudService,  "_wrappedSendFailureError:",  v37));
        v15[2](v15, 0LL, (NSError *)v26);
LABEL_24:
      }
    }

- (BOOL)hasActiveAccount
{
  return self->_hasActiveAccount;
}

- (id)_peers
{
  dispatch_queue_attr_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v9);
        objc_super v11 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
        uint64_t v12 = (void *)IDSCopyIDForDevice(v10);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 modelIdentifier]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 productBuildVersion]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        v16 = -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( v11,  "initWithIDSIdentifer:productType:buildVersion:name:",  v12,  v13,  v14,  v15);

        -[NSMutableSet addObject:](v3, "addObject:", v16);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)peers
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100173FD4;
  v10 = sub_100173FE4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10017416C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)uniqueIdentifierForPeer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100173FD4;
  v16 = sub_100173FE4;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100174130;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_uniqueIdentifierForPeer:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 idsIdentifier]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceForFromID:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);
    if (![v7 length])
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 uniqueID]);

      id v7 = (void *)v8;
    }
  }

  else if ([v4 hasPrefix:@"device:"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _stripFZIDPrefix]);
    uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[ADPeerCloudService _uniqueIdentifierForPeer:]";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s retrieved ID from URI: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100173FD4;
  __int128 v19 = sub_100173FE4;
  id v20 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001740F0;
  v11[3] = &unk_1004F39A8;
  id v12 = v6;
  __int16 v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)_peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)_IDSCopyIDForDeviceUniqueID(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceForFromID:v7]);

  if (v9)
  {
    id v10 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
    int v11 = (void *)IDSCopyIDForDevice(v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 productBuildVersion]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    uint64_t v15 = -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( v10,  "initWithIDSIdentifer:productType:buildVersion:name:",  v11,  v12,  v13,  v14);

    -[ADPeerInfo setIdsDeviceUniqueIdentifier:](v15, "setIdsDeviceUniqueIdentifier:", v6);
  }

  else if (v4 && [v6 length])
  {
    v16 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      __int128 v19 = "-[ADPeerCloudService _peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:]";
      __int16 v20 = 2112;
      __int128 v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Unable to find peer, creating faux element for identifier: %@",  (uint8_t *)&v18,  0x16u);
    }

    uint64_t v15 = -[ADPeerInfo initWithUniqueIdentifer:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithUniqueIdentifer:", v6);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)localPeerIDSDeviceUniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  unsigned __int8 v3 = [v2 isEndpoint];

  if ((v3 & 1) != 0) {
    return 0LL;
  }
  dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADPeerCloudService localPeerIDSDeviceUniqueIdentifier]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Fetching IDS device unique identifier for local device...",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)IDSCopyLocalDeviceUniqueID();
  id v7 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[ADPeerCloudService localPeerIDSDeviceUniqueIdentifier]";
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Fetched IDS device unique identifier %@ for local device.",  (uint8_t *)&v8,  0x16u);
  }

  return v6;
}

- (id)companionPeer
{
  uint64_t v20 = 0LL;
  __int128 v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100173FD4;
  v24 = sub_100173FE4;
  id v25 = 0LL;
  uint64_t v3 = AFIsHorseman(self, a2);
  if ((_DWORD)v3)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001740B8;
    block[3] = &unk_1004FCDB0;
    void block[4] = self;
    void block[5] = &v20;
    dispatch_sync(queue, block);
  }

  else if (AFIsNano(v3))
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService peers](self, "peers", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
          int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 idsIdentifier]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceForFromID:v11]);

          if ([v12 isDefaultPairedDevice])
          {
            objc_storeStrong(v21 + 5, v9);

            goto LABEL_14;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v26 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)_companionPeer
{
  uint64_t v3 = -[NSString length](self->_companionIdentifier, "length");
  if (v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[ADPeerCloudService _peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:]( self,  "_peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:",  self->_companionIdentifier,  0LL));
  }
  return v3;
}

- (id)companionPeerUniqueIdentifier
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100173FD4;
  __int16 v10 = sub_100173FE4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100174068;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v15 = 0LL;
    __int128 v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    __int128 v18 = sub_100173FD4;
    __int128 v19 = sub_100173FE4;
    id v20 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100174028;
    v11[3] = &unk_1004F39A8;
    id v13 = &v15;
    v11[4] = self;
    id v12 = v6;
    BOOL v14 = a4;
    dispatch_sync(queue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)_peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceUniqueIdentifierForDeviceWithAssistantId:v6]);

  if (v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADPeerCloudService _peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:]( self,  "_peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:",  v8,  v4));
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)cachedSharedDataForUniqueId:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    uint64_t v15 = sub_100173FD4;
    __int128 v16 = sub_100173FE4;
    id v17 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100173FEC;
    block[3] = &unk_1004FBE80;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_cachedSharedDataForUniqueId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4) {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerSharedData, "objectForKey:", v4));
  }
  else {
    dispatch_queue_t v5 = 0LL;
  }

  return v5;
}

- (void)_setCachedSharedData:(id)a3 forUniqueId:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    peerSharedData = self->_peerSharedData;
    id v8 = v11;
    if (v11)
    {
      if (!peerSharedData)
      {
        id v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        id v10 = self->_peerSharedData;
        self->_peerSharedData = v9;

        id v8 = v11;
        peerSharedData = self->_peerSharedData;
      }

      -[NSMutableDictionary setObject:forKey:](peerSharedData, "setObject:forKey:", v8, v6);
    }

    else
    {
      -[NSMutableDictionary removeObjectForKey:](peerSharedData, "removeObjectForKey:", v6);
    }
  }
}

- (void)_updateActiveAccountState
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_service, "accounts", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
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
        if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) isActive])
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)_companionIdentifierDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    __int128 v11 = "-[ADPeerCloudService _companionIdentifierDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (AFIsHorseman(v6, v7))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100173F58;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_airplayRouteDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADPeerCloudService _airplayRouteDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100173F4C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateAirPlayRouteIdentifierWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v11 = "-[ADPeerCloudService _updateAirPlayRouteIdentifierWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (AFSupportsAirPlayEndpointRoute(v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFMediaRemoteDeviceInfo currentDevice](&OBJC_CLASS___AFMediaRemoteDeviceInfo, "currentDevice"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100173DC4;
    v8[3] = &unk_1004FCFD8;
    v8[4] = self;
    __int128 v9 = v4;
    [v7 getRouteIdentifierWithCompletion:v8];
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)sendSharedData:(id)a3 toPeers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADPeerCloudService sendSharedData:toPeers:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100173D74;
    block[3] = &unk_1004FD4C0;
    id v11 = v6;
    __int128 v12 = self;
    id v13 = v7;
    dispatch_async(queue, block);
  }
}

- (void)setSharedDataObserver:(id)a3 withHandle:(void *)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[ADPeerCloudService setSharedDataObserver:withHandle:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100173CFC;
  block[3] = &unk_1004FB930;
  void block[4] = self;
  id v11 = v6;
  __int128 v12 = a4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)_notifyObserversOfSharedData:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[ADPeerCloudService _notifyObserversOfSharedData:fromPeer:]";
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _uniqueIdentifierForPeer:](self, "_uniqueIdentifierForPeer:", v7));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 assistantId]);
  __int128 v12 = (void *)v10;
  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    [v13 _setAssistantId:v12 forDeviceWithIdsDeviceUniqueIdentifier:v9];
  }

  int v14 = AFIsHorseman(v10, v11);
  if (v6 && v14) {
    -[ADPeerCloudService _setCachedSharedData:forUniqueId:](self, "_setCachedSharedData:forUniqueId:", v6, v9);
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_sharedDataObservers, "objectEnumerator", 0LL));
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      __int128 v19 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8LL * (void)v19) + 16LL))();
        __int128 v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v17);
  }
}

- (void)getSharedDataFromPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADPeerCloudService getSharedDataFromPeers:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001739BC;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)setSharedDataRequestObserver:(id)a3 withHandler:(void *)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100173944;
  block[3] = &unk_1004FB930;
  void block[4] = self;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_notifyObserversOfSharedDataRequestFromPeer:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  id v6 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v32 = "-[ADPeerCloudService _notifyObserversOfSharedDataRequestFromPeer:completion:]";
    __int16 v33 = 2112;
    id v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  id v8 = dispatch_group_create();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_sharedDataRequestObservers, "objectEnumerator"));
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v13);
        dispatch_group_enter(v8);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1001737C0;
        v23[3] = &unk_1004F39F8;
        v23[4] = self;
        v24 = v7;
        id v25 = v8;
        (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v19, v23);

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v11);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017386C;
  block[3] = &unk_1004FD990;
  __int128 v21 = v7;
  id v22 = v18;
  id v16 = v18;
  __int16 v17 = v7;
  dispatch_group_notify(v8, queue, block);
}

- (void)_startRemoteRequest:(id)a3 onPeers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v30 = "-[ADPeerCloudService _startRemoteRequest:onPeers:completion:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  if (v8)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001734F0;
    v19[3] = &unk_1004FDA30;
    __int128 v20 = (NSMutableDictionary *)v8;
    __int128 v21 = self;
    id v22 = v9;
    id v23 = v10;
    dispatch_async(queue, v19);

    id v13 = v20;
LABEL_14:

    goto LABEL_15;
  }

  if (v10)
  {
    id v13 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v9 count]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v14 = v9;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        id v18 = 0LL;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  &__kCFBooleanFalse,  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v18));
          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v16);
    }

    (*((void (**)(id, NSMutableDictionary *))v10 + 2))(v10, v13);
    goto LABEL_14;
  }

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100173494;
    v13[3] = &unk_1004FC7E8;
    id v14 = v11;
    -[ADPeerCloudService _startRemoteRequest:onPeers:completion:]( self,  "_startRemoteRequest:onPeers:completion:",  v8,  v12,  v13);
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315650;
    __int128 v21 = "-[ADPeerCloudService startRemoteExecution:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]";
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v20, 0x20u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 plistData]);
  -[ADPeerCloudService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:]( self,  "startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:",  v19,  v14,  v10,  0LL,  v15,  v16);
}

- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void (**)(id, void, NSError *))a8;
  id v16 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v35 = "-[ADPeerCloudService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  if (!v12)
  {
    __int128 v26 = (NSError *)objc_claimAutoreleasedReturnValue( +[ADPeerCloudService _unexpectedMessageError]( &OBJC_CLASS___ADPeerCloudService,  "_unexpectedMessageError"));
LABEL_10:
    id v25 = v26;
    v15[2](v15, 0LL, v26);
    goto LABEL_11;
  }

  if (!v13)
  {
    __int128 v26 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  5LL,  0LL);
    goto LABEL_10;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 componentsSeparatedByString:@"-"]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

  __int128 v21 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v35 = "-[ADPeerCloudService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s #hal1 (%@) send command to peer: %@",  buf,  0x20u);
  }

  uint64_t v22 = mach_absolute_time();
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v22);
  queue = (dispatch_queue_s *)self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100172F14;
  v27[3] = &unk_1004F3A98;
  id v28 = v12;
  __int128 v29 = self;
  uint64_t v33 = Milliseconds;
  id v30 = v13;
  id v31 = v20;
  id v32 = v15;
  id v25 = v20;
  dispatch_async(queue, v27);

LABEL_11:
}

- (void)startListeningForRemote
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADPeerCloudService startListeningForRemote]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADPeerCloudService setRemoteRequestObserver:withHandle:]( self,  "setRemoteRequestObserver:withHandle:",  &stru_1004F3AD8,  &unk_100577F98);
}

- (void)setRemoteRequestObserver:(id)a3 withHandle:(void *)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100172C78;
  block[3] = &unk_1004FB930;
  void block[4] = self;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_notifyObserversOfRequestInfo:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v8 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v35 = "-[ADPeerCloudService _notifyObserversOfRequestInfo:fromPeer:completion:]";
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2112;
    id v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  id v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  id v10 = dispatch_group_create();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_remoteRequestObservers, "objectEnumerator"));
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v15);
        dispatch_group_enter(v10);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100172B18;
        v26[3] = &unk_1004FB548;
        v26[4] = self;
        __int128 v27 = v9;
        id v28 = v10;
        (*(void (**)(uint64_t, id, id, void *))(v16 + 16))(v16, v22, v21, v26);

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v13);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100172BB0;
  block[3] = &unk_1004FD990;
  __int16 v24 = v9;
  id v25 = v20;
  id v18 = v20;
  id v19 = v9;
  dispatch_group_notify(v10, queue, block);
}

- (BOOL)_handleRemoteExecution:(id)a3 peer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[ADPeerCloudService _handleRemoteExecution:peer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unsigned int v12 = [v8 hasContent];
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 sourceIDSFirstRoutableDestination]);
    [v9 setIdsFirstRoutableDestination:v13];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 assistantId]);
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _uniqueIdentifierForPeer:](self, "_uniqueIdentifierForPeer:", v9));
      [v15 _setAssistantId:v14 forDeviceWithIdsDeviceUniqueIdentifier:v16];
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithPlistData:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithPlistData:",  v17));

    id v19 = (void *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = AceObjectClassPListKey;
      id v21 = v19;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v20]);
      *(_DWORD *)buf = 136315650;
      id v28 = "-[ADPeerCloudService _handleRemoteExecution:peer:completion:]";
      __int16 v29 = 2112;
      __int128 v30 = v22;
      __int16 v31 = 2112;
      __int128 v32 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s got remote execution command: %@ -> %@",  buf,  0x20u);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10017296C;
    v25[3] = &unk_1004FC7C0;
    id v26 = v10;
    [v23 executeCommand:v18 fromPeer:v9 remoteExecutionInfo:0 reply:v25];
  }

  return v12;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v19 = [v18 isLostModeActive];

  if (v19)
  {
    uint64_t v20 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Dropping incoming message because Lost Mode is active",  buf,  0xCu);
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerCloudService _service](self, "_service"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceForFromID:v15]);

    if (v22)
    {
      unsigned int v43 = [v14 type];
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v16 incomingResponseIdentifier]);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v16 outgoingResponseIdentifier]);
      unsigned int v40 = [v16 expectsPeerResponse];
      __int16 v24 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316418;
        v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v49 = 1024;
        unsigned int v50 = v43;
        __int16 v51 = 2112;
        id v52 = v15;
        __int16 v53 = 2112;
        uint64_t v54 = v23;
        __int16 v55 = 2112;
        v56 = v44;
        __int16 v57 = 1024;
        unsigned int v58 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Type %d from %@. Incoming %@ Outgoing %@ Expects Response %d",  buf,  0x36u);
      }

      id v42 = (void *)v23;
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completions, "objectForKey:", v23));
      if (v25)
      {
        -[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]( self,  "_handleMessageResponse:ofType:orError:fromID:handler:",  v14,  v43,  0LL,  v15,  v25);
      }

      else
      {
        id v38 = v13;
        id v39 = v12;
        id v37 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
        __int16 v36 = (void *)IDSCopyIDForDevice(v22);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v22 modelIdentifier]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 productBuildVersion]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
        __int128 v30 = -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( v37,  "initWithIDSIdentifer:productType:buildVersion:name:",  v36,  v27,  v28,  v29);

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_1001728C0;
        v45[3] = &unk_1004F3B00;
        char v46 = v40;
        v45[4] = self;
        v45[5] = v44;
        id v41 = v30;
        v45[6] = v30;
        __int16 v31 = objc_retainBlock(v45);
        __int128 v32 = (objc_class *)sub_100172884(v43);
        if (v32)
        {
          id v33 = objc_alloc(v32);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);
          id v35 = [v33 initWithData:v34];

          __int128 v30 = v41;
          objc_msgSend(v35, "_ad_performWithCloudService:fromPeer:completion:", self, v41, v31);
        }

        else
        {
          id v35 = (id)objc_claimAutoreleasedReturnValue( +[ADPeerCloudService _unexpectedMessageError]( &OBJC_CLASS___ADPeerCloudService,  "_unexpectedMessageError"));
          ((void (*)(void *, void, uint64_t, id))v31[2])(v31, 0LL, 0xFFFFLL, v35);
        }

        id v13 = v38;

        id v12 = v39;
      }
    }

    else
    {
      id v26 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Dropping incoming message with unknown sender",  buf,  0xCu);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  unsigned int v19 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    id v22 = "-[ADPeerCloudService service:account:identifier:didSendWithSuccess:error:context:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v21, 0xCu);
  }

  if (!a6)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completions, "objectForKey:", v16));
    if (v20) {
      -[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]( self,  "_handleMessageResponse:ofType:orError:fromID:handler:",  0LL,  0xFFFFLL,  v17,  0LL,  v20);
    }
  }
}

- (void)_handleMessageResponse:(id)a3 ofType:(unsigned __int16)a4 orError:(id)a5 fromID:(id)a6 handler:(id)a7
{
  int v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v15) {
    goto LABEL_7;
  }
  id v16 = v13;
  if (v16) {
    goto LABEL_3;
  }
  if ([v15 responseType] != v10)
  {
    id v26 = (void *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      id v39 = v26;
      int v40 = 136315650;
      id v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
      __int16 v42 = 1024;
      *(_DWORD *)unsigned int v43 = [v15 responseType];
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s Response class is %d doesn't match %d",  (uint8_t *)&v40,  0x18u);
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue( +[ADPeerCloudService _unexpectedMessageError]( &OBJC_CLASS___ADPeerCloudService,  "_unexpectedMessageError"));
    if (v16)
    {
LABEL_3:
      [v15 outstandingResponses];
LABEL_4:
      id v17 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v40 = 136315138;
        id v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Completing request", (uint8_t *)&v40, 0xCu);
      }

      id v18 = objc_alloc(&OBJC_CLASS___NSSet);
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v15 responses]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
      int v21 = -[NSSet initWithArray:](v18, "initWithArray:", v20);

      id v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v15 completion]);
      ((void (**)(void, NSSet *, id))v22)[2](v22, v21, v16);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v15 timeoutTimer]);
      [v23 cancelIfNotAlreadyCanceled];

      completions = self->_completions;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      -[NSMutableDictionary removeObjectForKey:](completions, "removeObjectForKey:", v25);

      goto LABEL_7;
    }
  }

  __int128 v27 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v40 = 136315394;
    id v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
    __int16 v42 = 1024;
    *(_DWORD *)unsigned int v43 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Handling response of type %d",  (uint8_t *)&v40,  0x12u);
  }

  id v28 = objc_alloc_init(&OBJC_CLASS___ADPeerResponse);
  __int16 v29 = -[ADPeerInfo initWithIDSIdentifer:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithIDSIdentifer:", v14);
  -[ADPeerResponse setPeer:](v28, "setPeer:", v29);
  id v30 = objc_alloc((Class)sub_100172884(v10));
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
  id v32 = [v30 initWithData:v31];

  -[ADPeerResponse setProto:](v28, "setProto:", v32);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 responses]);
  id v34 = v33;
  if (v14)
  {
    [v33 setObject:v28 forKey:v14];
  }

  else
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v34 setObject:v28 forKey:v35];
  }

  objc_msgSend(v15, "setOutstandingResponses:", (char *)objc_msgSend(v15, "outstandingResponses") - 1);
  id v36 = [v15 outstandingResponses];
  if ((uint64_t)v36 <= 0)
  {
    id v16 = 0LL;
    goto LABEL_4;
  }

  id v37 = v36;
  id v38 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v40 = 136315394;
    id v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
    __int16 v42 = 2048;
    *(void *)unsigned int v43 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s %ld responses remaining",  (uint8_t *)&v40,  0x16u);
  }

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = 136315394;
    id v9 = "-[ADPeerCloudService service:activeAccountsChanged:]";
    __int16 v10 = 2048;
    id v11 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %lu accounts", (uint8_t *)&v8, 0x16u);
  }

  -[ADPeerCloudService _updateActiveAccountState](self, "_updateActiveAccountState");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)AFSiriLogContextIDS;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO);
  if (v9)
  {
    id v11 = v8;
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADPeerCloudService service:devicesChanged:]";
    __int16 v18 = 2048;
    id v19 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %lu devices", buf, 0x16u);
  }

  if (AFIsHorseman(v9, v10))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001725BC;
    v13[3] = &unk_1004FD968;
    id v14 = v7;
    id v15 = self;
    dispatch_async(queue, v13);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100577F90 != -1) {
    dispatch_once(&qword_100577F90, &stru_1004F3980);
  }
  return (id)qword_100577F88;
}

+ (id)_unexpectedMessageError
{
  return  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  0LL,  0LL);
}

+ (id)_timedOutError
{
  return  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  6LL,  0LL);
}

+ (id)_wrappedSendFailureError:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v5 = v4;
  if (v3)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    id v10 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  3LL,  v6);
  }

  else
  {
    id v7 = -[NSError initWithDomain:code:userInfo:]( v4,  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  3LL,  0LL);
  }

  return v7;
}

+ (id)_pointerToBlockMap
{
  return  -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  1282LL,  0LL,  1LL);
}

@end