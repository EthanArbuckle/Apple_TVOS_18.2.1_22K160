@interface PDSharingChannelManager
- (BOOL)_lock_canTrackHandleForTransportIdentifier:(id)a3 descriptor:(id)a4 existing:(id *)a5;
- (BOOL)canHandleOutstandingMessagesOnEndpoint:(id)a3;
- (BOOL)configureHandle:(id)a3 forDescriptor:(id)a4;
- (BOOL)isDescriptorValid:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDAccessPassSharingIDSService)idsService;
- (PDSharingChannelManager)init;
- (PDSharingChannelManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 pushNotificationManager:(id)a5 idsSharingService:(id)a6;
- (PDSharingChannelMonitor)monitor;
- (id)_createHandleForEndpoint:(id)a3 descriptor:(id)a4 queue:(id)a5;
- (id)_endpointForDescriptor:(id)a3;
- (id)_lock_sharingChannelHandleForEndpoint:(id)a3;
- (id)channelForEndpoint:(id)a3;
- (id)handleForDescriptor:(id)a3 queue:(id)a4;
- (void)_handleDidInvalidateForTransportIdentifier:(id)a3;
- (void)_handleWasInvalidatedForTransportIdentifier:(id)a3 triggeredByClient:(BOOL)a4;
- (void)_lock_addAncillaryService:(id)a3 forTracker:(id)a4;
- (void)_lock_removeAncillaryService:(id)a3;
- (void)_lock_removeAncillaryService:(id)a3 forTracker:(id)a4;
- (void)_lock_removeAncillaryServiceForTracker:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)_sendMessage:(id)a3 toEndpoint:(id)a4 completion:(id)a5;
- (void)addDelegate:(id)a3;
- (void)ancillaryServiceDidTerminate:(id)a3;
- (void)attachForHandle:(id)a3 completion:(id)a4;
- (void)cacheSharingMessageForDescriptor:(id)a3 message:(id)a4;
- (void)closeForHandle:(id)a3 completion:(id)a4;
- (void)descriptorsForAccountDevicesForHandle:(id)a3 completion:(id)a4;
- (void)didHandleMessageForHandle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)didReceiveIDSShareMessage:(id)a3 endpoint:(id)a4;
- (void)didReceiveLocalShareMessage:(id)a3 endpoint:(id)a4;
- (void)endpointWasRemotelyTerminated:(id)a3;
- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4;
- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4 allowCreation:(BOOL)a5;
- (void)fetchHandleTransferTokenForHandle:(id)a3 completion:(id)a4;
- (void)handleOutstandingShareMessage:(id)a3 endpoint:(id)a4;
- (void)pingForHandle:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationForDescriptor:(id)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishForHandle:(id)a3 completion:(id)a4;
- (void)remoteDeviceInformationForHandle:(id)a3 completion:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sendMessageToDescriptor:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sharingChannelHandle:(id)a3 wasInvalidatedRemotelyForEndpoint:(id)a4;
- (void)start;
- (void)startProximityAdvertisementForHandle:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)startProximityDetectionForHandle:(id)a3 advertisement:(id)a4 completion:(id)a5;
- (void)universalShareURLForHandle:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDSharingChannelManager

- (PDSharingChannelManager)init
{
  return 0LL;
}

- (PDSharingChannelManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 pushNotificationManager:(id)a5 idsSharingService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PDSharingChannelManager;
  v15 = -[PDSharingChannelManager init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_databaseManager, a4);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    delegates = v16->_delegates;
    v16->_delegates = (NSHashTable *)v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    trackedHandles = v16->_trackedHandles;
    v16->_trackedHandles = v19;

    v21 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects]( &OBJC_CLASS___NSMapTable,  "pk_createStrongPointerPersonalityToStrongObjects");
    trackedAncillaryServices = v16->_trackedAncillaryServices;
    v16->_trackedAncillaryServices = v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.sharingchannelmanager", 0LL);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.sharingchannelmanager.reply", 0LL);
    replyQueue = v16->_replyQueue;
    v16->_replyQueue = (OS_dispatch_queue *)v25;

    v16->_lock._os_unfair_lock_opaque = 0;
    id v27 = -[PDDynamicAssociatedDomainService initDatabaseManager:]( objc_alloc(&OBJC_CLASS___PDDynamicAssociatedDomainService),  "initDatabaseManager:",  v12);
    v28 = -[PDSharingRelayServerService initWithWebServiceCoordinator:domainService:pushNotificationManager:delegate:]( objc_alloc(&OBJC_CLASS___PDSharingRelayServerService),  "initWithWebServiceCoordinator:domainService:pushNotificationManager:delegate:",  v16->_webServiceCoordinator,  v27,  v13,  v16);
    relayService = v16->_relayService;
    v16->_relayService = v28;

    v30 = -[PDAccessPassSharingIDSService initWithIDSSharingService:delegate:]( objc_alloc(&OBJC_CLASS___PDAccessPassSharingIDSService),  "initWithIDSSharingService:delegate:",  v14,  v16);
    idsService = v16->_idsService;
    v16->_idsService = v30;

    v32 = -[PDSharingLocalOnDeviceService initWithDelegate:]( objc_alloc(&OBJC_CLASS___PDSharingLocalOnDeviceService),  "initWithDelegate:",  v16);
    localOnDeviceService = v16->_localOnDeviceService;
    v16->_localOnDeviceService = v32;

    v34 = -[PDSharingChannelMonitor initWithQueue:webServiceCoordinator:databaseManager:pushNotificationManager:delegate:]( objc_alloc(&OBJC_CLASS___PDSharingChannelMonitor),  "initWithQueue:webServiceCoordinator:databaseManager:pushNotificationManager:delegate:",  v16->_queue,  v16->_webServiceCoordinator,  v16->_databaseManager,  v13,  v16);
    monitor = v16->_monitor;
    v16->_monitor = v34;

    v36 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v37 = -[NSXPCListener initWithMachServiceName:]( v36,  "initWithMachServiceName:",  PKSharingChannelServiceMachServiceName);
    coordinatorListener = v16->_coordinatorListener;
    v16->_coordinatorListener = v37;

    -[NSXPCListener setDelegate:](v16->_coordinatorListener, "setDelegate:", v16);
    -[NSXPCListener resume](v16->_coordinatorListener, "resume");
  }

  return v16;
}

- (void)start
{
}

- (BOOL)isDescriptorValid:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager _endpointForDescriptor:](self, "_endpointForDescriptor:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)handleForDescriptor:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager _endpointForDescriptor:](self, "_endpointForDescriptor:", v6));
  if (!v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(34LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to get endpoint for descriptor: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelManager _createHandleForEndpoint:descriptor:queue:]( self,  "_createHandleForEndpoint:descriptor:queue:",  v8,  v6,  v7));

  return v11;
}

- (void)sendMessageToDescriptor:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager _endpointForDescriptor:](self, "_endpointForDescriptor:", v8));
  if (v11)
  {
    os_unfair_lock_lock(&self->_lock);
    trackedHandles = self->_trackedHandles;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 transportIdentifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](trackedHandles, "objectForKeyedSubscript:", v13));

    if (v14)
    {
      unsigned int v15 = [v14 isServerForRemoteHandle];
      os_unfair_lock_unlock(&self->_lock);
      if (v15 && PKV2SharingFlowEnabled(v16, v17))
      {
        uint64_t Object = PKLogFacilityTypeGetObject(33LL);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v11 transportIdentifier]);
          uint64_t v21 = PKSharingLoggableMailboxAddress(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          *(_DWORD *)buf = 138412546;
          id v41 = v22;
          __int16 v42 = 2112;
          id v43 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "WARNING: Blocking message from being sent on channel %@ because active handle owned by remote process. \n \n message: %@",  buf,  0x16u);
        }

        v10[2](v10, 1LL, 0LL);
        goto LABEL_21;
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }

    uint64_t v26 = PKLogFacilityTypeGetObject(33LL);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v11 transportIdentifier]);
      uint64_t v29 = PKSharingLoggableMailboxAddress(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138412290;
      id v41 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "WARNING: Allowing message to be sent on channel %@ without checking handle.",  buf,  0xCu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 payload]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 displayInformation]);
    id v39 = 0LL;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[PKSharingMessage specializedMessageFromPayload:displayInformation:outError:]( &OBJC_CLASS___PKSharingMessage,  "specializedMessageFromPayload:displayInformation:outError:",  v31,  v32,  &v39));
    id v34 = v39;

    if (v34)
    {
      uint64_t v35 = PKLogFacilityTypeGetObject(34LL);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Failed to create specialized message from %@",  buf,  0xCu);
      }

      uint64_t v37 = PDBasicError(@"Failed to create specialized message");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0LL, v38);
    }

    else
    {
      -[PDSharingChannelManager _sendMessage:toEndpoint:completion:]( self,  "_sendMessage:toEndpoint:completion:",  v33,  v11,  v10);
    }
  }

  else
  {
    uint64_t v23 = PKLogFacilityTypeGetObject(34LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to send message because unable to get endpoint for descriptor: %@ \n\n message: %@",  buf,  0x16u);
    }

    uint64_t v25 = PDBasicError(@"unable to get endpoint for descriptor");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v25);
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0LL, v14);
  }

- (id)_endpointForDescriptor:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 type])
  {
    case 1uLL:
      databaseManager = self->_databaseManager;
      id v6 = (id)objc_claimAutoreleasedReturnValue([v4 transportIdentifier]);
      id v7 = (PDSharingIDSEndpoint *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointForTransportIdentifier:]( databaseManager,  "sharingEndpointForTransportIdentifier:",  v6));
      goto LABEL_56;
    case 2uLL:
      id v6 = (id)objc_claimAutoreleasedReturnValue([v4 transferToken]);
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v9 = self->_trackedHandles;
      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v45,  v49,  16LL);
      if (v10)
      {
        id v11 = v10;
        id v43 = &self->_lock;
        id v44 = v4;
        uint64_t v12 = *(void *)v46;
        while (1)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_trackedHandles,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v45 + 1) + 8LL * (void)i),  v43,  v44,  (void)v45));
            id v15 = (id)objc_claimAutoreleasedReturnValue([v14 transferToken]);
            id v16 = v6;
            uint64_t v17 = v16;
            if (v15 == v16)
            {

LABEL_34:
              v32 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
              id v7 = (PDSharingIDSEndpoint *)objc_claimAutoreleasedReturnValue([v32 endpoint]);

LABEL_35:
              p_lock = v43;
              id v4 = v44;
              goto LABEL_37;
            }

            if (v6 && v15)
            {
              unsigned int v18 = [v15 isEqualToString:v16];

              if (v18) {
                goto LABEL_34;
              }
            }

            else
            {
            }
          }

          id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v45,  v49,  16LL);
          if (!v11)
          {
            id v7 = 0LL;
            goto LABEL_35;
          }
        }
      }

      id v7 = 0LL;
LABEL_37:

      os_unfair_lock_unlock(p_lock);
LABEL_56:

LABEL_57:
      return v7;
    case 3uLL:
      id v6 = v4;
      id v19 = [v6 subtype];
      if (v19 != (id)2)
      {
        if (v19 != (id)1) {
          goto LABEL_32;
        }
        else {
          uint64_t v20 = 1LL;
        }
        relayService = self->_relayService;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v6 region]);
        id v7 = (PDSharingIDSEndpoint *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerService endpointOfType:region:]( relayService,  "endpointOfType:region:",  v20,  v22));
        goto LABEL_55;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChannelURL]);
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v6 existingMailboxIdentifier]);
      v24 = (void *)v33;
      if (v22)
      {
        uint64_t v25 = (PDSharingIDSEndpoint *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerService relayEndpointForMailboxAddress:]( self->_relayService,  "relayEndpointForMailboxAddress:",  v22));
        goto LABEL_40;
      }

      if (v33)
      {
        id v41 = (PDSharingIDSEndpoint *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointForTransportIdentifier:]( self->_databaseManager,  "sharingEndpointForTransportIdentifier:",  v33));
        goto LABEL_46;
      }

      goto LABEL_53;
    case 4uLL:
      id v6 = v4;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
      id v23 = [v6 subtype];
      if (v23 == (id)2) {
        goto LABEL_27;
      }
      if (v23 == (id)1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccessPassSharingIDSService resolveRemoteAddressForDeviceIdentifier:]( self->_idsService,  "resolveRemoteAddressForDeviceIdentifier:",  v22));
        id v7 = -[PDSharingIDSEndpoint initWithDeviceIdentifier:]( objc_alloc(&OBJC_CLASS___PDSharingIDSEndpoint),  "initWithDeviceIdentifier:",  v24);
        -[PDSharingIDSEndpoint setIsDeviceOnSameIDSAccount:](v7, "setIsDeviceOnSameIDSAccount:", 2LL);
        goto LABEL_54;
      }

      if (v23)
      {
        id v7 = 0LL;
        goto LABEL_55;
      }

- (id)_createHandleForEndpoint:(id)a3 descriptor:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
  if (v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v32 = 0LL;
    unsigned int v13 = -[PDSharingChannelManager _lock_canTrackHandleForTransportIdentifier:descriptor:existing:]( self,  "_lock_canTrackHandleForTransportIdentifier:descriptor:existing:",  v11,  v9,  &v32);
    id v14 = v32;
    id v15 = v14;
    if (v13)
    {
      if (v14)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
        [v16 invalidateForTransfer];
      }

      uint64_t v17 = -[PDSharingChannelHandle initWithEndpoint:queue:delegate:dataSource:]( objc_alloc(&OBJC_CLASS___PDSharingChannelHandle),  "initWithEndpoint:queue:delegate:dataSource:",  v8,  v10,  self,  self);
      unsigned int v18 = v17;
      if (!v17) {
        goto LABEL_14;
      }
      databaseManager = self->_databaseManager;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelHandle transportIdentifier](v17, "transportIdentifier"));
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingMessagesForTransportIdentifier:]( databaseManager,  "sharingMessagesForTransportIdentifier:",  v20));

      -[PDSharingChannelHandle didReceiveMessages:](v18, "didReceiveMessages:", v21);
      v22 = -[PDSharingChannelHandleTracker initWithHandle:]( objc_alloc(&OBJC_CLASS___PDSharingChannelHandleTracker),  "initWithHandle:",  v18);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_trackedHandles,  "setObject:forKeyedSubscript:",  v22,  v11);
      uint64_t Object = PKLogFacilityTypeGetObject(34LL);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = PKSharingLoggableMailboxAddress(v11);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 138412290;
        id v34 = v31;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Handle<%@> Tracking ", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v27 = PKLogFacilityTypeGetObject(34LL);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = PKSharingLoggableMailboxAddress(v11);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138412290;
        id v34 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Handle<%@> Attempted to use channel, but channel already in use.",  buf,  0xCu);
      }

      unsigned int v18 = 0LL;
    }

LABEL_14:
    os_unfair_lock_unlock(p_lock);
    id v26 = v18;

    goto LABEL_15;
  }

  id v26 = 0LL;
LABEL_15:

  return v26;
}

- (id)_lock_sharingChannelHandleForEndpoint:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 transportIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_trackedHandles, "objectForKeyedSubscript:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);

  return v6;
}

- (void)cacheSharingMessageForDescriptor:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager _endpointForDescriptor:](self, "_endpointForDescriptor:", a3));
  if (v7)
  {
    databaseManager = self->_databaseManager;
    id v11 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 transportIdentifier]);
    -[PDDatabaseManager insertOrUpdateSharingMessages:storePayloads:transportIdentifier:]( databaseManager,  "insertOrUpdateSharingMessages:storePayloads:transportIdentifier:",  v9,  1LL,  v10);
  }
}

- (void)prewarmEndpointCreationForDescriptor:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  if ([v11 type] != (id)3) {
    goto LABEL_8;
  }
  id v9 = v11;
  if ([v9 subtype] != (id)1)
  {

LABEL_8:
    v8[2](v8, 1LL);
    goto LABEL_9;
  }

  else {
    uint64_t v10 = 1LL;
  }
  -[PDSharingRelayServerService prewarmEndpointCreationOfType:count:completion:]( self->_relayService,  "prewarmEndpointCreationOfType:count:completion:",  v10,  a4,  v8);

LABEL_9:
}

- (void)_handleWasInvalidatedForTransportIdentifier:(id)a3 triggeredByClient:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_trackedHandles,  "objectForKeyedSubscript:",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handle]);
    os_unfair_lock_unlock(&self->_lock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001537F4;
    v12[3] = &unk_100639350;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v9 = v7;
    uint64_t v10 = objc_retainBlock(v12);
    id v11 = v10;
    if (a4 || !v8) {
      ((void (*)(void *))v10[2])(v10);
    }
    else {
      [v8 invalidate];
    }
  }
}

- (void)_handleDidInvalidateForTransportIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointForTransportIdentifier:]( self->_databaseManager,  "sharingEndpointForTransportIdentifier:",  v4));
  id v6 = v5;
  if (v5 && [v5 channelType] == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingMessagesForTransportIdentifier:]( self->_databaseManager,  "sharingMessagesForTransportIdentifier:",  v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1001539C8;
      v9[3] = &unk_100646400;
      id v10 = v8;
      id v11 = v4;
      -[PDSharingChannelManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v9);
    }
  }
}

- (void)addDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = -[NSHashTable copy](self->_delegates, "copy");
  os_unfair_lock_unlock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        replyQueue = self->_replyQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100153BE8;
        block[3] = &unk_1006396B0;
        id v12 = v4;
        block[4] = v10;
        id v15 = v12;
        dispatch_async((dispatch_queue_t)replyQueue, block);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }
}

- (void)_lock_addAncillaryService:(id)a3 forTracker:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_trackedAncillaryServices, "objectForKey:", v8));
  if (!v7)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    -[NSMapTable setObject:forKey:](self->_trackedAncillaryServices, "setObject:forKey:", v7, v8);
  }

  [v7 addObject:v6];
}

- (void)_lock_removeAncillaryService:(id)a3 forTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_trackedAncillaryServices, "objectForKey:", v6));
  id v9 = v8;
  if (v8)
  {
    [v8 removeObject:v7];
    if (![v9 count])
    {
      -[NSMapTable removeObjectForKey:](self->_trackedAncillaryServices, "removeObjectForKey:", v6);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100153D60;
      block[3] = &unk_100639300;
      id v12 = v6;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_lock_removeAncillaryServiceForTracker:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_trackedAncillaryServices, "keyEnumerator"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PDSharingChannelManager _lock_removeAncillaryService:forTracker:]( self,  "_lock_removeAncillaryService:forTracker:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v4,  (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)_lock_removeAncillaryService:(id)a3
{
  id v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_trackedAncillaryServices, "removeObjectForKey:", v4);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153F1C;
  block[3] = &unk_100639300;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)channelForEndpoint:(id)a3
{
  id v4 = [a3 channelType];
  if (v4 == (id)3)
  {
    localOnDeviceService = self->_localOnDeviceService;
  }

  else if (v4 == (id)2)
  {
    localOnDeviceService = self->_idsService;
  }

  else
  {
    if (v4 != (id)1)
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Sharing channel requested for endpoint, but none found");
      id v6 = 0LL;
      return v6;
    }

    localOnDeviceService = self->_relayService;
  }

  id v6 = localOnDeviceService;
  return v6;
}

- (BOOL)canHandleOutstandingMessagesOnEndpoint:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelManager _lock_sharingChannelHandleForEndpoint:]( self,  "_lock_sharingChannelHandleForEndpoint:",  v4));
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    BOOL v6 = 1;
  }

  else
  {
    databaseManager = self->_databaseManager;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 transportIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passShareForTransportIdentifier:]( databaseManager,  "passShareForTransportIdentifier:",  v8));

    BOOL v6 = v9 != 0LL;
    if (!v9)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(34LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 transportIdentifier]);
        uint64_t v13 = PKSharingLoggableMailboxAddress(v12);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        int v16 = 138543362;
        __int128 v17 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDSharingManager: Error: Unable to find active share for endpoint %{public}@",  (uint8_t *)&v16,  0xCu);
      }
    }
  }

  return v6;
}

- (void)handleOutstandingShareMessage:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelManager _lock_sharingChannelHandleForEndpoint:]( self,  "_lock_sharingChannelHandleForEndpoint:",  v7));
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    id v13 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v8 didReceiveMessages:v9];
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100154238;
    v10[3] = &unk_100646400;
    id v11 = v6;
    id v12 = v7;
    -[PDSharingChannelManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v10);

    id v9 = v11;
  }
}

- (void)endpointWasRemotelyTerminated:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transportIdentifier]);
  uint64_t Object = PKLogFacilityTypeGetObject(34LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = PKSharingLoggableMailboxAddress(v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    __int128 v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Deleting endpoint %@ because it was terminated remotely.",  buf,  0xCu);
  }

  -[PDDatabaseManager deleteSharingEndpoint:](self->_databaseManager, "deleteSharingEndpoint:", v4);
  -[PDSharingChannelManager _handleWasInvalidatedForTransportIdentifier:triggeredByClient:]( self,  "_handleWasInvalidatedForTransportIdentifier:triggeredByClient:",  v5,  0LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001543E0;
  v11[3] = &unk_100646428;
  id v12 = v5;
  id v10 = v5;
  -[PDSharingChannelManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v11);
}

- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4
{
}

- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4 allowCreation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
  id v11 = v10;
  if (v9)
  {
    id v12 = v10;
    id v13 = v9;
    if (v12 == v13)
    {
      char v14 = 0;
    }

    else if (v12)
    {
      char v14 = [v12 isEqualToString:v13] ^ 1;
    }

    else
    {
      char v14 = 1;
    }
  }

  else
  {
    char v14 = 0;
    id v13 = v10;
  }

  id v15 = v13;
  if (a5
    || (int v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointForTransportIdentifier:]( self->_databaseManager,  "sharingEndpointForTransportIdentifier:",  v15)),  v16,  v16))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PDDatabaseManager insertSharingEndpoint:](self->_databaseManager, "insertSharingEndpoint:", v8);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_trackedHandles,  "objectForKeyedSubscript:",  v15));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
    [v19 setEndpoint:v8];

    if ((v14 & 1) != 0)
    {
      -[PDDatabaseManager deleteSharingEndpointForTransportIdentifier:]( self->_databaseManager,  "deleteSharingEndpointForTransportIdentifier:",  v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_trackedHandles,  "setObject:forKeyedSubscript:",  0LL,  v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_trackedHandles,  "setObject:forKeyedSubscript:",  v18,  v11);
      uint64_t Object = PKLogFacilityTypeGetObject(34LL);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = PKSharingLoggableMailboxAddress(v9);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = PKSharingLoggableMailboxAddress(v11);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        int v27 = 138412546;
        uint64_t v28 = v23;
        __int16 v29 = 2112;
        v30 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Handle<%@> Changed to %@",  (uint8_t *)&v27,  0x16u);
      }

      os_unfair_lock_unlock(p_lock);
      if (v18 && [v18 isServerForRemoteHandle])
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
        [v26 didReceiveUpdatedTransportIdentifier:v11 reply:0];
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)didReceiveIDSShareMessage:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transportIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointForTransportIdentifier:]( self->_databaseManager,  "sharingEndpointForTransportIdentifier:",  v8));
  id v10 = v9;
  if (v9)
  {
    if ([v9 channelType] != (id)2)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(34LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v17 = 0;
        id v13 = "WARNING: Received IDS message, but existing channel is not IDS. Ignoring message.";
        goto LABEL_10;
      }

- (void)didReceiveLocalShareMessage:(id)a3 endpoint:(id)a4
{
  databaseManager = self->_databaseManager;
  id v11 = a3;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transportIdentifier", v11));
  -[PDDatabaseManager insertOrUpdateSharingMessages:storePayloads:transportIdentifier:]( databaseManager,  "insertOrUpdateSharingMessages:storePayloads:transportIdentifier:",  v9,  1LL,  v10);

  -[PDSharingChannelManager handleOutstandingShareMessage:endpoint:]( self,  "handleOutstandingShareMessage:endpoint:",  v8,  v7);
}

- (void)sharingChannelHandle:(id)a3 wasInvalidatedRemotelyForEndpoint:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "transportIdentifier", a3));
  -[PDSharingChannelManager _handleWasInvalidatedForTransportIdentifier:triggeredByClient:]( self,  "_handleWasInvalidatedForTransportIdentifier:triggeredByClient:",  v5,  1LL);
}

- (BOOL)configureHandle:(id)a3 forDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager _endpointForDescriptor:](self, "_endpointForDescriptor:", v7));
  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
    id v28 = 0LL;
    BOOL v11 = -[PDSharingChannelManager _lock_canTrackHandleForTransportIdentifier:descriptor:existing:]( self,  "_lock_canTrackHandleForTransportIdentifier:descriptor:existing:",  v10,  v7,  &v28);
    id v12 = v28;
    id v13 = v12;
    if (!v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(34LL);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = PKSharingLoggableMailboxAddress(v10);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138412290;
        id v30 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Handle<%@> Attempted to use channel, but channel already in use.",  buf,  0xCu);
      }

      goto LABEL_15;
    }

    if (v12)
    {
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
      [v14 invalidateForTransfer];

      uint64_t v15 = PKLogFacilityTypeGetObject(34LL);
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = PKSharingLoggableMailboxAddress(v10);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138412290;
        id v30 = v18;
        __int128 v19 = "Handle<%@> Transferring";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }

    else
    {
      uint64_t v25 = PKLogFacilityTypeGetObject(34LL);
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = PKSharingLoggableMailboxAddress(v10);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138412290;
        id v30 = v18;
        __int128 v19 = "Handle<%@> Tracking";
        goto LABEL_13;
      }
    }

    uint64_t v22 = -[PDSharingChannelHandleTracker initWithHandle:]( objc_alloc(&OBJC_CLASS___PDSharingChannelHandleTracker),  "initWithHandle:",  v6);
    -[os_log_s setIsServerForRemoteHandle:](v22, "setIsServerForRemoteHandle:", 1LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedHandles, "setObject:forKeyedSubscript:", v22, v10);
    [v6 setEndpoint:v8];
LABEL_15:

    os_unfair_lock_unlock(p_lock);
    goto LABEL_16;
  }

  uint64_t v20 = PKLogFacilityTypeGetObject(34LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to get endpoint to configure handled for descriptor: %@",  buf,  0xCu);
  }

  LOBYTE(v11) = 0;
LABEL_16:

  return v11;
}

- (BOOL)_lock_canTrackHandleForTransportIdentifier:(id)a3 descriptor:(id)a4 existing:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_trackedHandles, "objectForKeyedSubscript:", a3));
  id v10 = v9;
  if (v9)
  {
    if (a5) {
      *a5 = v9;
    }
    if ([v8 type] == (id)2)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 transferToken]);
      id v12 = (id)objc_claimAutoreleasedReturnValue([v10 transferToken]);
      id v13 = v11;
      char v14 = v13;
      if (v12 == v13)
      {
        unsigned __int8 v15 = 1;
      }

      else
      {
        unsigned __int8 v15 = 0;
        if (v13 && v12) {
          unsigned __int8 v15 = [v12 isEqualToString:v13];
        }
      }
    }

    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (void)ancillaryServiceDidTerminate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PDSharingChannelManager _lock_removeAncillaryService:](self, "_lock_removeAncillaryService:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)pingForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 endpoint]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v7));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100154E04;
  v10[3] = &unk_100639688;
  id v11 = v6;
  id v9 = v6;
  [v8 pingEndpoint:v7 completion:v10];
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 endpoint]);
  -[PDSharingChannelManager _sendMessage:toEndpoint:completion:]( self,  "_sendMessage:toEndpoint:completion:",  v9,  v10,  v8);
}

- (void)_sendMessage:(id)a3 toEndpoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100154F7C;
  v15[3] = &unk_100646450;
  v15[4] = self;
  id v16 = v8;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v9));
  id v19 = v10;
  id v17 = v9;
  id v11 = v18;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 sendMessageTo:v13 message:v14 completion:v15];
}

- (void)attachForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100155178;
  v12[3] = &unk_100646478;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v9 checkOutstandingMessagesOn:v8 completion:v12];
}

- (void)closeForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100155424;
  v12[3] = &unk_1006464A0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 closeEndpoint:v8 completion:v12];
}

- (void)relinquishForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10015559C;
  v12[3] = &unk_1006464A0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 relinquishEndpoint:v8 completion:v12];
}

- (void)didHandleMessageForHandle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 endpoint]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transportIdentifier]);
  uint64_t Object = PKLogFacilityTypeGetObject(34LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = PKSharingLoggableMailboxAddress(v11);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handle<%@> Handled message %@", buf, 0x16u);
  }

  databaseManager = self->_databaseManager;
  id v18 = v8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  -[PDDatabaseManager insertOrUpdateSharingMessages:storePayloads:transportIdentifier:]( databaseManager,  "insertOrUpdateSharingMessages:storePayloads:transportIdentifier:",  v17,  0LL,  v11);

  v9[2](v9);
}

- (void)universalShareURLForHandle:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue([a3 endpoint]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingChannelManager channelForEndpoint:](self, "channelForEndpoint:", v11));
  [v10 universalShareURLForEndpoint:v11 urlDecoration:v9 completion:v8];
}

- (void)fetchHandleTransferTokenForHandle:(id)a3 completion:(id)a4
{
  p_lock = &self->_lock;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_trackedHandles, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v11, "UUIDString"));

    [v10 setTransferToken:v12];
    os_unfair_lock_unlock(p_lock);
    uint64_t Object = PKLogFacilityTypeGetObject(34LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = PKSharingLoggableMailboxAddress(v9);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v21 = 138412546;
      id v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Handle<%@> Created transfer token: '%@'",  (uint8_t *)&v21,  0x16u);
    }

    v7[2](v7, v12);
    id v7 = (void (**)(id, uint64_t))v12;
  }

  else
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(34LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = PKSharingLoggableMailboxAddress(v9);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      int v21 = 138412290;
      id v22 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Handle<%@> Failed create transfer token",  (uint8_t *)&v21,  0xCu);
    }

    v7[2](v7, 0LL);
  }
}

- (void)descriptorsForAccountDevicesForHandle:(id)a3 completion:(id)a4
{
  id v5 = a4;
  idsService = self->_idsService;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100155A84;
  v8[3] = &unk_1006415E8;
  id v9 = v5;
  id v7 = v5;
  -[PDAccessPassSharingIDSService devicesWithCompletion:](idsService, "devicesWithCompletion:", v8);
}

- (void)remoteDeviceInformationForHandle:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 endpoint]);
  id v7 = [v6 channelType];
  if (v7 == (id)2)
  {
    -[PDAccessPassSharingIDSService remoteDeviceInformationForEndpoint:completion:]( self->_idsService,  "remoteDeviceInformationForEndpoint:completion:",  v6,  v8);
    goto LABEL_6;
  }

  if (v7 == (id)3) {
LABEL_4:
  }
    v8[2](v8, 0LL);
LABEL_6:
}

- (void)startProximityAdvertisementForHandle:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  id v9 = (void (**)(void, void))v8;
  if (a4 == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_trackedAncillaryServices, "keyEnumerator"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pk_firstObjectPassingTest:", &stru_100646520));

    if (!v12) {
      id v12 = -[PDSharingChannel_BLEProximityVerificationAncillaryService initAdvertiserDelegate:completion:]( objc_alloc(&OBJC_CLASS___PDSharingChannel_BLEProximityVerificationAncillaryService),  "initAdvertiserDelegate:completion:",  self,  &stru_100646540);
    }
    trackedHandles = self->_trackedHandles;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v20 transportIdentifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](trackedHandles, "objectForKeyedSubscript:", v14));

    if (v15)
    {
      -[PDSharingChannelManager _lock_addAncillaryService:forTracker:]( self,  "_lock_addAncillaryService:forTracker:",  v12,  v15);
      os_unfair_lock_unlock(&self->_lock);
      if (v12)
      {
        id v16 = objc_alloc(&OBJC_CLASS___PKContinuityProximityBLEAdvertisement);
        uint64_t v17 = PKSerialNumber();
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v19 = [v16 initWithIdentifier:v18];
        ((void (**)(void, id))v9)[2](v9, v19);

        [v12 start];
        goto LABEL_11;
      }
    }

    else
    {

      os_unfair_lock_unlock(&self->_lock);
    }

    v9[2](v9, 0LL);

    goto LABEL_11;
  }

  if (!a4) {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
LABEL_11:
}

- (void)startProximityDetectionForHandle:(id)a3 advertisement:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100155E7C;
  v12[3] = &unk_100646568;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v8;
  id v10 = v16;
  id v11 = v13;
  [v9 remoteDeviceInformation:v12];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  signed int v6 = [v5 processIdentifier];
  id v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
  if ((-[PKEntitlementWhitelist sharingAllAccess](v7, "sharingAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentAllAccess](v7, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(4LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109120;
      LODWORD(v19) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDSharingChannelManager: Adding connection from pid: %d",  (uint8_t *)&v18,  8u);
    }

    id v10 = -[PDSharingChannelHandle_Server initWithConnection:queue:delegate:dataSource:]( objc_alloc(&OBJC_CLASS___PDSharingChannelHandle_Server),  "initWithConnection:queue:delegate:dataSource:",  v5,  self->_replyQueue,  self,  self);
    uint64_t v11 = PDSharingChannelServiceInterface_Server();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 setExportedInterface:v12];

    uint64_t v13 = PKSharingChannelServiceInterface_Client([v5 setExportedObject:v10]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v5 setRemoteObjectInterface:v14];

    [v5 resume];
    BOOL v15 = 1;
  }

  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(4LL);
    id v10 = (PDSharingChannelHandle_Server *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218240;
      id v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "PDSharingChannelManager: rejecting connection %p - remote process %ld missing entitlement com.apple.wallet.appli cation-authorization.",  (uint8_t *)&v18,  0x16u);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (PDSharingChannelMonitor)monitor
{
  return self->_monitor;
}

- (PDAccessPassSharingIDSService)idsService
{
  return self->_idsService;
}

- (void).cxx_destruct
{
}

@end