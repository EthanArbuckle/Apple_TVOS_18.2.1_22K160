@interface CSDRelayIDSDualSession
- (BOOL)hasIdentifier:(id)a3;
- (BOOL)hasReceivedAccept;
- (BOOL)hasStarted;
- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteDestination:(id)a5 remoteDevice:(id)a6 remoteProtocolVersion:(id)a7 identifiers:(id)a8;
- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (CSDRelayIDSDualSessionDelegate)delegate;
- (IDSDestination)remoteDestination;
- (IDSDevice)remoteDevice;
- (NSArray)allIdentifiers;
- (NSData)acceptPayloadData;
- (NSMutableArray)blocksPendingTransportAvailability;
- (NSMutableArray)pendingData;
- (NSMutableSet)identifiers;
- (id)initAsInitiatorWithSessionProvider:(id)a3 identifiers:(id)a4;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteDestination:(id)a4 remoteDevice:(id)a5 remoteProtocolVersion:(int)a6 identifiers:(id)a7;
- (id)transport;
- (void)addIdentifier:(id)a3;
- (void)addIdentifiers:(id)a3;
- (void)dealloc;
- (void)mergeSession:(id)a3;
- (void)pendData:(id)a3 completion:(id)a4;
- (void)performBlockOnTransportAvailability:(id)a3;
- (void)prepareToEnd;
- (void)removeIdentifier:(id)a3;
- (void)removeIdentifiers:(id)a3;
- (void)removePendingData;
- (void)runBlocksPendingTransportAvailability:(BOOL)a3;
- (void)runBlocksPendingTransportAvailabilityIfNecessary:(BOOL)a3;
- (void)sendData:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)sendData:(id)a3 waitUntilConnected:(BOOL)a4 completion:(id)a5;
- (void)sendDataAndAcceptInvitationIfNecessary:(id)a3;
- (void)sendDataAndCancelInvitationIfNecessary:(id)a3;
- (void)sendDataAndDeclineInvitationIfNecessary:(id)a3;
- (void)sendDataAndSendInvitationIfNecessary:(id)a3 declineOnError:(BOOL)a4;
- (void)sendPendingData;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionProviderStarted:(id)a3;
- (void)setAcceptPayloadData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasReceivedAccept:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setRemoteDestination:(id)a3;
- (void)setRemoteDevice:(id)a3;
@end

@implementation CSDRelayIDSDualSession

- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  [v7 handleFailureInMethod:a2 object:self file:@"CSDRelayIDSDualSession.m" lineNumber:57 description:@"Use another initializer instead"];

  return 0LL;
}

- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteDestination:(id)a5 remoteDevice:(id)a6 remoteProtocolVersion:(id)a7 identifiers:(id)a8
{
  BOOL v12 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CSDRelayIDSDualSession;
  v18 = -[CSDIDSDualSession initWithSessionProvider:isInitiator:remoteProtocolVersion:]( &v29,  "initWithSessionProvider:isInitiator:remoteProtocolVersion:",  a3,  v12,  a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_remoteDestination, a5);
    objc_storeStrong((id *)&v19->_remoteDevice, a6);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingData = v19->_pendingData;
    v19->_pendingData = (NSMutableArray *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v17));
    identifiers = v19->_identifiers;
    v19->_identifiers = (NSMutableSet *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    blocksPendingTransportAvailability = v19->_blocksPendingTransportAvailability;
    v19->_blocksPendingTransportAvailability = (NSMutableArray *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](v19, "sessionProvider"));
    v30[0] = IDSLinkPreferenceOptionPacketsPerSecondKey;
    v30[1] = IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v31[0] = &off_1003F16C0;
    v31[1] = &off_1003F16D8;
    v30[2] = IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v30[3] = IDSLinkPreferenceOptionIntent;
    v31[2] = &off_1003F16D8;
    v31[3] = @"forceBTClassic";
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));
    [v26 setStreamPreferences:v27];
  }

  return v19;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3 identifiers:(id)a4
{
  return -[CSDRelayIDSDualSession initWithSessionProvider:isInitiator:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:]( self,  "initWithSessionProvider:isInitiator:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:",  a3,  1LL,  0LL,  0LL,  0LL,  a4);
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteDestination:(id)a4 remoteDevice:(id)a5 remoteProtocolVersion:(int)a6 identifiers:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  id v17 = -[CSDRelayIDSDualSession initWithSessionProvider:isInitiator:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:]( self,  "initWithSessionProvider:isInitiator:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:",  v15,  0LL,  v14,  v13,  v16,  v12);

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDRelayIDSDualSession;
  -[CSDRelayIDSDualSession dealloc](&v3, "dealloc");
}

- (id)transport
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDRelayIDSDualSession;
  objc_super v3 = -[CSDIDSDualSession transport](&v8, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession remoteDestination](self, "remoteDestination"));
  [v4 setRemoteDestination:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession remoteDevice](self, "remoteDevice"));
  [v4 setRemoteDevice:v6];

  return v4;
}

- (NSArray)allIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (BOOL)hasIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  [v5 addObject:v4];
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  [v5 addObjectsFromArray:v4];
}

- (void)removeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  [v5 removeObject:v4];
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
        [v10 removeObject:v9];

        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)mergeSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession identifiers](self, "identifiers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allIdentifiers]);
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  [v7 removeAllObjects];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "blocksPendingTransportAvailability", 0));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[CSDRelayIDSDualSession performBlockOnTransportAvailability:]( self,  "performBlockOnTransportAvailability:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12));
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 blocksPendingTransportAvailability]);
  [v13 removeAllObjects];
}

- (void)runBlocksPendingTransportAvailabilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CSDRelayIDSDualSession hasStarted](self, "hasStarted")
    && (-[CSDRelayIDSDualSession hasReceivedAccept](self, "hasReceivedAccept")
     || !-[CSDIDSDualSession isInitiator](self, "isInitiator")))
  {
    -[CSDRelayIDSDualSession runBlocksPendingTransportAvailability:](self, "runBlocksPendingTransportAvailability:", v3);
  }

  else
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138413058;
      objc_super v8 = self;
      __int16 v9 = 1024;
      unsigned int v10 = -[CSDRelayIDSDualSession hasStarted](self, "hasStarted");
      __int16 v11 = 1024;
      unsigned int v12 = -[CSDRelayIDSDualSession hasReceivedAccept](self, "hasReceivedAccept");
      __int16 v13 = 1024;
      unsigned int v14 = -[CSDIDSDualSession isInitiator](self, "isInitiator");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ not running pending blocks yet because self.hasStarted=%d self.hasReceivedAccept=%d self.isInitiator=%d",  (uint8_t *)&v7,  0x1Eu);
    }
  }

- (void)runBlocksPendingTransportAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession blocksPendingTransportAvailability](self, "blocksPendingTransportAvailability"));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v9 = *(void (***)(void, void, void))(*((void *)&v19 + 1) + 8LL * (void)i);
        if (v3) {
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession transport](self, "transport"));
        }
        else {
          unsigned int v10 = 0LL;
        }
        id v11 = sub_1001704C4();
        unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = objc_retainBlock(v9);
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession acceptPayloadData](self, "acceptPayloadData"));
          *(_DWORD *)buf = 138413058;
          __int128 v15 = @"non-nil";
          if (!v14) {
            __int128 v15 = @"nil";
          }
          uint64_t v24 = self;
          __int16 v25 = 2112;
          id v26 = v13;
          __int16 v27 = 2112;
          v28 = v10;
          __int16 v29 = 2112;
          v30 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "self: %@ running block %@ with transport %@ and %@ accept payload data",  buf,  0x2Au);
        }

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession acceptPayloadData](self, "acceptPayloadData"));
        ((void (**)(void, void *, void *))v9)[2](v9, v10, v16);
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
    }

    while (v6);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSDualSession blocksPendingTransportAvailability]( self,  "blocksPendingTransportAvailability"));
  [v17 removeAllObjects];
}

- (void)performBlockOnTransportAvailability:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_retainBlock(v4);
    *(_DWORD *)buf = 138412546;
    __int128 v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ pending block on transport availability: %@",  buf,  0x16u);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSDualSession blocksPendingTransportAvailability]( self,  "blocksPendingTransportAvailability"));
  id v9 = objc_retainBlock(v4);
  [v8 addObject:v9];

  -[CSDRelayIDSDualSession runBlocksPendingTransportAvailabilityIfNecessary:]( self,  "runBlocksPendingTransportAvailabilityIfNecessary:",  1LL);
  dispatch_time_t v10 = dispatch_time(0LL, 20000000000LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10005C270;
  v14[3] = &unk_1003D82B0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_after(v10, v12, v14);
}

- (void)pendData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___CSDRelayIDSDualSessionData);
  -[CSDRelayIDSDualSessionData setData:](v9, "setData:", v7);

  -[CSDRelayIDSDualSessionData setCompletion:](v9, "setCompletion:", v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession pendingData](self, "pendingData"));
  [v8 addObject:v9];
}

- (void)sendPendingData
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession pendingData](self, "pendingData"));
  id v4 = [v3 copy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession pendingData](self, "pendingData"));
  [v5 removeAllObjects];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data", (void)v14));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 completion]);
        -[CSDRelayIDSDualSession sendData:waitUntilConnected:completion:]( self,  "sendData:waitUntilConnected:completion:",  v12,  1LL,  v13);
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)removePendingData
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession pendingData](self, "pendingData"));
  id v4 = [v3 copy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession pendingData](self, "pendingData"));
  [v5 removeAllObjects];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completion", (void)v14));

        if (v12)
        {
          id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v11 completion]);
          v13[2](v13, 1LL);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)sendData:(id)a3 waitUntilConnected:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    __int128 v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendData self: %@", (uint8_t *)&v21, 0xCu);
  }

  unsigned int v12 = -[CSDIDSDualSession state](self, "state");
  if (v12 - 1 < 2)
  {
    id v16 = sub_1001704C4();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v18)
      {
        int v21 = 138412290;
        __int128 v22 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not connected and waitUntilConnected is YES. Pending data",  (uint8_t *)&v21,  0xCu);
      }

      -[CSDRelayIDSDualSession pendData:completion:](self, "pendData:completion:", v8, v9);
      goto LABEL_24;
    }

    if (v18)
    {
      int v21 = 138412290;
      __int128 v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not connected but waitUntilConnected is NO. Sending data",  (uint8_t *)&v21,  0xCu);
    }

    goto LABEL_19;
  }

  if (v12 - 4 < 2)
  {
    id v13 = sub_1001704C4();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      __int128 v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Session %@ is ending/ended. Dropping data on the floor",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v15 = 1LL;
LABEL_20:

    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }

  if (v12 == 3)
  {
    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      __int128 v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Session %@ is connected. Sending data",  (uint8_t *)&v21,  0xCu);
    }

LABEL_19:
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
    -[os_log_s sendData:](v14, "sendData:", v8);
    uint64_t v15 = 0LL;
    goto LABEL_20;
  }

  uint64_t v15 = 0LL;
  if (v9)
  {
LABEL_23:
    v9[2](v9, v15);
LABEL_24:
  }

- (void)sendData:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = sub_1001704C4();
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    __int128 v20 = self;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "self: %@ destinations: %@",  (uint8_t *)&v19,  0x16u);
  }

  unsigned int v13 = -[CSDIDSDualSession state](self, "state");
  if (v13 - 2 >= 4)
  {
    if (v13 != 1)
    {
      uint64_t v16 = 0LL;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    id v17 = sub_1001704C4();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      __int128 v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Session %@ is waiting. Sending data",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
    [v15 sendData:v8 toDestinations:v9];
    uint64_t v16 = 0LL;
  }

  else
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      __int128 v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not waiting. Dropping data on the floor",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v16 = 1LL;
  }

  if (v10) {
LABEL_8:
  }
    v10[2](v10, v16);
LABEL_9:
}

- (void)sendDataAndSendInvitationIfNecessary:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"non-nil";
    if (!v6) {
      id v9 = @"nil";
    }
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    unsigned int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v10, 0x16u);
  }

  -[CSDIDSDualSession _sendInvitationWithData:declineOnError:alwaysSendData:]( self,  "_sendInvitationWithData:declineOnError:alwaysSendData:",  v6,  v4,  0LL);
}

- (void)sendDataAndAcceptInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"non-nil";
    if (!v4) {
      id v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CSDIDSDualSession _acceptInvitationWithData:alwaysSendData:]( self,  "_acceptInvitationWithData:alwaysSendData:",  v4,  1LL);
}

- (void)sendDataAndCancelInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"non-nil";
    if (!v4) {
      id v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CSDIDSDualSession _cancelInvitationWithData:reason:alwaysSendData:]( self,  "_cancelInvitationWithData:reason:alwaysSendData:",  v4,  0LL,  1LL);
}

- (void)sendDataAndDeclineInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"non-nil";
    if (!v4) {
      id v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CSDIDSDualSession _declineInvitationWithData:alwaysSendData:]( self,  "_declineInvitationWithData:alwaysSendData:",  v4,  1LL);
}

- (void)prepareToEnd
{
  unsigned int v3 = -[CSDIDSDualSession state](self, "state");
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == 3)
  {
    if (v6)
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting session %@ to ending for prepareToEnd",  (uint8_t *)&v7,  0xCu);
    }

    -[CSDIDSDualSession setState:](self, "setState:", 4LL);
  }

  else
  {
    if (v6)
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not setting session %@ to ending for prepareToEnd because session is not connected",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)sessionProviderStarted:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayIDSDualSession;
  -[CSDIDSDualSession sessionProviderStarted:](&v4, "sessionProviderStarted:", a3);
  -[CSDRelayIDSDualSession sendPendingData](self, "sendPendingData");
  -[CSDRelayIDSDualSession setHasStarted:](self, "setHasStarted:", 1LL);
  -[CSDRelayIDSDualSession runBlocksPendingTransportAvailabilityIfNecessary:]( self,  "runBlocksPendingTransportAvailabilityIfNecessary:",  1LL);
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  -[CSDRelayIDSDualSession removePendingData](self, "removePendingData");
  -[CSDRelayIDSDualSession runBlocksPendingTransportAvailability:](self, "runBlocksPendingTransportAvailability:", 0LL);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDRelayIDSDualSession;
  -[CSDIDSDualSession sessionProvider:endedWithReason:error:]( &v10,  "sessionProvider:endedWithReason:error:",  v9,  v5,  v8);
}

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  -[CSDRelayIDSDualSession setHasReceivedAccept:](self, "setHasReceivedAccept:", 1LL);
  -[CSDRelayIDSDualSession setAcceptPayloadData:](self, "setAcceptPayloadData:", v8);
  -[CSDRelayIDSDualSession runBlocksPendingTransportAvailabilityIfNecessary:]( self,  "runBlocksPendingTransportAvailabilityIfNecessary:",  1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession delegate](self, "delegate"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithURI:](&OBJC_CLASS___IDSDestination, "destinationWithURI:", v7));
  -[CSDRelayIDSDualSession setRemoteDestination:](self, "setRemoteDestination:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceForFromID:v7]);
  -[CSDRelayIDSDualSession setRemoteDevice:](self, "setRemoteDevice:", v11);
  id v12 = sub_1001704C4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received invitation ACCEPT with data for session %@ from (fromID=%@) destination %@ device %@",  (uint8_t *)&v14,  0x2Au);
  }

  [v9 session:self receivedInvitationAcceptWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession delegate](self, "delegate"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithURI:](&OBJC_CLASS___IDSDestination, "destinationWithURI:", v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceForFromID:v7]);
  id v12 = sub_1001704C4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received invitation CANCEL with data for session %@ from (fromID=%@) destination %@ device %@",  (uint8_t *)&v14,  0x2Au);
  }

  [v9 session:self receivedInvitationCancelWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession delegate](self, "delegate"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithURI:](&OBJC_CLASS___IDSDestination, "destinationWithURI:", v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceForFromID:v7]);
  id v12 = sub_1001704C4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received invitation DECLINE with data for session %@ from (fromID=%@) destination %@ device %@",  (uint8_t *)&v14,  0x2Au);
  }

  [v9 session:self receivedInvitationDeclineWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSDualSession delegate](self, "delegate"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithURI:](&OBJC_CLASS___IDSDestination, "destinationWithURI:", v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceForFromID:v7]);
  id v12 = sub_1001704C4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received session MESSAGE for session %@ from (fromID=%@) destination %@ device %@",  (uint8_t *)&v14,  0x2Au);
  }

  [v9 session:self receivedData:v8 fromDestination:v10 device:v11];
}

- (CSDRelayIDSDualSessionDelegate)delegate
{
  return (CSDRelayIDSDualSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSDestination)remoteDestination
{
  return self->_remoteDestination;
}

- (void)setRemoteDestination:(id)a3
{
}

- (IDSDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSMutableArray)pendingData
{
  return self->_pendingData;
}

- (NSMutableSet)identifiers
{
  return self->_identifiers;
}

- (NSMutableArray)blocksPendingTransportAvailability
{
  return self->_blocksPendingTransportAvailability;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasReceivedAccept
{
  return self->_hasReceivedAccept;
}

- (void)setHasReceivedAccept:(BOOL)a3
{
  self->_hasReceivedAccept = a3;
}

- (NSData)acceptPayloadData
{
  return self->_acceptPayloadData;
}

- (void)setAcceptPayloadData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end