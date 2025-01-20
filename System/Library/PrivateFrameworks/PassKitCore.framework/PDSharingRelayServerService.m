@interface PDSharingRelayServerService
- (PDSharingRelayServerService)init;
- (PDSharingRelayServerService)initWithWebServiceCoordinator:(id)a3 domainService:(id)a4 pushNotificationManager:(id)a5 delegate:(id)a6;
- (id)endpointOfType:(unint64_t)a3 region:(id)a4;
- (id)relayEndpointForMailboxAddress:(id)a3;
- (unint64_t)type;
- (void)_updatePassbookAssosiatedDomainsForSharing;
- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4;
- (void)closeEndpoint:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)pingEndpoint:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishEndpoint:(id)a3 completion:(id)a4;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDSharingRelayServerService

- (PDSharingRelayServerService)init
{
  return 0LL;
}

- (PDSharingRelayServerService)initWithWebServiceCoordinator:(id)a3 domainService:(id)a4 pushNotificationManager:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerService;
  v15 = -[PDSharingRelayServerService init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_domainService, a4);
    objc_storeStrong((id *)&v16->_delegate, a6);
    v17 = objc_alloc_init(&OBJC_CLASS___PDAppAttestService);
    appAttestService = v16->_appAttestService;
    v16->_appAttestService = v17;

    objc_storeStrong((id *)&v16->_pushNotificationManager, a5);
    v16->_lock._os_unfair_lock_opaque = 0;
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    availablePushNotificationTokens = v16->_availablePushNotificationTokens;
    v16->_availablePushNotificationTokens = v19;

    -[PDSharingRelayServerService _updatePassbookAssosiatedDomainsForSharing]( v16,  "_updatePassbookAssosiatedDomainsForSharing");
    -[PDPaymentWebServiceCoordinator registerObserver:](v16->_webServiceCoordinator, "registerObserver:", v16);
  }

  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerService;
  -[PDSharingRelayServerService dealloc](&v3, "dealloc");
}

- (id)relayEndpointForMailboxAddress:(id)a3
{
  id v4 = a3;
  v5 = -[PDSharingRelayServerEndpoint initWithProvisioningType:]( objc_alloc(&OBJC_CLASS___PDSharingRelayServerEndpoint),  "initWithProvisioningType:",  0LL);
  sub_10016E170((uint64_t)self, v5, v4);
  -[PDSharingRelayServerEndpoint setMailboxStatus:](v5, "setMailboxStatus:", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_webServiceCoordinator,  "sharedWebServiceContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  uint64_t v8 = PKCurrentRegion();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allowedRelayServerHostsForRegion:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingRelayServerEndpoint relayServerHost](v5, "relayServerHost"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 host]);

  unsigned int v13 = [v10 containsObject:v12];
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      uint64_t v17 = PKSharingLoggableMailboxAddress(v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v21 = 138543619;
      objc_super v22 = v18;
      __int16 v23 = 2113;
      v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "RelayServer: Evaluated %{public}@ and created endpoint %{private}@",  (uint8_t *)&v21,  0x16u);
    }

    v19 = v5;
  }

  else
  {
    if (v16)
    {
      int v21 = 138543362;
      objc_super v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "RelayServer: Evaluated %{public}@, but host not allowed.",  (uint8_t *)&v21,  0xCu);
    }

    v19 = 0LL;
  }

  return v19;
}

- (id)endpointOfType:(unint64_t)a3 region:(id)a4
{
  id v6 = a4;
  v7 = -[PDSharingRelayServerEndpoint initWithProvisioningType:]( objc_alloc(&OBJC_CLASS___PDSharingRelayServerEndpoint),  "initWithProvisioningType:",  a3);
  uint64_t v8 = sub_10016E35C((uint64_t)self, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[PDSharingRelayServerEndpoint setRelayServerHost:](v7, "setRelayServerHost:", v9);
  return v7;
}

- (unint64_t)type
{
  return 1LL;
}

- (void)pingEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
    uint64_t v11 = PKSharingLoggableMailboxAddress(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "RelayServer: pinging remote mailbox %{public}@",  buf,  0xCu);
  }

  unsigned int v13 = objc_alloc(&OBJC_CLASS___PDSharingRelayServerPingMailboxRequest);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 relayServerHost]);
  BOOL v16 = -[PDSharingRelayServerRequest initWithMailboxIdentifier:relayServerHost:]( v13,  "initWithMailboxIdentifier:relayServerHost:",  v14,  v15);

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___PDSharingRelayServerPingResponse, v17);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10016E6B4;
  v21[3] = &unk_100647580;
  id v22 = v6;
  id v23 = v7;
  id v19 = v7;
  id v20 = v6;
  sub_10016E7BC((uint64_t)self, v16, v18, v21);
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  else {
    sub_10016EBA8((uint64_t)self, v10, v9, 0LL, v8);
  }
}

- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 mailboxStatus] == (id)4)
  {
    uint64_t v8 = PDBasicError(@"mailbox already deleted");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, 0LL, v9);
  }

  else
  {
    id v10 = objc_alloc(&OBJC_CLASS___PDSharingRelayServerGetMailboxRequest);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 relayServerHost]);
    unsigned int v13 = -[PDSharingRelayServerRequest initWithMailboxIdentifier:relayServerHost:]( v10,  "initWithMailboxIdentifier:relayServerHost:",  v11,  v12);

    id v14 = sub_10016F3D0((uint64_t)self, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[PDSharingRelayServerRequest setDeviceClaim:](v13, "setDeviceClaim:", v15);

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___PDSharingRelayServerGetMailboxResponse, v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100170268;
    v18[3] = &unk_100647698;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    sub_10016E7BC((uint64_t)self, v13, v17, v18);
  }
}

- (void)closeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
    uint64_t v11 = PKSharingLoggableMailboxAddress(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "RelayServer: Deleting remote mailbox %{public}@",  buf,  0xCu);
  }

  unsigned int v13 = objc_alloc(&OBJC_CLASS___PDSharingRelayServerDeleteMailboxRequest);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 relayServerHost]);
  uint64_t v16 = -[PDSharingRelayServerRequest initWithMailboxIdentifier:relayServerHost:]( v13,  "initWithMailboxIdentifier:relayServerHost:",  v14,  v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceClaim]);
  -[PDSharingRelayServerRequest setDeviceClaim:](v16, "setDeviceClaim:", v17);

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___PDSharingRelayServerEmptyResponse, v18);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001708AC;
  v22[3] = &unk_1006476C0;
  id v23 = v6;
  v24 = self;
  id v25 = v7;
  id v20 = v7;
  id v21 = v6;
  sub_10016E7BC((uint64_t)self, v16, v19, v22);
}

- (void)relinquishEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char IsActive = PDSharingRelayServerEndpointStatusIsActive((unint64_t)[v6 mailboxStatus]);
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((IsActive & 1) != 0)
  {
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
      uint64_t v13 = PKSharingLoggableMailboxAddress(v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "RelayServer: relinquishing remote mailbox %@",  buf,  0xCu);
    }

    v15 = objc_alloc(&OBJC_CLASS___PDSharingRelayServerRelinquishMailboxRequest);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 relayServerHost]);
    uint64_t v18 = -[PDSharingRelayServerRequest initWithMailboxIdentifier:relayServerHost:]( v15,  "initWithMailboxIdentifier:relayServerHost:",  v16,  v17);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceClaim]);
    -[PDSharingRelayServerRequest setDeviceClaim:](v18, "setDeviceClaim:", v19);

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___PDSharingRelayServerEmptyResponse, v20);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100170C84;
    v26[3] = &unk_1006476C0;
    id v27 = v6;
    v28 = self;
    id v29 = v7;
    sub_10016E7BC((uint64_t)self, v18, v21, v26);
  }

  else
  {
    if (v11)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
      uint64_t v23 = PKSharingLoggableMailboxAddress(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "RelayServer: cannot relinquish inactive remote mailbox %{public}@",  buf,  0xCu);
    }

    uint64_t v25 = PDBasicError(@"mailbox not active");
    uint64_t v18 = (PDSharingRelayServerRelinquishMailboxRequest *)objc_claimAutoreleasedReturnValue(v25);
    (*((void (**)(id, void, PDSharingRelayServerRelinquishMailboxRequest *))v7 + 2))(v7, 0LL, v18);
  }
}

- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if ([v7 doesRemoteMailboxExist])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 relayServerHost]);
    if (v10)
    {
      BOOL v11 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v10,  0LL);
      -[NSURLComponents setScheme:](v11, "setScheme:", @"https");
      uint64_t v12 = PKSharingRelayServerRequestVersion;
      uint64_t v13 = PKSharingRelayServerMailboxURI;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 transportIdentifier]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/v%@/%@/%@",  v12,  v13,  v14));
      -[NSURLComponents setPath:](v11, "setPath:", v15);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadEncryptionPassword]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);
      -[NSURLComponents setFragment:](v11, "setFragment:", v17);

      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (v8)
      {
        uint64_t v19 = (char *)[v8 vertical] - 1;
        if ((unint64_t)v19 <= 2)
        {
          id v20 = *(id *)*(&off_1006477C8 + (void)v19);
          if (v20)
          {
            uint64_t v21 = v20;
            id v22 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
            uint64_t v23 = -[NSURLQueryItem initWithName:value:](v22, "initWithName:value:", PKSharingURLVerticalKey, v21);
            -[NSMutableArray addObject:](v18, "addObject:", v23);
          }
        }
      }

      -[NSURLComponents setQueryItems:](v11, "setQueryItems:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v11, "URL"));
      if (v24)
      {
        v9[2](v9, v24, 0LL);
      }

      else
      {
        uint64_t v35 = PDBasicError(@"Unable to create share url");
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        ((void (**)(id, void *, void *))v9)[2](v9, 0LL, v36);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(33LL);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v7 transportIdentifier]);
        uint64_t v33 = PKSharingLoggableMailboxAddress(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543362;
        v38 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "RelayServer: Unable to generate share url for mailbox %{public}@ because it is missing a host",  buf,  0xCu);
      }

      BOOL v11 = (NSURLComponents *)objc_claimAutoreleasedReturnValue(+[NSError pkSharingError:](&OBJC_CLASS___NSError, "pkSharingError:", 1LL));
      ((void (**)(id, void *, NSURLComponents *))v9)[2](v9, 0LL, v11);
    }
  }

  else
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(33LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v7 transportIdentifier]);
      uint64_t v28 = PKSharingLoggableMailboxAddress(v27);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "RelayServer: Unable to generate share url for mailbox %{public}@ because it doesn't exist on server",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError pkSharingError:](&OBJC_CLASS___NSError, "pkSharingError:", 1LL));
    ((void (**)(id, void *, void *))v9)[2](v9, 0LL, v10);
  }
}

- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void (**)(void, void))v8;
  if (a3 == 2)
  {
    id v10 = sub_10017139C((uint64_t)self, 0LL);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    os_unfair_lock_lock(&self->_lock);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_availablePushNotificationTokens,  "objectForKeyedSubscript:",  v11));
    id v13 = [v12 count];

    os_unfair_lock_unlock(&self->_lock);
    unint64_t v14 = a4 - (void)v13;
    if (a4 <= (unint64_t)v13)
    {
      v9[2](v9, 1LL);
    }

    else
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      v22[0] = 0LL;
      v22[1] = v22;
      v22[2] = 0x3032000000LL;
      v22[3] = sub_10016F460;
      void v22[4] = sub_10016F470;
      id v23 = 0LL;
      do
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100171530;
        v21[3] = &unk_10063BBC8;
        void v21[4] = self;
        v21[5] = v22;
        [v15 addOperation:v21];
        --v14;
      }

      while (v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10017166C;
      v18[3] = &unk_100647710;
      id v20 = v22;
      uint64_t v19 = v9;
      id v17 = [v15 evaluateWithInput:v16 completion:v18];

      _Block_object_dispose(v22, 8);
    }
  }

  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1LL);
  }
}

- (void)_updatePassbookAssosiatedDomainsForSharing
{
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_webServiceCoordinator,  "sharedWebServiceContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v22 configuration]);
  uint64_t v3 = PKCurrentRegion();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 relayServerHostsToHandleUniversalLinksForRegion:v4]);

  id v6 = objc_alloc_init(&OBJC_CLASS___PDDynamicAssociatedDomainPattern);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/v%@/%@/*",  PKSharingRelayServerRequestVersion,  PKSharingRelayServerMailboxURI));
  -[PDDynamicAssociatedDomainPattern setUri:](v6, "setUri:", v7);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    id v13 = (PDDynamicAssociatedDomain *)PKWalletUniversalLinkHostName;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = (PDDynamicAssociatedDomain *)*(id *)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v16 = v13;
        if (v15 == v13) {
          goto LABEL_15;
        }
        id v17 = v15;
        if (v15) {
          BOOL v18 = v13 == 0LL;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {

LABEL_14:
          uint64_t v16 = -[PDDynamicAssociatedDomain initWithHost:]( objc_alloc(&OBJC_CLASS___PDDynamicAssociatedDomain),  "initWithHost:",  v17);
          id v27 = v6;
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v27,  1LL));
          -[PDDynamicAssociatedDomain setPatterns:](v16, "setPatterns:", v20);

          -[NSMutableArray addObject:](v8, "addObject:", v16);
LABEL_15:

          continue;
        }

        unsigned __int8 v19 = -[PDDynamicAssociatedDomain isEqualToString:](v15, "isEqualToString:", v13);

        if ((v19 & 1) == 0) {
          goto LABEL_14;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v11);
  }

  -[PDDynamicAssociatedDomainService setAdditionalAssociatedDomains:completion:]( self->_domainService,  "setAdditionalAssociatedDomains:completion:",  v8,  &stru_1006477A8);
}

- (void).cxx_destruct
{
}

@end