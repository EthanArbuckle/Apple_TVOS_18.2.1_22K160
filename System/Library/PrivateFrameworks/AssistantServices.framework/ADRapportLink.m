@interface ADRapportLink
+ (id)_sharedLinkForSiriInfo;
+ (id)siriInfoToBeBroadcasted;
+ (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4;
- (ADRapportLink)initWithQueue:(id)a3 configuration:(id)a4;
- (ADRapportLinkConfiguration)configuration;
- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 messageID:(id *)a6 messageType:(id *)a7 messagePayload:(id *)a8 senderPeerInfo:(id *)a9;
- (BOOL)canReachPersonalDevices;
- (BOOL)isInvalidated;
- (BOOL)usingOnDemandConnection;
- (NSArray)activeDevices;
- (NSString)serviceType;
- (RPCompanionLinkDevice)destinationDevice;
- (RPCompanionLinkDevice)localDevice;
- (id)_buildRequestFromMessageType:(id)a3 andMessagePayload:(id)a4;
- (id)_buildResponse;
- (id)_destinationIDForDeviceAssistantIdentifier:(id)a3;
- (id)_destinationIDForDeviceHomeKitAccessoryIdentifier:(id)a3;
- (id)_destinationIDForDeviceIDSIdentifier:(id)a3;
- (id)_destinationIDForPeerInfo:(id)a3;
- (id)_remoteDeviceForPeerInfo:(id)a3;
- (id)_siriInfo;
- (void)_activateWithCompletion:(id)a3;
- (void)_addLocalDeviceInfoToDictionary:(id)a3;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_handleDidFindDevice:(id)a3;
- (void)_handleDidInterrupt;
- (void)_handleDidInvalidate;
- (void)_handleDidLoseDevice:(id)a3;
- (void)_handleDidUpdateDevice:(id)a3 changes:(unsigned int)a4;
- (void)_handleDidUpdateLocalDevice:(id)a3;
- (void)_invalidate;
- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 destinationID:(id)a6 options:(id)a7 completion:(id)a8;
- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_setSiriInfo:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)removeListener:(id)a3;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithAssistantIdentifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithHomeKitAccessoryIdentifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithIDSDeviceID:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toPeer:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestToContextCollectorThroughOnDemandConnection:(id)a3 messageType:(id)a4 messagePayload:(id)a5 options:(id)a6 completion:(id)a7;
- (void)setDestinationDevice:(id)a3;
- (void)setRequestHandler:(id)a3 forRequestID:(id)a4 messageType:(id)a5;
- (void)setServiceType:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
- (void)updateLocalDeviceIsContextCollector:(BOOL)a3;
@end

@implementation ADRapportLink

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADRapportLink;
  -[ADRapportLink dealloc](&v3, "dealloc");
}

- (ADRapportLink)initWithQueue:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v85 = a4;
  v98.receiver = self;
  v98.super_class = (Class)&OBJC_CLASS___ADRapportLink;
  v7 = -[ADRapportLink init](&v98, "init");
  if (!v7) {
    goto LABEL_96;
  }
  if (v6)
  {
    v8 = (OS_dispatch_queue *)v6;
    queue = v7->_queue;
    v7->_queue = v8;
  }

  else
  {
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.assistant.rapport-link", v13);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;
  }

  v15 = (ADRapportLinkConfiguration *)[v85 copy];
  configuration = v7->_configuration;
  v7->_configuration = v15;

  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  listeners = v7->_listeners;
  v7->_listeners = (NSHashTable *)v17;

  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  handlersByRequestIDAndMessageType = v7->_handlersByRequestIDAndMessageType;
  v7->_handlersByRequestIDAndMessageType = v19;

  v21 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  client = v7->_client;
  v7->_client = v21;

  -[RPCompanionLinkClient setDispatchQueue:](v7->_client, "setDispatchQueue:", v7->_queue);
  id v23 = -[RPCompanionLinkClient flags](v7->_client, "flags");
  unint64_t v24 = (unint64_t)-[RPCompanionLinkClient controlFlags](v7->_client, "controlFlags");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLinkConfiguration discoveryOptions](v7->_configuration, "discoveryOptions"));
  id v26 = [v25 includesFamily];

  if (v26 == (id)2)
  {
    v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s iCloud Family included", buf, 0xCu);
    }

    v24 |= 0x1000uLL;
  }

  else if (v26 == (id)1)
  {
    v27 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s iCloud Family excluded", buf, 0xCu);
    }

    v24 &= ~0x1000uLL;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLinkConfiguration discoveryOptions](v7->_configuration, "discoveryOptions"));
  id v30 = [v29 includesHome];

  if (v30 == (id)2)
  {
    v32 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s HomeKit shared homes included", buf, 0xCu);
    }

    v24 |= 0x800uLL;
  }

  else if (v30 == (id)1)
  {
    v31 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s HomeKit shared homes excluded", buf, 0xCu);
    }

    v24 &= ~0x800uLL;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLinkConfiguration connectionOptions](v7->_configuration, "connectionOptions"));
  id v34 = [v33 usesOnDemandConnection];

  if (v34 == (id)2)
  {
    v39 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s On-demand Connection enabled", buf, 0xCu);
    }

    v24 |= 0x200uLL;
    goto LABEL_37;
  }

  if (v34 == (id)1) {
    goto LABEL_26;
  }
  if (!v34)
  {
    v35 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s usesOnDemandConnection Unspecified - default false",  buf,  0xCu);
    }

- (BOOL)isInvalidated
{
  return self->_client == 0LL;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    client = self->_client;
    *(_DWORD *)buf = 136315650;
    dispatch_queue_attr_t v12 = "-[ADRapportLink activateWithCompletion:]";
    __int16 v13 = 2112;
    dispatch_queue_t v14 = self;
    __int16 v15 = 2112;
    v16 = client;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100083A8C;
  v9[3] = &unk_1004FD990;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083A80;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083A74;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (RPCompanionLinkDevice)localDevice
{
  return (RPCompanionLinkDevice *)-[RPCompanionLinkClient localDevice](self->_client, "localDevice");
}

- (NSArray)activeDevices
{
  return (NSArray *)-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices");
}

- (NSString)serviceType
{
  return (NSString *)-[RPCompanionLinkClient serviceType](self->_client, "serviceType");
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083A68;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (RPCompanionLinkDevice)destinationDevice
{
  return (RPCompanionLinkDevice *)-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice");
}

- (void)setDestinationDevice:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083A5C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)canReachPersonalDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self, "localDevice"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 homeKitIdentifier]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)usingOnDemandConnection
{
  return -[RPCompanionLinkClient usingOnDemandConnection](self->_client, "usingOnDemandConnection");
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100083844;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)registerRequestID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000832D8;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setRequestHandler:(id)a3 forRequestID:(id)a4 messageType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100083268;
    v13[3] = &unk_1004FD470;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(queue, v13);
  }

  else
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADRapportLink setRequestHandler:forRequestID:messageType:]";
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Empty requestID or messageType: %@, %@",  buf,  0x20u);
    }
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100083254;
  v23[3] = &unk_1004F7960;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithIDSDeviceID:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000831B8;
  block[3] = &unk_1004F73F0;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithHomeKitAccessoryIdentifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008311C;
  block[3] = &unk_1004F73F0;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithAssistantIdentifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083080;
  block[3] = &unk_1004F73F0;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toPeer:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100082FE4;
  block[3] = &unk_1004F73F0;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestToContextCollectorThroughOnDemandConnection:(id)a3 messageType:(id)a4 messagePayload:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled")
      && AFSupportsHALOnDemandRapportConnection())
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADRapportLink _buildRequestFromMessageType:andMessagePayload:]( self,  "_buildRequestFromMessageType:andMessagePayload:",  v13,  v14));
      id v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        client = self->_client;
        *(_DWORD *)buf = 136315394;
        id v25 = "-[ADRapportLink sendRequestToContextCollectorThroughOnDemandConnection:messageType:messagePayload:options:completion:]";
        __int16 v26 = 2112;
        id v27 = client;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s #hal #on-demand sendRequestToContextCollector client: %@",  buf,  0x16u);
      }

      id v20 = self->_client;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100082FCC;
      v22[3] = &unk_1004F72B0;
      id v23 = v16;
      -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:]( v20,  "sendRequestID:request:options:responseHandler:",  v12,  v17,  v15,  v22);
    }

    else
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  1017LL,  0LL,  0LL));
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0LL, v21);
    }
  }
}

- (void)updateLocalDeviceIsContextCollector:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled"))
  {
    client = self->_client;
    if (v3)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100082DCC;
      v8[3] = &unk_1004EF3C0;
      BOOL v9 = v3;
      -[RPCompanionLinkClient setLocalDeviceAsContextCollectorWithCompletion:]( client,  "setLocalDeviceAsContextCollectorWithCompletion:",  v8);
    }

    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100082ECC;
      v6[3] = &unk_1004EF3C0;
      char v7 = 0;
      -[RPCompanionLinkClient removeLocalDeviceAsContextCollectorWithCompletion:]( client,  "removeLocalDeviceAsContextCollectorWithCompletion:",  v6);
    }
  }

- (void)setStateUpdateHandler:(id)a3
{
}

- (void)invalidate
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    client = self->_client;
    *(_DWORD *)buf = 136315650;
    id v8 = "-[ADRapportLink invalidate]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = client;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100082DC4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_activateWithCompletion:(id)a3
{
}

- (void)_invalidate
{
  client = self->_client;
  if (client)
  {
    -[RPCompanionLinkClient invalidate](client, "invalidate");
    BOOL v4 = self->_client;
    self->_client = 0LL;
  }

  -[NSHashTable removeAllObjects](self->_listeners, "removeAllObjects");
}

- (void)_handleDidInterrupt
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100082D78;
  v2[3] = &unk_1004EF3E8;
  v2[4] = self;
  -[ADRapportLink _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v2);
}

- (void)_handleDidInvalidate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100082D2C;
  v2[3] = &unk_1004EF3E8;
  v2[4] = self;
  -[ADRapportLink _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v2);
}

- (void)_handleDidUpdateLocalDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100082CE0;
  v4[3] = &unk_1004EF410;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ADRapportLink _enumerateListenersUsingBlock:](v5, "_enumerateListenersUsingBlock:", v4);
}

- (void)_handleDidFindDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100082C94;
  v4[3] = &unk_1004EF410;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ADRapportLink _enumerateListenersUsingBlock:](v5, "_enumerateListenersUsingBlock:", v4);
}

- (void)_handleDidUpdateDevice:(id)a3 changes:(unsigned int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100082C44;
  v6[3] = &unk_1004EF438;
  char v7 = self;
  id v8 = a3;
  unsigned int v9 = a4;
  id v5 = v8;
  -[ADRapportLink _enumerateListenersUsingBlock:](v7, "_enumerateListenersUsingBlock:", v6);
}

- (void)_handleDidLoseDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100082BF8;
  v4[3] = &unk_1004EF410;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ADRapportLink _enumerateListenersUsingBlock:](v5, "_enumerateListenersUsingBlock:", v4);
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if (v4)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](self->_listeners, "setRepresentation", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        unsigned int v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
          unsigned int v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }
  }
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100082A0C;
  v11[3] = &unk_1004EF460;
  id v12 = v8;
  id v10 = v8;
  -[RPCompanionLinkClient registerRequestID:options:handler:](client, "registerRequestID:options:handler:", a3, a4, v11);
}

- (id)_buildResponse
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[ADRapportLink _addLocalDeviceInfoToDictionary:](self, "_addLocalDeviceInfoToDictionary:", v3);
  return v3;
}

- (id)_buildRequestFromMessageType:(id)a3 andMessagePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"messageID");
  if ([v6 length]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v6, @"type");
  }
  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, @"payload");
  }
  -[ADRapportLink _addLocalDeviceInfoToDictionary:](self, "_addLocalDeviceInfoToDictionary:", v8);

  return v8;
}

- (void)_addLocalDeviceInfoToDictionary:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v17)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"ADRapportLink.m", 717, @"Invalid parameter not satisfying: %@", @"dictionary != nil" object file lineNumber description];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient localDevice](self->_client, "localDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localPeerInfo]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceIdentifier]);
  if (![v8 length])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 idsDeviceUniqueIdentifier]);

    id v8 = (void *)v9;
  }

  if ([v8 length]) {
    [v17 setObject:v8 forKey:@"idsDeviceId"];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveIdentifier]);
  if (![v10 length])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 rapportEffectiveIdentifier]);

    id v10 = (void *)v11;
  }

  if ([v10 length]) {
    [v17 setObject:v10 forKey:@"rapportDeviceId"];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitIdentifier]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  if (![v13 length])
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 homeKitAccessoryIdentifier]);

    __int128 v13 = (void *)v14;
  }

  if ([v13 length]) {
    [v17 setObject:v13 forKey:@"homeDeviceId"];
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 assistantIdentifier]);
  if ([v15 length]) {
    [v17 setObject:v15 forKey:@"assistantId"];
  }
}

- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 messageID:(id *)a6 messageType:(id *)a7 messagePayload:(id *)a8 senderPeerInfo:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  if (a8) {
    *a8 = 0LL;
  }
  if (a9) {
    *a9 = 0LL;
  }
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"messageID"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
    {
      id v30 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s malformed message id", buf, 0xCu);
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed message id."));
      id v28 = v31;
      if (a5)
      {
        id v28 = v31;
        BOOL v29 = 0;
        *a5 = v28;
      }

      else
      {
        BOOL v29 = 0;
      }

      goto LABEL_95;
    }

    id v71 = v15;
    id v19 = v17;
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"type"]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    id v73 = (id)v20;
    if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
    {
      id v32 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s malformed message type", buf, 0xCu);
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed message type."));
      id v28 = v33;
      id v17 = v19;
      if (a5)
      {
        id v28 = v33;
        BOOL v29 = 0;
        *a5 = v28;
      }

      else
      {
        BOOL v29 = 0;
      }

      id v15 = v71;
      v36 = v73;
      goto LABEL_94;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"payload"]);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v70 = (id)v22;
    if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
    {
      id v34 = (os_log_s *)AFSiriLogContextDaemon;
      id v17 = v19;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s malformed message payload",  buf,  0xCu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed message payload."));
      id v28 = v35;
      id v15 = v71;
      v36 = v73;
      id v37 = v70;
      if (a5)
      {
        id v28 = v35;
        BOOL v29 = 0;
        *a5 = v28;
      }

      else
      {
        BOOL v29 = 0;
      }

      goto LABEL_93;
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"idsDeviceId"]);
    id v17 = v19;
    if (v24)
    {
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
      id v15 = v71;
      if ((objc_opt_isKindOfClass(v24, v25) & 1) == 0)
      {
        uint64_t v69 = v24;
        v41 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s malformed IDS id", buf, 0xCu);
        }

        id v42 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed IDS id."));
        id v28 = v42;
        v36 = v73;
        id v37 = v70;
        if (a5)
        {
          id v28 = v42;
          BOOL v29 = 0;
          *a5 = v28;
        }

        else
        {
          BOOL v29 = 0;
        }

        goto LABEL_92;
      }

      if (![v24 length])
      {

        id v24 = 0LL;
      }
    }

    else
    {
      id v15 = v71;
    }

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"rapportDeviceId"]);
    uint64_t v69 = v24;
    if (v38)
    {
      v39 = (void *)v38;
      uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v39, v40) & 1) == 0)
      {
        v68 = v39;
        v43 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s malformed Rapport id", buf, 0xCu);
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed Rapport id."));
        id v28 = v44;
        v36 = v73;
        id v37 = v70;
        if (a5)
        {
          id v28 = v44;
          BOOL v29 = 0;
          *a5 = v28;
        }

        else
        {
          BOOL v29 = 0;
        }

        goto LABEL_91;
      }

      if ([v39 length])
      {
        v68 = v39;
        goto LABEL_56;
      }
    }

    v68 = 0LL;
LABEL_56:
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"homeDeviceId"]);
    if (v45)
    {
      v72 = (void *)v45;
      uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v72, v46) & 1) == 0)
      {
        id v53 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s malformed HomeKit id", buf, 0xCu);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed HomeKit id."));
        id v28 = v54;
        v36 = v73;
        id v37 = v70;
        if (a5)
        {
          id v28 = v54;
          BOOL v29 = 0;
          *a5 = v28;
        }

        else
        {
          BOOL v29 = 0;
        }

        goto LABEL_90;
      }

      if ([v72 length])
      {
LABEL_61:
        uint64_t v47 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"assistantId"]);
        if (v47)
        {
          v48 = (void *)v47;
          uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString);
          id v50 = v48;
          if ((objc_opt_isKindOfClass(v48, v49) & 1) == 0)
          {
            id v67 = v48;
            v62 = (os_log_s *)AFSiriLogContextDaemon;
            v36 = v73;
            id v37 = v70;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
              _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "%s malformed Assistant id",  buf,  0xCu);
            }

            id v63 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed Assistant id."));
            id v28 = v63;
            if (a5)
            {
              id v28 = v63;
              BOOL v29 = 0;
              *a5 = v28;
            }

            else
            {
              BOOL v29 = 0;
            }

            goto LABEL_89;
          }

          id v51 = [v48 length];
          v52 = v69;
          if (!v51)
          {

            id v50 = 0LL;
          }
        }

        else
        {
          id v50 = 0LL;
          v52 = v69;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
        id v56 = v55;
        if (v52 && v50) {
          [v55 _setAssistantId:v50 forDeviceWithIdsDeviceUniqueIdentifier:v52];
        }
        v66 = v56;
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472LL;
        v76[2] = sub_100082914;
        v76[3] = &unk_1004EF488;
        id v77 = v52;
        id v78 = v68;
        id v79 = v72;
        id v67 = v50;
        id v80 = v67;
        id v57 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v76);
        id v58 = sub_10016563C(v57, 0LL);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_100082974;
        v74[3] = &unk_1004FD2E8;
        id v75 = v15;
        id v60 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v74);
        uint64_t v61 = AFPeerInfoMerge(v59, v60);
        v65 = (void *)objc_claimAutoreleasedReturnValue(v61);

        if (a6) {
          *a6 = v17;
        }
        v36 = v73;
        id v37 = v70;
        if (a7) {
          *a7 = v73;
        }
        if (a8) {
          *a8 = v70;
        }
        if (a9) {
          *a9 = v65;
        }

        id v28 = 0LL;
        BOOL v29 = 1;
LABEL_89:

LABEL_90:
LABEL_91:

LABEL_92:
LABEL_93:

LABEL_94:
LABEL_95:

        goto LABEL_96;
      }
    }

    v72 = 0LL;
    goto LABEL_61;
  }

  __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v82 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s malformed request dictionary",  buf,  0xCu);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed request dictionary."));
  id v28 = v27;
  if (a5)
  {
    id v28 = v27;
    BOOL v29 = 0;
    *a5 = v28;
  }

  else
  {
    BOOL v29 = 0;
  }

- (void)_sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 destinationID:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADRapportLink _buildRequestFromMessageType:andMessagePayload:]( self,  "_buildRequestFromMessageType:andMessagePayload:",  v15,  a5));
  uint64_t v20 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    BOOL v29 = "-[ADRapportLink _sendRequestID:messageType:messagePayload:destinationID:options:completion:]";
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Sending request for requestID=%@, messageType=%@ : %@",  buf,  0x2Au);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10008265C;
  v24[3] = &unk_1004EF4B0;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  -[ADRapportLink _sendRequestID:request:destinationID:options:responseHandler:]( self,  "_sendRequestID:request:destinationID:options:responseHandler:",  v23,  v19,  v18,  v17,  v24);
}

- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v18 = [v17 isLostModeActive];

  if (v18)
  {
    id v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[ADRapportLink _sendRequestID:request:destinationID:options:responseHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  (uint8_t *)&v20,  0xCu);
    }
  }

  else
  {
    -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( self->_client,  "sendRequestID:request:destinationID:options:responseHandler:",  v12,  v13,  v14,  v15,  v16);
  }
}

- (id)_destinationIDForDeviceIDSIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceIdentifier]);
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if ((v12 & 1) != 0)
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

            goto LABEL_15;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ADRapportLink _destinationIDForDeviceIDSIdentifier:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s unable to find device with uniqueIDSIdentifier: %@",  buf,  0x16u);
  }

  id v14 = 0LL;
LABEL_15:

  return v14;
}

- (id)_destinationIDForDeviceHomeKitAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 homeKitIdentifier]);
          unsigned __int8 v12 = [v11 isEqual:v4];

          if ((v12 & 1) != 0)
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

            goto LABEL_15;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ADRapportLink _destinationIDForDeviceHomeKitAccessoryIdentifier:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s unable to find device with homeKitAccessoryIdentifier: %@",  buf,  0x16u);
  }

  id v14 = 0LL;
LABEL_15:

  return v14;
}

- (id)_destinationIDForDeviceAssistantIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v11 = sub_10016AB90(v10);
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          unsigned __int8 v13 = [v12 isEqualToString:v4];

          if ((v13 & 1) != 0)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

            goto LABEL_15;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[ADRapportLink _destinationIDForDeviceAssistantIdentifier:]";
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s unable to find device with assistantIdentifier: %@",  buf,  0x16u);
  }

  id v15 = 0LL;
LABEL_15:

  return v15;
}

- (id)_destinationIDForPeerInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink _remoteDeviceForPeerInfo:](self, "_remoteDeviceForPeerInfo:", v4));
  if (!v5)
  {
    LOBYTE(v12) = 0;
    id v6 = sub_10016563C(v4, &v12);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = v7;
    if ((_BYTE)v12)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink _remoteDeviceForPeerInfo:](self, "_remoteDeviceForPeerInfo:", v7));

      if (v5) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      unsigned __int8 v13 = "-[ADRapportLink _destinationIDForPeerInfo:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s unable to find device with peer info: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v5 = 0LL;
  }

- (id)_remoteDeviceForPeerInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceUniqueIdentifier]);
  if (![v6 length]) {
    goto LABEL_11;
  }
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (!v8)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v59;
LABEL_4:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v59 != v10) {
      objc_enumerationMutation(v7);
    }
    int v12 = *(void **)(*((void *)&v58 + 1) + 8 * v11);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);
    unsigned __int8 v14 = [v13 isEqualToString:v6];

    if ((v14 & 1) != 0) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v37 = v12;

  if (v37) {
    goto LABEL_54;
  }
LABEL_12:
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportEffectiveIdentifier]);
  if (![v15 length])
  {
LABEL_22:

    goto LABEL_23;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (!v17)
  {
LABEL_21:

    goto LABEL_22;
  }

  id v18 = v17;
  uint64_t v19 = *(void *)v55;
LABEL_15:
  uint64_t v20 = 0LL;
  while (1)
  {
    if (*(void *)v55 != v19) {
      objc_enumerationMutation(v16);
    }
    id v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 effectiveIdentifier]);
    unsigned __int8 v23 = [v22 isEqualToString:v15];

    if ((v23 & 1) != 0) {
      break;
    }
    if (v18 == (id)++v20)
    {
      id v18 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v18) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }

  id v37 = v21;

  if (v37) {
    goto LABEL_54;
  }
LABEL_23:
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 homeKitAccessoryIdentifier]);
  if ([v24 length])
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    uint64_t v45 = v5;
    id v25 = v5;
    id v26 = [v25 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v51;
LABEL_26:
      uint64_t v29 = 0LL;
      while (1)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v25);
        }
        __int16 v30 = *(void **)(*((void *)&v50 + 1) + 8 * v29);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 homeKitIdentifier]);
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
        unsigned __int8 v33 = [v32 isEqualToString:v24];

        if ((v33 & 1) != 0) {
          break;
        }
        if (v27 == (id)++v29)
        {
          id v27 = [v25 countByEnumeratingWithState:&v50 objects:v63 count:16];
          if (v27) {
            goto LABEL_26;
          }
          goto LABEL_32;
        }
      }

      id v37 = v30;

      id v5 = v45;
      if (v37) {
        goto LABEL_54;
      }
      goto LABEL_34;
    }

- (id)_siriInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient siriInfo](self->_client, "siriInfo"));
  id v3 = [v2 copy];

  return v3;
}

- (void)_setSiriInfo:(id)a3
{
}

- (ADRapportLinkConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

+ (id)_sharedLinkForSiriInfo
{
  if (qword_100577B20 != -1) {
    dispatch_once(&qword_100577B20, &stru_1004EF4D0);
  }
  return (id)qword_100577B28;
}

+ (id)siriInfoToBeBroadcasted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedLinkForSiriInfo]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 siriInfoToBeBroadcasted]);

  return v3;
}

+ (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _sharedLinkForSiriInfo]);
  [v8 updateSiriInfoWithObject:v7 forKey:v6];
}

@end