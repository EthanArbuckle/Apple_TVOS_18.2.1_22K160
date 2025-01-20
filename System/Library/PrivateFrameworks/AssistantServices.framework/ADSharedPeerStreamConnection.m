@interface ADSharedPeerStreamConnection
+ (id)_deviceConnectionClosedErrorWithUnderlyingError:(id)a3;
+ (id)_errorWithCode:(int64_t)a3 underylingError:(id)a4;
+ (id)_noDeviceError;
+ (id)_noNearbyPeerError;
+ (id)_streamPairInterruptedError;
+ (id)sharedPeerStreamConnectionWithServiceIdentifier:(id)a3 listener:(BOOL)a4;
- (BOOL)deviceIsNearby;
- (BOOL)hasNearbyPeer;
- (BOOL)peerSupportsExtendedHeader;
- (id)_account;
- (id)_destination;
- (id)_failureMetricsContextDictionary;
- (id)_initWithServiceIdentifier:(id)a3 listener:(BOOL)a4;
- (id)_pairedDevice;
- (id)_service;
- (void)_close;
- (void)_establishEagerStreamPair;
- (void)_getSocketFromDevice;
- (void)_getSocketFromDeviceForStreamIdentifier:(id)a3;
- (void)_handleGetMetricsMessage:(id)a3 context:(id)a4;
- (void)_handleReestablishMessage:(id)a3 context:(id)a4;
- (void)_handleResponseProtobuf:(id)a3 forIdentifier:(id)a4;
- (void)_handleWakeUpMessage:(id)a3 context:(id)a4;
- (void)_initiateOptimisticEagerStreamFetchRetry;
- (void)_invokeMetricsCompletionWithMetrics:(id)a3 forIdentifier:(id)a4;
- (void)_invokeSocketCompletionWithCurrentSocketOrError:(id)a3;
- (void)_preheat;
- (void)_requestStreamEstablishment;
- (void)_setPreferBTClassic:(BOOL)a3;
- (void)_updatePairedDeviceInfo;
- (void)addDelegate:(id)a3;
- (void)closeForConnection:(id)a3;
- (void)getAWDMetrics:(id)a3 completion:(id)a4;
- (void)getMetricsContext:(id)a3;
- (void)getRemoteMetrics:(id)a3;
- (void)getSocketForConnection:(id)a3 completion:(id)a4;
- (void)preheat;
- (void)removeDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setPreferBTClassic:(BOOL)a3;
@end

@implementation ADSharedPeerStreamConnection

- (id)_initWithServiceIdentifier:(id)a3 listener:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"ADPeerStreamConnection.m", 130, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___ADSharedPeerStreamConnection;
  id v8 = -[ADSharedPeerStreamConnection init](&v26, "init");
  if (v8)
  {
    id v9 = [v7 copy];
    v10 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v11 systemUptime];
    *((double *)v8 + 18) = v12 + -3600.0;

    v13 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);

    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UNSPECIFIED, 0);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);

    dispatch_queue_t v20 = dispatch_queue_create_with_target_V2("ADPeerStreamConnection", v19, v13);
    v21 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v20;

    v22 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", *((void *)v8 + 3));
    v23 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v22;

    [*((id *)v8 + 5) addDelegate:v8 queue:*((void *)v8 + 4)];
    *((_BYTE *)v8 + 8) = a4;
    *((_DWORD *)v8 + 22) = -1;
    [v8 _updatePairedDeviceInfo];
    [v8 _requestStreamEstablishment];
    dispatch_activate(*((dispatch_object_t *)v8 + 4));
  }

  return v8;
}

- (id)_service
{
  return self->_idsService;
}

- (id)_pairedDevice
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _service](self, "_service", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

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
        if ([v7 isDefaultPairedDevice])
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

- (id)_account
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_idsService, "accounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 anyObject]);

  return v3;
}

- (id)_destination
{
  v2 = (void *)qword_100577A58;
  if (!qword_100577A58)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
    id v4 = (void *)qword_100577A58;
    qword_100577A58 = v3;

    v2 = (void *)qword_100577A58;
  }

  return v2;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000710E0;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000710D4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_initiateOptimisticEagerStreamFetchRetry
{
  if (self->_optimisticRetriesAreBlocked)
  {
    self->_optimisticRetriesAreBlocked = 1;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100070FFC;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(queue, block);
  }

  else
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[ADSharedPeerStreamConnection _initiateOptimisticEagerStreamFetchRetry]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Denying optimistic retry as we haven't vended socket since the last time.",  buf,  0xCu);
    }
  }

- (void)getSocketForConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070E2C;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_getSocketFromDevice
{
  if (self->_listener && !self->_peerSupportsNamedStreams) {
    -[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]( self,  "_getSocketFromDeviceForStreamIdentifier:",  0LL);
  }
}

- (void)_getSocketFromDeviceForStreamIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  -[ADSharedPeerStreamConnection _close](self, "_close");
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_100513150, IDSOpenSocketOptionTransportKey);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_100513168, IDSOpenSocketOptionPriorityKey);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_100513150, IDSOpenSocketOptionScopeKey);
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v4, IDSOpenSocketOptionStreamNameKey);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _pairedDevice](self, "_pairedDevice"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s no nearby device; returning immediately",
        buf,
        0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[ADSharedPeerStreamConnection _noNearbyPeerError]( &OBJC_CLASS___ADSharedPeerStreamConnection,  "_noNearbyPeerError"));
  }

  else
  {
    __int128 v11 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s No Paired device returning immediately",  buf,  0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[ADSharedPeerStreamConnection _noDeviceError](&OBJC_CLASS___ADSharedPeerStreamConnection, "_noDeviceError"));
  }

  id v12 = (void *)v10;
  if (!v10)
  {
LABEL_17:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v27 = sub_100070A14;
    v28 = sub_100070A24;
    id v29 = 0LL;
    self->_gettingDeviceSocket = 1;
    currentStreamIdentifier = self->_currentStreamIdentifier;
    self->_currentStreamIdentifier = 0LL;

    self->_socketForConnectionHasBeenVended = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v14 systemUptime];
    uint64_t v16 = v15;

    v17 = objc_alloc(&OBJC_CLASS___IDSDeviceConnection);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100070A2C;
    v21[3] = &unk_1004EEF30;
    id v22 = v4;
    v23 = self;
    v24 = buf;
    uint64_t v25 = v16;
    id v18 = -[IDSDeviceConnection initSocketWithDevice:options:completionHandler:queue:]( v17,  "initSocketWithDevice:options:completionHandler:queue:",  v8,  v6,  v21,  self->_queue);
    deviceConnection = self->_deviceConnection;
    p_deviceConnection = (id *)&self->_deviceConnection;
    id *p_deviceConnection = v18;

    objc_storeStrong((id *)(*(void *)&buf[8] + 40LL), *p_deviceConnection);
    _Block_object_dispose(buf, 8);

    goto LABEL_18;
  }

  -[ADSharedPeerStreamConnection _invokeSocketCompletionWithCurrentSocketOrError:]( self,  "_invokeSocketCompletionWithCurrentSocketOrError:",  v10);
  objc_storeWeak((id *)&self->_currentPeerStreamConnection, 0LL);

LABEL_18:
}

- (void)_invokeSocketCompletionWithCurrentSocketOrError:(id)a3
{
  id v4 = a3;
  if (self->_socketCompletion)
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[ADSharedPeerStreamConnection _invokeSocketCompletionWithCurrentSocketOrError:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
    }

    if (v4)
    {
      id v6 = 0LL;
    }

    else
    {
      id v6 = self->_deviceConnection;
      deviceConnection = self->_deviceConnection;
      self->_deviceConnection = 0LL;

      self->_gettingDeviceSocket = 0;
      self->_sockfd = -1;
    }

    (*((void (**)(void))self->_socketCompletion + 2))();
    id socketCompletion = self->_socketCompletion;
    self->_id socketCompletion = 0LL;

    self->_socketForConnectionHasBeenVended = 1;
    self->_optimisticRetriesAreBlocked = 0;
  }
}

- (void)closeForConnection:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007085C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_close
{
  if (self->_deviceConnection)
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADSharedPeerStreamConnection _close]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
    }

    int sockfd = self->_sockfd;
    if (sockfd != -1)
    {
      close(sockfd);
      self->_int sockfd = -1;
    }

    self->_gettingDeviceSocket = 0;
    -[IDSDeviceConnection close](self->_deviceConnection, "close");
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = 0LL;
  }

- (void)getRemoteMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000703F0;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getAWDMetrics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000703B4;
    block[3] = &unk_1004FD9E0;
    id v10 = v6;
    __int128 v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)_invokeMetricsCompletionWithMetrics:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_metricsResponses, "objectForKey:", v6));
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_metricsResponses, "removeObjectForKey:", v6);
}

- (void)_requestStreamEstablishment
{
  if (self->_listener && self->_peerSupportsNamedStreams)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastKnownProxyStreamId]);

    uint64_t v5 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ADSharedPeerStreamConnection _requestStreamEstablishment]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    if (v4)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS____ADPBProxyReestablishRequest);
      -[_ADPBProxyReestablishRequest setLastKnownStreamId:](v6, "setLastKnownStreamId:", v4);
      id v7 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyReestablishRequest data](v6, "data"));
      id v9 = objc_msgSend( v7,  "initWithProtobufData:type:isResponse:",  v8,  objc_msgSend((id)objc_opt_class(v6), "_ADPBProxyRequestType"),  0);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _service](self, "_service"));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _destination](self, "_destination"));
      v19[0] = IDSSendMessageOptionTimeoutKey;
      v19[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v20[0] = &off_100513180;
      v20[1] = &__kCFBooleanTrue;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
      id v17 = 0LL;
      id v18 = 0LL;
      unsigned __int8 v13 = [v10 sendProtobuf:v9 toDestinations:v11 priority:300 options:v12 identifier:&v18 error:&v17];
      id v14 = v18;
      id v15 = v17;

      if ((v13 & 1) == 0)
      {
        uint64_t v16 = (os_log_s *)AFSiriLogContextIDS;
        if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v22 = "-[ADSharedPeerStreamConnection _requestStreamEstablishment]";
          __int16 v23 = 2114;
          id v24 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Reestablish message failed %{public}@",  buf,  0x16u);
        }
      }
    }
  }

- (BOOL)hasNearbyPeer
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007036C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPreferBTClassic:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007035C;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_setPreferBTClassic:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADSharedPeerStreamConnection _setPreferBTClassic:]";
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (!self->_prefersBTClassic && v3)
  {
    idsService = self->_idsService;
    uint64_t v14 = IDSLinkPreferenceOptionPacketsPerSecondKey;
    id v15 = &off_100513198;
    BOOL v10 = 1;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    -[IDSService setLinkPreferences:](idsService, "setLinkPreferences:", v11);
LABEL_13:

    self->_prefersBTClassic = v10;
    return;
  }

  if (self->_prefersBTClassic && !v3)
  {
    uint64_t v8 = self->_idsService;
    uint64_t v12 = IDSLinkPreferenceOptionPacketsPerSecondKey;
    unsigned __int8 v13 = &off_1005131B0;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    -[IDSService setLinkPreferences:](v8, "setLinkPreferences:", v11);
    BOOL v10 = 0;
    goto LABEL_13;
  }

- (id)_failureMetricsContextDictionary
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _pairedDevice](self, "_pairedDevice"));
  id v4 = [v3 isNearby];
  id v5 = [v3 isConnected];
  id v6 = [v3 isCloudConnected];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v7 systemUptime];
  double v9 = v8;

  double v10 = v9 - self->_lastNearbyDevicesChangedTimestamp;
  objc_super v26 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v28[0] = @"has_device";
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3 != 0LL));
  v29[0] = v25;
  v28[1] = @"nearby";
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v29[1] = v11;
  v28[2] = @"connected";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v29[2] = v12;
  v28[3] = @"cloud_connected";
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v29[3] = v13;
  v28[4] = @"last_nearby_status_change";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v29[4] = v14;
  v28[5] = @"preferring_bt_classic";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_prefersBTClassic));
  v29[5] = v15;
  v29[6] = &off_1005131B0;
  v28[6] = @"last_wakeup_duration";
  v28[7] = @"last_stream_open_duration";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_lastStreamEstablishmentDuration));
  v29[7] = v16;
  v28[8] = @"last_stream_open_error";
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_lastOpenErrorCode));
  v29[8] = v17;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  9LL));
  v27 = -[NSMutableDictionary initWithDictionary:](v26, "initWithDictionary:", v18);

  double lastIDSMessageSentTimestamp = self->_lastIDSMessageSentTimestamp;
  if (lastIDSMessageSentTimestamp != 0.0 && self->_lastIDSMetricsContext)
  {
    double v20 = v9 - lastIDSMessageSentTimestamp;
    v21 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, @"time_since");

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_lastIDSMessageSuccess));
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, @"success");

    -[NSMutableDictionary addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", self->_lastIDSMetricsContext);
    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v21, @"last_ids_message_info");
  }

  return v27;
}

- (void)getMetricsContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070308;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updatePairedDeviceInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _pairedDevice](self, "_pairedDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
  id v5 = (NSString *)[v4 copy];
  productType = self->_productType;
  self->_productType = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);
  id v8 = (NSString *)[v7 copy];
  buildVersion = self->_buildVersion;
  self->_buildVersion = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 productName]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
  uint64_t v12 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v13 = self->_productType;
    uint64_t v14 = self->_buildVersion;
    int v16 = 136316162;
    id v17 = "-[ADSharedPeerStreamConnection _updatePairedDeviceInfo]";
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %@ %@ %@", (uint8_t *)&v16, 0x34u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIDOverride]);
  +[ADPeerInfo updateSharedInfoWithIdentifier:productType:buildVersion:]( &OBJC_CLASS___ADPeerInfo,  "updateSharedInfoWithIdentifier:productType:buildVersion:",  v15,  self->_productType,  self->_buildVersion);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a7;
  unsigned int v11 = [v9 type];
  uint64_t v12 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[ADSharedPeerStreamConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v21 = 1024;
    unsigned int v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s type = %d", (uint8_t *)&v19, 0x12u);
  }

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 incomingResponseIdentifier]);
  if (v13)
  {
    -[ADSharedPeerStreamConnection _handleResponseProtobuf:forIdentifier:]( self,  "_handleResponseProtobuf:forIdentifier:",  v9,  v13);
  }

  else
  {
    if (v11 > 2) {
      uint64_t v14 = 0LL;
    }
    else {
      uint64_t v14 = (void *)objc_opt_class(*(&off_1004F3110)[v11]);
    }
    id v15 = objc_alloc((Class)v14);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
    id v17 = [v15 initWithData:v16];

    objc_msgSend(v17, "_ad_performWithPeerStreamConnection:context:", self, v10);
    if (!v17)
    {
      __int16 v18 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315394;
        __int16 v20 = "-[ADSharedPeerStreamConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v21 = 1024;
        unsigned int v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Don't know how to make request for %d",  (uint8_t *)&v19,  0x12u);
      }
    }
  }
}

- (void)_handleWakeUpMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  if (self->_peerSupportsNamedStreams)
  {
    if (self->_socketForConnectionHasBeenVended)
    {
      id v24 = v6;
      uint64_t v25 = self;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v7 = self->_delegates;
      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v32;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            id WeakRetained = objc_loadWeakRetained((id *)&v25->_currentPeerStreamConnection);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADPeerStreamConnectionErrorDomain",  4LL,  0LL));
            [v12 peerStreamConnection:WeakRetained failedWithError:v14];
          }

          id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
        }

        while (v9);
      }

      id v6 = v24;
      self = v25;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 streamId]);
    -[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]( self,  "_getSocketFromDeviceForStreamIdentifier:",  v15);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  int v16 = self->_delegates;
  id v17 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    p_currentPeerStreamConnection = &self->_currentPeerStreamConnection;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        unsigned int v22 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
        if ((objc_opt_respondsToSelector(v22, "peerStreamConnectionHasIncomingPeer:") & 1) != 0)
        {
          id v23 = objc_loadWeakRetained((id *)p_currentPeerStreamConnection);
          [v22 peerStreamConnectionHasIncomingPeer:v23];
        }
      }

      id v18 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v18);
  }
}

- (void)_handleGetMetricsMessage:(id)a3 context:(id)a4
{
  id v5 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_delegates;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "peerStreamConnection:requestMetrics:") & 1) != 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPeerStreamConnection);
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_100070108;
          v13[3] = &unk_1004EEF58;
          id v14 = v5;
          id v15 = self;
          [v11 peerStreamConnection:WeakRetained requestMetrics:v13];

          goto LABEL_11;
        }
      }

      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)_handleReestablishMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    currentStreamIdentifier = self->_currentStreamIdentifier;
    uint64_t v10 = v8;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 lastKnownStreamId]);
    int v14 = 136315650;
    id v15 = "-[ADSharedPeerStreamConnection _handleReestablishMessage:context:]";
    __int16 v16 = 2112;
    __int128 v17 = currentStreamIdentifier;
    __int16 v18 = 2112;
    __int128 v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Current Stream Identifier %@ Remote Stream Identifier %@",  (uint8_t *)&v14,  0x20u);
  }

  if (self->_sockfd != -1)
  {
    uint64_t v12 = self->_currentStreamIdentifier;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 lastKnownStreamId]);
    LODWORD(v12) = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if ((_DWORD)v12)
    {
      -[ADSharedPeerStreamConnection _close](self, "_close");
      -[ADSharedPeerStreamConnection _getSocketFromDevice](self, "_getSocketFromDevice");
    }
  }
}

- (void)_handleResponseProtobuf:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    int v14 = "-[ADSharedPeerStreamConnection _handleResponseProtobuf:forIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = objc_alloc(&OBJC_CLASS____ADPBProxyGetMetricsResponse);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  unsigned int v11 = -[_ADPBProxyGetMetricsResponse initWithData:](v9, "initWithData:", v10);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse _ad_metrics](v11, "_ad_metrics"));
  -[ADSharedPeerStreamConnection _invokeMetricsCompletionWithMetrics:forIdentifier:]( self,  "_invokeMetricsCompletionWithMetrics:forIdentifier:",  v12,  v7);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!a6)
  {
    __int128 v19 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v31 = "-[ADSharedPeerStreamConnection service:account:identifier:didSendWithSuccess:error:context:]";
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2114;
      id v35 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Message send with identifier %@ failed %{public}@",  buf,  0x20u);
    }

    -[ADSharedPeerStreamConnection _invokeMetricsCompletionWithMetrics:forIdentifier:]( self,  "_invokeMetricsCompletionWithMetrics:forIdentifier:",  0LL,  v16);
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v20 systemUptime];
  self->_double lastIDSMessageSentTimestamp = v21;

  objc_msgSend(v18, "averageLocalRTT", @"average_local_RTT");
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v29[0] = v22;
  v28[1] = @"local_message_state";
  id v23 = [v18 localMessageState];
  else {
    uint64_t v24 = (uint64_t)*(&off_1004EEFA0 + (void)v23);
  }
  v29[1] = v24;
  v28[2] = @"device_blacked_out";
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 deviceBlackedOut]));
  v29[2] = v25;
  id v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  lastIDSMetricsContext = self->_lastIDSMetricsContext;
  self->_lastIDSMetricsContext = v26;

  self->_lastIDSMessageSuccess = a6;
}

- (void)_establishEagerStreamPair
{
  if (!self->_gettingDeviceSocket && self->_sockfd == -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPeerStreamConnection);

    if (!WeakRetained)
    {
      id v4 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        id v6 = "-[ADSharedPeerStreamConnection _establishEagerStreamPair]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Eagerly getting device socket",  (uint8_t *)&v5,  0xCu);
      }

      -[ADSharedPeerStreamConnection _getSocketFromDevice](self, "_getSocketFromDevice");
    }
  }

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 136315394;
    v37 = "-[ADSharedPeerStreamConnection service:nearbyDevicesChanged:]";
    __int16 v38 = 2048;
    id v39 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %lu", buf, 0x16u);
  }

  if ([v7 count])
  {
    -[ADSharedPeerStreamConnection _establishEagerStreamPair](self, "_establishEagerStreamPair");
    if (!self->_nearbyDeviceIdentifiers)
    {
      uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      nearbyDeviceIdentifiers = self->_nearbyDeviceIdentifiers;
      self->_nearbyDeviceIdentifiers = v10;
    }

    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v13);
          }
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v31 + 1) + 8 * (void)i),  "uniqueIDOverride",  (void)v31));
          if (v19)
          {
            if ((-[NSMutableSet containsObject:](self->_nearbyDeviceIdentifiers, "containsObject:", v19) & 1) == 0)
            {
              -[NSMutableSet addObject:](self->_nearbyDeviceIdentifiers, "addObject:", v19);
              char v16 = 1;
            }

            -[NSMutableSet addObject:](v12, "addObject:", v19);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v15);

      id v20 = -[NSMutableSet intersectSet:](self->_nearbyDeviceIdentifiers, "intersectSet:", v12);
      if ((v16 & 1) != 0)
      {
        uint64_t v21 = AFIsNano(v20);
        if ((v21 & 1) != 0 || AFSupportsPairedDevice(v21, v22))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
          [v23 systemUptime];
          double v25 = v24;

          if (vabdd_f64(v25, self->_lastSharedDataUpdateTimestamp) > 3600.0)
          {
            self->_lastSharedDataUpdateTimestamp = v25;
            id v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
            [v26 updateSharedDataFromPeerUseCache:0 allowCloudMessaging:0 completion:0];
          }
        }
      }
    }

    else
    {

      -[NSMutableSet intersectSet:](self->_nearbyDeviceIdentifiers, "intersectSet:", v12, (void)v31);
    }
  }

  else
  {
    __int128 v27 = self->_nearbyDeviceIdentifiers;
    self->_nearbyDeviceIdentifiers = 0LL;

    if (self->_sockfd != -1)
    {
      __int128 v28 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[ADSharedPeerStreamConnection service:nearbyDevicesChanged:]";
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Nearby device disappeared, closing cached streams",  buf,  0xCu);
      }

      -[ADSharedPeerStreamConnection _close](self, "_close");
    }
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v29 systemUptime];
  self->_lastNearbyDevicesChangedTimestamp = v30;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSharedPeerStreamConnection service:devicesChanged:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[ADSharedPeerStreamConnection _updatePairedDeviceInfo](self, "_updatePairedDeviceInfo");
  -[ADSharedPeerStreamConnection _preheat](self, "_preheat");
}

- (BOOL)peerSupportsExtendedHeader
{
  return self->_peerSupportsExtendedHeader;
}

- (void)_preheat
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _pairedDevice](self, "_pairedDevice"));
  unsigned int v4 = [v3 isNearby];

  if (v4) {
    -[ADSharedPeerStreamConnection _establishEagerStreamPair](self, "_establishEagerStreamPair");
  }
}

- (void)preheat
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070100;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)deviceIsNearby
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedPeerStreamConnection _pairedDevice](self, "_pairedDevice"));
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (void).cxx_destruct
{
}

+ (id)_errorWithCode:(int64_t)a3 underylingError:(id)a4
{
  if (!a4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADPeerStreamConnectionErrorDomain",  a3,  0LL));
  }
  NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
  id v10 = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADPeerStreamConnectionErrorDomain",  a3,  v6));

  return v7;
}

+ (id)_noNearbyPeerError
{
  return _[a1 _errorWithCode:2 underylingError:0];
}

+ (id)_noDeviceError
{
  return _[a1 _errorWithCode:0 underylingError:0];
}

+ (id)_deviceConnectionClosedErrorWithUnderlyingError:(id)a3
{
  return _[a1 _errorWithCode:1 underylingError:a3];
}

+ (id)_streamPairInterruptedError
{
  return _[a1 _errorWithCode:3 underylingError:0];
}

+ (id)sharedPeerStreamConnectionWithServiceIdentifier:(id)a3 listener:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    if (qword_100577A70 != -1) {
      dispatch_once(&qword_100577A70, &stru_1004EEF08);
    }
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    char v16 = sub_100070A14;
    uint64_t v17 = sub_100070A24;
    id v18 = 0LL;
    id v6 = (dispatch_queue_s *)qword_100577A60;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007136C;
    block[3] = &unk_1004F0668;
    unsigned int v11 = &v13;
    id v10 = v5;
    BOOL v12 = a4;
    dispatch_sync(v6, block);
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

@end