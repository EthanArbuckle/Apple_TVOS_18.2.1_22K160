@interface BMRapportClient
+ (id)clientForCommunicatingWithDevice:(id)a3 serviceName:(id)a4 queue:(id)a5;
+ (id)clientForHandlingRequestsWithServiceName:(id)a3 queue:(id)a4;
+ (id)clientForSameAccountDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
+ (id)clientForSharedHomeDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
+ (unint64_t)controlFlagsForMessagingDevice:(id)a3;
+ (unint64_t)controlFlagsForSameAccountDiscovery;
+ (unint64_t)controlFlagsForSharedHomeDiscovery;
- (BOOL)_validateDevice:(id)a3;
- (NSArray)activeDevices;
- (RPCompanionLinkDevice)localDevice;
- (id)_initWithType:(unint64_t)a3 controlFlags:(unint64_t)a4 serviceName:(id)a5 queue:(id)a6;
- (id)invalidationHandler;
- (void)_companionLinkClientActivatedWithError:(id)a3;
- (void)_companionLinkClientDiscoveredDevice:(id)a3;
- (void)_companionLinkClientInvalidated;
- (void)_companionLinkClientLostDevice:(id)a3;
- (void)_createAndActivateCompanionLinkClient;
- (void)_deregisterRequests;
- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_handleResponseUUID:(id)a3 response:(id)a4 options:(id)a5 error:(id)a6 handler:(id)a7;
- (void)_registerRequests;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation BMRapportClient

- (id)_initWithType:(unint64_t)a3 controlFlags:(unint64_t)a4 serviceName:(id)a5 queue:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BMRapportClient;
  v13 = -[BMRapportClient init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a6);
    v14->_type = a3;
    v14->_state = 0LL;
    v14->_controlFlags = a4;
    objc_storeStrong((id *)&v14->_serviceName, a5);
    v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    activationHandlers = v14->_activationHandlers;
    v14->_activationHandlers = v15;
  }

  return v14;
}

+ (id)clientForHandlingRequestsWithServiceName:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [objc_alloc((Class)a1) _initWithType:1 controlFlags:0 serviceName:v7 queue:v6];

  if (v8)
  {
    v9 = (void *)v8[8];
    v8[8] = @"RequestHandler";
  }

  return v8;
}

+ (id)clientForSameAccountDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v13 = (id *)objc_msgSend( v11,  "_initWithType:controlFlags:serviceName:queue:",  0,  objc_msgSend((id)objc_opt_class(a1, v12), "controlFlagsForSameAccountDiscovery"),  v10,  v9);

  if (v13)
  {
    objc_storeWeak(v13 + 6, v8);
    id v14 = v13[8];
    v13[8] = @"DiscoverySameAccount";
  }

  return v13;
}

+ (id)clientForSharedHomeDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = objc_msgSend((id)objc_opt_class(a1, v11), "controlFlagsForSharedHomeDiscovery");
  if (v12)
  {
    id v13 = [objc_alloc((Class)a1) _initWithType:0 controlFlags:v12 serviceName:v8 queue:v10];
    id v14 = v13;
    if (v13)
    {
      objc_storeWeak((id *)v13 + 6, v9);
      v15 = (void *)v14[8];
      v14[8] = @"DiscoverySharedHome";
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)clientForCommunicatingWithDevice:(id)a3 serviceName:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc((Class)a1);
  id v14 = (id *)objc_msgSend( v12,  "_initWithType:controlFlags:serviceName:queue:",  2,  objc_msgSend((id)objc_opt_class(a1, v13), "controlFlagsForMessagingDevice:", v9),  v11,  v10);

  if (v14)
  {
    objc_storeStrong(v14 + 11, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bm_companionLinkDeviceIdentifier"));
    if ((unint64_t)[v15 length] <= 8)
    {
      id v16 = v14[8];
      v14[8] = @"UnknownDevice";
    }

    else
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bm_companionLinkDeviceIdentifier"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 substringToIndex:8]);
      id v18 = v14[8];
      v14[8] = (id)v17;
    }
  }

  return v14;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = __biome_log_for_category(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    loggingIdentifier = self->_loggingIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = loggingIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: activate", buf, 0xCu);
  }

  switch(self->_state)
  {
    case 0uLL:
      if (v4)
      {
        activationHandlers = self->_activationHandlers;
        id v9 = objc_retainBlock(v4);
        -[NSMutableArray addObject:](activationHandlers, "addObject:", v9);
      }

      -[BMRapportClient _createAndActivateCompanionLinkClient](self, "_createAndActivateCompanionLinkClient");
      break;
    case 1uLL:
      if (v4)
      {
        id v10 = self->_activationHandlers;
        id v11 = objc_retainBlock(v4);
        -[NSMutableArray addObject:](v10, "addObject:", v11);
      }

      break;
    case 2uLL:
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      break;
    case 3uLL:
      if (v4)
      {
        NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
        v15 = @"BMRapportClient has been invalidated";
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  4LL,  v12));
        (*((void (**)(id, void *))v4 + 2))(v4, v13);
      }

      break;
    default:
      break;
  }
}

- (void)invalidate
{
  if (self->_state != 3)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      *(_DWORD *)buf = 138412290;
      v24 = loggingIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: invalidate", buf, 0xCu);
    }

    self->_state = 3LL;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_client, "setDeviceChangedHandler:", 0LL);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_client, "setDeviceFoundHandler:", 0LL);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_client, "setDeviceLostHandler:", 0LL);
    -[RPCompanionLinkClient setDisconnectHandler:](self->_client, "setDisconnectHandler:", 0LL);
    -[RPCompanionLinkClient setErrorFlagsChangedHandler:](self->_client, "setErrorFlagsChangedHandler:", 0LL);
    -[RPCompanionLinkClient setInterruptionHandler:](self->_client, "setInterruptionHandler:", 0LL);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", 0LL);
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](self->_client, "setLocalDeviceUpdatedHandler:", 0LL);
    -[RPCompanionLinkClient setStateUpdatedHandler:](self->_client, "setStateUpdatedHandler:", 0LL);
    if (self->_type == 1) {
      -[BMRapportClient _deregisterRequests](self, "_deregisterRequests");
    }
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_outstandingResponseHandlers, "allValues", self));
    id v6 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v9);
          NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
          v21 = @"Rapport client invalidated";
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  4LL,  v11));
          (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0LL, 0LL, v12);

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
      }

      while (v7);
    }

    [*(id *)(v14 + 56) removeAllObjects];
    [*(id *)(v14 + 32) invalidate];
    uint64_t v13 = *(void *)(v14 + 104);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
  }

- (void)_companionLinkClientActivatedWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v4) {
      -[BMRapportClient invalidate](self, "invalidate");
    }
    else {
      self->_state = 2LL;
    }
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v5 = self->_activationHandlers;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_activationHandlers, "removeAllObjects", (void)v10);
  }
}

- (void)_companionLinkClientInvalidated
{
  if (self->_state != 3)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003FFE0((uint64_t)self, v4);
    }

    -[BMRapportClient invalidate](self, "invalidate");
  }

- (void)_createAndActivateCompanionLinkClient
{
  if (self->_state)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100040058((uint64_t)self, v4);
    }
  }

  else
  {
    self->_state = 1LL;
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    client = self->_client;
    self->_client = v5;

    -[RPCompanionLinkClient setDispatchQueue:](self->_client, "setDispatchQueue:", self->_queue);
    -[RPCompanionLinkClient setControlFlags:](self->_client, "setControlFlags:", self->_controlFlags);
    if (self->_type - 1 <= 1) {
      -[RPCompanionLinkClient setServiceType:](self->_client, "setServiceType:", self->_serviceName);
    }
    if (self->_destinationDevice) {
      -[RPCompanionLinkClient setDestinationDevice:](self->_client, "setDestinationDevice:");
    }
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100002F80;
    v15[3] = &unk_100068A60;
    objc_copyWeak(&v16, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", v15);
    unint64_t type = self->_type;
    if (!type)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100002FAC;
      v13[3] = &unk_100068A88;
      objc_copyWeak(&v14, &location);
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_client, "setDeviceFoundHandler:", v13);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100002FF4;
      v11[3] = &unk_100068A88;
      objc_copyWeak(&v12, &location);
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_client, "setDeviceLostHandler:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      unint64_t type = self->_type;
    }

    if (type == 1) {
      -[BMRapportClient _registerRequests](self, "_registerRequests");
    }
    uint64_t v8 = self->_client;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000303C;
    v9[3] = &unk_100068AB0;
    objc_copyWeak(&v10, &location);
    -[RPCompanionLinkClient activateWithCompletion:](v8, "activateWithCompletion:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v13)
    {
      if (!self->_outstandingResponseHandlers)
      {
        id v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        outstandingResponseHandlers = self->_outstandingResponseHandlers;
        self->_outstandingResponseHandlers = v16;
      }

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v19 = [v13 copy];

      id v20 = objc_retainBlock(v19);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outstandingResponseHandlers,  "setObject:forKeyedSubscript:",  v20,  v18);
    }

    else
    {
      __int128 v18 = 0LL;
      id v19 = 0LL;
    }

    v21 = self->_loggingIdentifier;
    objc_initWeak(&location, self);
    client = self->_client;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000E244;
    v23[3] = &unk_100068DF0;
    objc_copyWeak(&v27, &location);
    v15 = v21;
    v24 = v15;
    id v14 = v18;
    id v25 = v14;
    id v13 = v19;
    id v26 = v13;
    -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:]( client,  "sendRequestID:request:options:responseHandler:",  v10,  v11,  v12,  v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }

  if (v13)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v30 = @"Rapport client has been invalidated";
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  4LL,  v14));
    (*((void (**)(id, void, void, NSString *))v13 + 2))(v13, 0LL, 0LL, v15);
LABEL_10:
  }
}

- (void)_handleResponseUUID:(id)a3 response:(id)a4 options:(id)a5 error:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id, id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
  {
    uint64_t v17 = __biome_log_for_category(11LL);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      if (v13) {
        id v20 = v13;
      }
      else {
        id v20 = v15;
      }
      int v24 = 138412546;
      id v25 = loggingIdentifier;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BMRapportClient[%@]: Warning: ignoring response arriving after invalidation: %@",  (uint8_t *)&v24,  0x16u);
    }

- (RPCompanionLinkDevice)localDevice
{
  if (self->_state == 3) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient localDevice](self->_client, "localDevice"));
  }
  return (RPCompanionLinkDevice *)v3;
}

- (NSArray)activeDevices
{
  if (self->_state == 3) {
    return (NSArray *)0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100020E58;
  v6[3] = &unk_100069520;
  v6[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_filteredArrayWithTest:", v6));

  return (NSArray *)v5;
}

- (void)_companionLinkClientDiscoveredDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (-[BMRapportClient _validateDevice:](self, "_validateDevice:", v4))
    {
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained rapportClient:self didDiscoverDevice:v4];
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_companionLinkDeviceIdentifier"));

      if (v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);

        uint64_t v8 = __biome_log_for_category(11LL);
        id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v8);
        BOOL v9 = os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v9) {
            sub_100041F18();
          }
        }

        else if (v9)
        {
          sub_100041EA8();
        }
      }

      else
      {
        uint64_t v10 = __biome_log_for_category(11LL);
        id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
          sub_100041E38();
        }
      }
    }
  }
}

- (void)_companionLinkClientLostDevice:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained rapportClient:self didLoseDevice:v5];
  }
}

- (BOOL)_validateDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bm_companionLinkDeviceIdentifier"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    LOBYTE(v4) = v5 != 0LL;
  }

  return (char)v4;
}

  ;
}

+ (unint64_t)controlFlagsForSameAccountDiscovery
{
  id v2 = +[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform");
  unint64_t result = 38LL;
  switch((unint64_t)v2)
  {
    case 0uLL:
      uint64_t v4 = __biome_log_for_category(11LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100042FF8();
      }

      goto LABEL_7;
    case 1uLL:
    case 8uLL:
      unint64_t result = 6LL;
      break;
    case 2uLL:
      return result;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      unint64_t result = 4LL;
      break;
    case 6uLL:
      unint64_t result = 32LL;
      break;
    default:
LABEL_7:
      unint64_t result = 0LL;
      break;
  }

  return result;
}

+ (unint64_t)controlFlagsForSharedHomeDiscovery
{
  id v2 = +[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform");
  unint64_t result = 2084LL;
  switch((unint64_t)v2)
  {
    case 0uLL:
    case 6uLL:
      uint64_t v4 = __biome_log_for_category(11LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100043078((uint64_t)v2);
      }

      goto LABEL_6;
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
      unint64_t result = 2052LL;
      break;
    case 2uLL:
      return result;
    case 5uLL:
      unint64_t result = 4LL;
      break;
    default:
LABEL_6:
      unint64_t result = 0LL;
      break;
  }

  return result;
}

+ (unint64_t)controlFlagsForMessagingDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 model]);
  uint64_t v4 = BMDevicePlatformFromModelString(v3);

  unint64_t result = 0LL;
  switch(v4)
  {
    case 0LL:
      uint64_t v6 = __biome_log_for_category(11LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100042FF8();
      }

      unint64_t result = 0LL;
      break;
    case 3LL:
    case 4LL:
    case 5LL:
    case 7LL:
      unint64_t result = 0x20000400000LL;
      break;
    case 6LL:
      unint64_t result = 0x400000LL;
      break;
    default:
      return result;
  }

  return result;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v8));

  if (!v11)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v19 = 138412290;
      id v20 = loggingIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "BMRapportClient[%@]: register request",  (uint8_t *)&v19,  0xCu);
    }

    if (self->_state)
    {
      uint64_t v15 = __biome_log_for_category(11LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100043188((uint64_t)self, v16);
      }
    }

    else
    {
      if (!self->_registeredRequests)
      {
        uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        registeredRequests = self->_registeredRequests;
        self->_registeredRequests = v17;
      }

      id v16 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
      -[os_log_s setRequestID:](v16, "setRequestID:", v8);
      -[os_log_s setOptions:](v16, "setOptions:", v9);
      -[os_log_s setHandler:](v16, "setHandler:", v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredRequests,  "setObject:forKeyedSubscript:",  v16,  v8);
    }
  }
}

- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v16));
    id v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v13 handler]);

    if (v14)
    {
      uint64_t v15 = objc_autoreleasePoolPush();
      ((void (**)(void, id, id, id))v14)[2](v14, v10, v11, v12);
      objc_autoreleasePoolPop(v15);
    }
  }
}

- (void)_registerRequests
{
  if (self->_state == 1)
  {
    objc_initWeak(&location, self);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id obj = self->_registeredRequests;
    id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    if (v3)
    {
      uint64_t v4 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v17 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v6));
          client = self->_client;
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          v14[2] = sub_10002F31C;
          v14[3] = &unk_100068CD8;
          objc_copyWeak(&v15, &location);
          v14[4] = v6;
          id v10 = objc_retainBlock(v14);
          objc_destroyWeak(&v15);
          -[RPCompanionLinkClient registerRequestID:options:handler:]( client,  "registerRequestID:options:handler:",  v6,  v9,  v10);
        }

        id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
      }

      while (v3);
    }

    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v11 = __biome_log_for_category(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10004320C((uint64_t)self, v12);
    }
  }

- (void)_deregisterRequests
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = self->_registeredRequests;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RPCompanionLinkClient deregisterRequestID:]( self->_client,  "deregisterRequestID:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
}

@end