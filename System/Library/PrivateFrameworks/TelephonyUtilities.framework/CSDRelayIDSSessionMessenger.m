@interface CSDRelayIDSSessionMessenger
- (BOOL)deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:(id)a3 needsConversationRelaySupport:(BOOL)a4;
- (CSDRelayIDSDualSession)currentSession;
- (CSDRelayIDSDualSession)waitingSession;
- (CSDRelayIDSSessionMessenger)initWithQueue:(id)a3 localRouteController:(id)a4;
- (CSDRouteController)localRouteController;
- (IDSDestination)destinationWithActiveSession;
- (IDSDevice)deviceWithActiveSession;
- (NSMutableArray)sessions;
- (OS_dispatch_queue)queue;
- (id)_createSessionToDestinations:(id)a3;
- (id)_createSessionToDevices:(id)a3;
- (id)_createSessionsToAllDevicesSupportingProvider:(id)a3 requiresConversationRelaySupport:(BOOL)a4;
- (id)activeSessionForIdentifier:(id)a3;
- (id)deviceForFromID:(id)a3;
- (id)sessionForIdentifier:(id)a3;
- (int)sessionProtocolVersionForIdentifier:(id)a3;
- (void)_destroySession:(id)a3;
- (void)_sendMessage:(id)a3 andCancelInvitationIfNecessaryForSession:(id)a4;
- (void)_sendMessage:(id)a3 andDeclineInvitationIfNecessaryForSession:(id)a4;
- (void)_startSession:(id)a3 withMessage:(id)a4 identifiers:(id)a5 timeout:(int64_t)a6 declineOnError:(BOOL)a7;
- (void)acceptInvitationForIdentifier:(id)a3;
- (void)cancelOrDeclineInvitationForIdentifier:(id)a3;
- (void)dealloc;
- (void)endEndingSessions;
- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4;
- (void)prepareConnectedSessionsToEnd;
- (void)prepareSessionToEndForIdentifier:(id)a3;
- (void)sendMessage:(id)a3 andAcceptInvitationIfNecessaryForIdentifier:(id)a4;
- (void)sendMessage:(id)a3 andCancelOrDeclineInvitationIfNecessaryForIdentifier:(id)a4;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDevicesSupportingProvider:(id)a5 requiresConversationRelay:(BOOL)a6 withTimeout:(int64_t)a7;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifiers:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 customizedForRemoteProtocolVersion:(id)a4 completionHandler:(id)a5;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 completionHandler:(id)a6;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 waitUntilConnected:(BOOL)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5 customizedForRemoteProtocolVersion:(id)a6 waitUntilConnected:(BOOL)a7 completionHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)session:(id)a3 endedWithReason:(int)a4;
- (void)session:(id)a3 receivedData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)setSessions:(id)a3;
@end

@implementation CSDRelayIDSSessionMessenger

- (CSDRelayIDSSessionMessenger)initWithQueue:(id)a3 localRouteController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDRelayIDSSessionMessenger;
  v9 = -[CSDRelayIDSSessionMessenger init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    sessions = v10->_sessions;
    v10->_sessions = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_localRouteController, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    [v13 addServiceDelegate:v10 queue:v10->_queue];
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  [v3 removeServiceDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayIDSSessionMessenger;
  -[CSDRelayIDSSessionMessenger dealloc](&v4, "dealloc");
}

- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v7));
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001885C8;
    v11[3] = &unk_1003DC1E0;
    v12 = (os_log_s *)v6;
    [v8 performBlockOnTransportAvailability:v11];
    v9 = v12;
  }

  else
  {
    id v10 = sub_1001704C4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find session for identifier %@ to perform block on transport availability for. Dropping this bl ock on the floor",  buf,  0xCu);
    }
  }
}

- (IDSDestination)destinationWithActiveSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteDestination]);

  return (IDSDestination *)v3;
}

- (IDSDevice)deviceWithActiveSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteDevice]);

  return (IDSDevice *)v3;
}

- (id)_createSessionsToAllDevicesSupportingProvider:(id)a3 requiresConversationRelaySupport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", &__NSArray0__struct);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 devices]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (objc_msgSend(v16, "canReceiveMessagesForCallProvider:", v6, (void)v25)
          && (!v4 || [v16 canReceiveRelayedGFTCalls]))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 destination]);
          [v10 addObject:v17];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }

    while (v13);
  }

  if ([v10 count])
  {
    v18 = (os_log_s *)[v10 copy];
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSSessionMessenger _createSessionToDestinations:]( self,  "_createSessionToDestinations:",  v18));
    -[NSMutableSet addObject:](v7, "addObject:", v19);
  }

  else
  {
    id v20 = sub_1001704C4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        v21 = @"YES";
      }
      else {
        v21 = @"NO";
      }
      id v22 = objc_msgSend(v11, "count", (void)v25);
      *(_DWORD *)buf = 138412802;
      id v30 = v6;
      __int16 v31 = 2112;
      v32 = v21;
      __int16 v33 = 2048;
      id v34 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No primary devices found that support call provider %@, requiresConversationRelaySupport %@. primaryAccountDevic es count: %lu, not creating a session.",  buf,  0x20u);
    }
  }

  id v23 = -[NSMutableSet copy](v7, "copy");
  return v23;
}

- (id)_createSessionToDevices:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating session to devices: %@", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 destination]);
        if (v13)
        {
          [v6 addObject:v13];
        }

        else
        {
          id v14 = sub_1001704C4();
          objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] destination for device returned a nil value, so we are going to skip creating a session to it: %@",  buf,  0xCu);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v9);
  }

  id v16 = [v6 copy];
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSSessionMessenger _createSessionToDestinations:]( self,  "_createSessionToDestinations:",  v16));

  return v17;
}

- (id)_createSessionToDestinations:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Creating session to destinations: %@",  (uint8_t *)&v12,  0xCu);
  }

  if ([v3 count])
  {
    id v6 = objc_alloc(&OBJC_CLASS___IDSSession);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 account]);
    id v9 = -[IDSSession initWithAccount:destinations:transportType:]( v6,  "initWithAccount:destinations:transportType:",  v8,  v3,  0LL);
  }

  else
  {
    id v10 = sub_1001704C4();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Would have created a session to an empty destination set. Returning a nil session",  (uint8_t *)&v12,  2u);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (void)_destroySession:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Destroying session %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions"));
  [v7 removeObject:v4];

  [v4 setDelegate:0];
}

- (CSDRelayIDSDualSession)waitingSession
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    id v7 = 0LL;
    int v8 = v5;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(id *)(*((void *)&v10 + 1) + 8LL * (void)v7);

      id v7 = (char *)v7 + 1;
      int v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v5 = 0LL;
  }

  return (CSDRelayIDSDualSession *)v5;
}

- (CSDRelayIDSDualSession)currentSession
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    id v7 = 0LL;
    int v8 = v5;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(id *)(*((void *)&v10 + 1) + 8LL * (void)v7);

      id v7 = (char *)v7 + 1;
      int v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }

        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    id v5 = 0LL;
  }

  return (CSDRelayIDSDualSession *)v5;
}

- (id)activeSessionForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 hasIdentifier:v4] && (int)objc_msgSend(v9, "state") <= 3)
        {
          id v6 = v9;
          goto LABEL_12;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)sessionForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    __int128 v10 = 0LL;
    __int128 v11 = v8;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v10);

      __int128 v10 = (char *)v10 + 1;
      __int128 v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v8 = 0LL;
  }

  return v8;
}

- (int)sessionProtocolVersionForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", a3));
  int v4 = [v3 remoteProtocolVersion];

  return v4;
}

- (void)prepareSessionToEndForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Asked to prepare session to end for identifier %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v4));
  [v7 prepareToEnd];
}

- (void)prepareConnectedSessionsToEnd
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Asked to prepare connected sessions to end",  buf,  2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)acceptInvitationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Accepting session for identifier %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  0LL);
  -[CSDRelayIDSSessionMessenger sendMessage:andAcceptInvitationIfNecessaryForIdentifier:]( self,  "sendMessage:andAcceptInvitationIfNecessaryForIdentifier:",  v7,  v4);
}

- (void)cancelOrDeclineInvitationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceling/declining session for identifier %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  0LL);
  -[CSDRelayIDSSessionMessenger sendMessage:andCancelOrDeclineInvitationIfNecessaryForIdentifier:]( self,  "sendMessage:andCancelOrDeclineInvitationIfNecessaryForIdentifier:",  v7,  v4);
}

- (void)endEndingSessions
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked to end ending sessions", buf, 2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)_startSession:(id)a3 withMessage:(id)a4 identifiers:(id)a5 timeout:(int64_t)a6 declineOnError:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [v13 addProtocolVersion];
  __int128 v15 = objc_alloc(&OBJC_CLASS___CSDIDSDualSessionProvider);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 queue]);
  __int128 v21 = -[CSDIDSDualSessionProvider initWithSession:queue:](v15, "initWithSession:queue:", v14, v17);

  id v18 = -[CSDRelayIDSDualSession initAsInitiatorWithSessionProvider:identifiers:]( objc_alloc(&OBJC_CLASS___CSDRelayIDSDualSession),  "initAsInitiatorWithSessionProvider:identifiers:",  v21,  v12);
  [v18 setDelegate:self];
  [v18 setInvitationTimeout:(double)a6];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v13 data]);

  [v18 sendDataAndSendInvitationIfNecessary:v19 declineOnError:v7];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions"));
  [v20 addObject:v18];
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDevicesSupportingProvider:(id)a5 requiresConversationRelay:(BOOL)a6 withTimeout:(int64_t)a7
{
  BOOL v8 = a6;
  id v59 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      __int128 v16 = @"YES";
    }
    else {
      __int128 v16 = @"NO";
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v59 typeString]);
    *(_DWORD *)buf = 138413058;
    id v69 = v13;
    __int16 v70 = 2112;
    v71 = v16;
    __int16 v72 = 2112;
    v73 = v17;
    __int16 v74 = 2112;
    id v75 = v59;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sendMessageAndStartSessionIfNecessary for service %@ requiresConversationRelay %@ and message type %@: %@",  buf,  0x2Au);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v12));
  if (v18)
  {
    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1002B9AD8();
    }
    goto LABEL_9;
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));

  if (v23)
  {
    id v24 = v13;
    unsigned int v25 = -[CSDRelayIDSSessionMessenger deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:needsConversationRelaySupport:]( self,  "deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:needsConversationRelaySupport:",  v13,  v8);
    id v26 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v27 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      id v13 = v24;
      if (v27)
      {
        if (v8) {
          __int128 v28 = @"YES";
        }
        else {
          __int128 v28 = @"NO";
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
        *(_DWORD *)buf = 138412802;
        id v69 = v24;
        __int16 v70 = 2112;
        v71 = v28;
        __int16 v72 = 2112;
        v73 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "A session exists with a destination/device that supports provider %@ and support conversation relay %@ : %@",  buf,  0x20u);
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
      int v31 = [v30 remoteProtocolVersion];

      if (v31 > 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger deviceWithActiveSession](self, "deviceWithActiveSession"));

        id v33 = sub_1001704C4();
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v32)
        {
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Starting another session to the device",  buf,  2u);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger deviceWithActiveSession](self, "deviceWithActiveSession"));
          v65 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));
          uint64_t v38 = objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger _createSessionToDevices:](self, "_createSessionToDevices:", v37));
        }

        else
        {
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Starting another session to the destination",  buf,  2u);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSSessionMessenger destinationWithActiveSession]( self,  "destinationWithActiveSession"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v36));
          uint64_t v38 = objc_claimAutoreleasedReturnValue( -[CSDRelayIDSSessionMessenger _createSessionToDestinations:]( self,  "_createSessionToDestinations:",  v37));
        }

        __int128 v22 = (void *)v38;

        id v13 = v24;
        if (v22)
        {
          id v64 = v12;
          v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v64,  1LL));
          -[CSDRelayIDSSessionMessenger _startSession:withMessage:identifiers:timeout:declineOnError:]( self,  "_startSession:withMessage:identifiers:timeout:declineOnError:",  v22,  v59,  v57,  a7,  0LL);

LABEL_12:
          goto LABEL_13;
        }

- (BOOL)deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:(id)a3 needsConversationRelaySupport:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger destinationWithActiveSession](self, "destinationWithActiveSession"));
  if ([v7 canReceiveMessagesForCallProvider:v6])
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger deviceWithActiveSession](self, "deviceWithActiveSession"));
    unsigned __int8 v8 = [v9 canReceiveMessagesForCallProvider:v6];
  }

  return v8 & !a4;
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v17 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  -[CSDRelayIDSSessionMessenger sendMessage:andStartSessionIfNecessaryForIdentifiers:toDestination:timeout:completionHandler:]( self,  "sendMessage:andStartSessionIfNecessaryForIdentifiers:toDestination:timeout:completionHandler:",  v15,  v16,  v13,  a6,  v12,  v17);
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifiers:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, uint64_t, uint64_t))a7;
  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 typeString]);
    *(_DWORD *)buf = 138412546;
    id v52 = v18;
    __int16 v53 = 2112;
    id v54 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "sendMessageAndStartSessionIfNecessary for message type %@: %@",  buf,  0x16u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v19));

  if (v20)
  {
    id v21 = sub_1001704C4();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1002B9B48(v13, (uint64_t)v20, v22);
    }

LABEL_7:
    uint64_t v23 = 0LL;
    id v24 = 0LL;
    goto LABEL_8;
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));

  if (!v25)
  {
    id v40 = sub_1001704C4();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v42)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "[WARN] No IDSSession exists, and given device is nil. We can't start this session",  buf,  2u);
      }

      goto LABEL_7;
    }

    if (v42)
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "No IDSSession exists. Starting a new one by inviting to destination %@",  buf,  0xCu);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayIDSSessionMessenger _createSessionToDestinations:]( self,  "_createSessionToDestinations:",  v36));
LABEL_23:

    if (v24)
    {
      uint64_t v23 = 1LL;
      -[CSDRelayIDSSessionMessenger _startSession:withMessage:identifiers:timeout:declineOnError:]( self,  "_startSession:withMessage:identifiers:timeout:declineOnError:",  v24,  v12,  v13,  a6,  1LL);
    }

    else
    {
      uint64_t v23 = 0LL;
    }

- (void)sendMessage:(id)a3 andAcceptInvitationIfNecessaryForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
    int v33 = 138412802;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "sendMessage:andAcceptInvitationIfNecessaryForIdentifier for identifier %@ and message type %@: %@",  (uint8_t *)&v33,  0x20u);
  }

  [v6 addProtocolVersion];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v7));
  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    id v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Session for identifier is %@",  (uint8_t *)&v33,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
  if (v14)
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
      int v33 = 138412290;
      id v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "A current session already exists: %@",  (uint8_t *)&v33,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
    int v19 = [v18 remoteProtocolVersion];

    id v20 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19 > 0)
    {
      if (v22)
      {
        int v33 = 138412290;
        id v34 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Sending the message through the current session and declining this one %@",  (uint8_t *)&v33,  0xCu);
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
      [v23 mergeSession:v11];

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
      [v24 sendDataAndAcceptInvitationIfNecessary:v25];

      [v11 sendDataAndDeclineInvitationIfNecessary:0];
      goto LABEL_23;
    }

    if (v22)
    {
      LOWORD(v33) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Sending the message through the current session",  (uint8_t *)&v33,  2u);
    }

    int v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
    [v30 addIdentifier:v7];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
    [v29 sendDataAndAcceptInvitationIfNecessary:v31];

LABEL_19:
    goto LABEL_23;
  }

  id v26 = sub_1001704C4();
  BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  __int128 v28 = v27;
  if (v11)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      id v34 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No current session already exists, so sending the message through this session %@",  (uint8_t *)&v33,  0xCu);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
    [v11 sendDataAndAcceptInvitationIfNecessary:v29];
    goto LABEL_19;
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessions](self, "sessions"));
    int v33 = 138412802;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v32;
    _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Could not determine session to accept for identifier %@ and message %@. All sessions: %@",  (uint8_t *)&v33,  0x20u);
  }

LABEL_23:
}

- (void)sendMessage:(id)a3 andCancelOrDeclineInvitationIfNecessaryForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
    int v19 = 138412802;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "sendMessage:andCancelOrDeclineInvitationIfNecessaryForIdentifier for identifier %@ and message type %@: %@",  (uint8_t *)&v19,  0x20u);
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v7));
  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Session for identifier is %@",  (uint8_t *)&v19,  0xCu);
  }

  if (v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 allIdentifiers]);
    id v15 = [v14 count];

    if ((unint64_t)v15 < 2)
    {
      if ([v11 isInitiator]) {
        -[CSDRelayIDSSessionMessenger _sendMessage:andCancelInvitationIfNecessaryForSession:]( self,  "_sendMessage:andCancelInvitationIfNecessaryForSession:",  v6,  v11);
      }
      else {
        -[CSDRelayIDSSessionMessenger _sendMessage:andDeclineInvitationIfNecessaryForSession:]( self,  "_sendMessage:andDeclineInvitationIfNecessaryForSession:",  v6,  v11);
      }
    }

    else
    {
      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 allIdentifiers]);
        int v19 = 138412546;
        id v20 = v18;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Session has multiple identifiers: %@. Removing identifier %@ and not canceling/declining",  (uint8_t *)&v19,  0x16u);
      }

      -[CSDRelayIDSSessionMessenger sendMessage:forIdentifier:](self, "sendMessage:forIdentifier:", v6, v7);
      [v11 removeIdentifier:v7];
    }
  }
}

- (void)_sendMessage:(id)a3 andCancelInvitationIfNecessaryForSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 typeString]);
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_sendMessage:andCancelInvitationIfNecessaryForIdentifier for session %@ and message type %@: %@",  (uint8_t *)&v13,  0x20u);
  }

  id v10 = sub_1001704C4();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session for identifier is %@",  (uint8_t *)&v13,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
  [v6 sendDataAndCancelInvitationIfNecessary:v12];
}

- (void)_sendMessage:(id)a3 andDeclineInvitationIfNecessaryForSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 typeString]);
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_sendMessage:andDeclineInvitationIfNecessaryForIdentifier for session %@ and message type %@: %@",  (uint8_t *)&v13,  0x20u);
  }

  [v5 addProtocolVersion];
  id v10 = sub_1001704C4();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session for identifier is %@",  (uint8_t *)&v13,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
  [v6 sendDataAndDeclineInvitationIfNecessary:v12];
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5
{
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)sendMessage:(id)a3 customizedForRemoteProtocolVersion:(id)a4 completionHandler:(id)a5
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 completionHandler:(id)a6
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 waitUntilConnected:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5 customizedForRemoteProtocolVersion:(id)a6 waitUntilConnected:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  __int16 v17 = (void (**)(id, id, _BYTE *))a6;
  id v18 = (void (**)(id, uint64_t))a8;
  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 typeString]);
    *(_DWORD *)buf = 138413058;
    id v39 = v21;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 1024;
    LODWORD(v45) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "for message type: %@ identifier: %@ destinations: %@ waitUntilConnected: %d",  buf,  0x26u);
  }

  id v22 = sub_1001704C4();
  __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "identifier: %@ message: %@", buf, 0x16u);
  }

  if (v15) {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger sessionForIdentifier:](self, "sessionForIdentifier:", v15));
  }
  else {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
  }
  unsigned int v25 = v24;
  if (v24)
  {
    objc_msgSend(v14, "customizeForProtocolVersion:", objc_msgSend(v24, "remoteProtocolVersion"));
    char v37 = 0;
    if (v17 && (v17[2](v17, [v25 remoteProtocolVersion], &v37), v37))
    {
      id v26 = sub_1001704C4();
      BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 typeString]);
        *(_DWORD *)buf = 138412546;
        id v39 = v28;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Not sending message because protocolVersionCustomizationBlock's preventMessageSend was set to YES for message type %@: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v29 = sub_1001704C4();
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v14 typeString]);
          *(_DWORD *)buf = 138413058;
          id v39 = v25;
          __int16 v40 = 2112;
          id v41 = v32;
          __int16 v42 = 2112;
          id v43 = v16;
          __int16 v44 = 2112;
          id v45 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "sendMessage through session %@ for message type %@ to destinations %@: %@",  buf,  0x2Au);
        }

        BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 data]);
        [v25 sendData:v27 toDestinations:v16 completion:v18];
      }

      else
      {
        if (v31)
        {
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 typeString]);
          *(_DWORD *)buf = 138412802;
          id v39 = v25;
          __int16 v40 = 2112;
          id v41 = v36;
          __int16 v42 = 2112;
          id v43 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "sendMessage through session %@ for message type %@: %@",  buf,  0x20u);
        }

        BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 data]);
        [v25 sendData:v27 waitUntilConnected:v9 completion:v18];
      }
    }
  }

  else
  {
    id v33 = sub_1001704C4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v14 typeString]);
      *(_DWORD *)buf = 138412546;
      id v39 = v35;
      __int16 v40 = 2112;
      id v41 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "No session available to send message type %@: %@",  buf,  0x16u);
    }

    if (v18) {
      v18[2](v18, 1LL);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v38 = a3;
  id v39 = a4;
  id v42 = a5;
  id v13 = a6;
  id v41 = a7;
  __int16 v44 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithURI:]( &OBJC_CLASS___IDSDestination,  "destinationWithURI:",  v13));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceForFromID:v13]);

  id v43 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v41);
  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
  id v16 = sub_1001704C4();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v18 timeIntervalSince1970];
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v42;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v55 = v44;
    *(_WORD *)v56 = 2112;
    *(void *)&v56[2] = v15;
    *(_WORD *)&v56[10] = 2112;
    *(void *)&v56[12] = v43;
    __int16 v57 = 2048;
    uint64_t v58 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Invite received for session %@ from (fromID=%@) destination %@ device %@ with message %@ (timestamp: %f)",  buf,  0x3Eu);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
  if (!v20) {
    goto LABEL_8;
  }
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger destinationWithActiveSession](self, "destinationWithActiveSession"));
  if ([v44 isEqual:v21])
  {

LABEL_8:
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger destinationWithActiveSession](self, "destinationWithActiveSession"));
      unsigned int v26 = [v44 isEqual:v25];
      if (v15)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger deviceWithActiveSession](self, "deviceWithActiveSession"));
        unsigned int v27 = [v15 isEqual:v7];
      }

      else
      {
        unsigned int v27 = 0;
      }

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v26;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v27;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v28 == 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "... and it's from the same destination that we have an active session with (%d) or it's from the same device tha t we have an active session with (%d) or we don't have a session (%d)",  buf,  0x14u);

      if (v15) {
    }
      }

    if (v43)
    {
      *(void *)buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v55 = sub_10018BA50;
      *(void *)v56 = sub_10018BA60;
      *(void *)&v56[8] = self->_queue;
      objc_initWeak(&location, self);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10018BA68;
      v45[3] = &unk_1003DC258;
      id v51 = buf;
      objc_copyWeak(&v52, &location);
      id v46 = v40;
      uint64_t v47 = v43;
      id v48 = v42;
      uint64_t v49 = v44;
      id v50 = v15;
      [v46 checkShouldIgnoreSessionInviteWithMessage:v47 fromDestination:v49 completion:v45];

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_30;
    }

    id v29 = sub_1001704C4();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "... but there was no accompanying message so just ignoring the invite",  buf,  2u);
    }

- (id)deviceForFromID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceForFromID:v3]);

  return v5;
}

- (void)session:(id)a3 endedWithReason:(int)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    LODWORD(v22) = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Session ended with reason %d",  (uint8_t *)&v21,  8u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 allIdentifiers]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger activeSessionForIdentifier:](self, "activeSessionForIdentifier:", v11));

  if (v12)
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      unsigned __int8 v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not notifying delegate of messenger connection end because a different active session with the same identifier exists: %@",  (uint8_t *)&v21,  0xCu);
    }
  }

  else if (a4 >= 5)
  {
    if (a4 == 5)
    {
      id v19 = sub_1001704C4();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Notifying delegate that connection could not establish link",  (uint8_t *)&v21,  2u);
      }

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 allIdentifiers]);
      objc_msgSend( v9,  "messengerConnectionCouldNotEstablishLink:forIdentifiers:didStartConnecting:",  self,  v14,  objc_msgSend(v6, "hasStartedConnecting"));
    }

    else
    {
      if (a4 != 6) {
        goto LABEL_11;
      }
      id v17 = sub_1001704C4();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Notifying delegate of connection failure",  (uint8_t *)&v21,  2u);
      }

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 allIdentifiers]);
      objc_msgSend( v9,  "messengerConnectionFailed:forIdentifiers:didStartConnecting:",  self,  v14,  objc_msgSend(v6, "hasStartedConnecting"));
    }
  }

  else
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Notifying delegate of connection end",  (uint8_t *)&v21,  2u);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 allIdentifiers]);
    objc_msgSend( v9,  "messengerConnectionEnded:forIdentifiers:didStartConnecting:",  self,  v14,  objc_msgSend(v6, "hasStartedConnecting"));
  }

LABEL_11:
  -[CSDRelayIDSSessionMessenger _destroySession:](self, "_destroySession:", v6);
}

- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v11);
    objc_msgSend( v10,  "setReceiverProtocolVersion:",  -[CSDMessagingRelayMessage protocolVersion](v14, "protocolVersion"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
    [v15 messenger:self handledMessage:v14 fromDestination:v12 device:v13];
  }

  else
  {
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received invitation accept with no data payload.",  v18,  2u);
    }
  }
}

- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
  if (v11)
  {
    id v15 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v11);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteDevice]);
    [v14 messenger:self handledMessage:v15 fromDestination:v13 device:v16];
  }

  else
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received invitation cancel with no data payload. Assuming the invitation was answered elsewhere",  v19,  2u);
    }

    id v15 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  5LL);
    [v14 messenger:self handledMessage:v15 fromDestination:v13 device:v12];
  }
}

- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v13 = a3;
    id v14 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v10);
    objc_msgSend( v13,  "setReceiverProtocolVersion:",  -[CSDMessagingRelayMessage protocolVersion](v14, "protocolVersion"));

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
    [v15 messenger:self handledMessage:v14 fromDestination:v11 device:v12];
  }

  else
  {
    id v16 = a3;
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received invitation decline with no data payload. Assuming invitation was accepted by sending a message through another session",  v20,  2u);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSSessionMessenger currentSession](self, "currentSession"));
    [v19 mergeSession:v16];
  }
}

- (void)session:(id)a3 receivedData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayIDSMessenger delegate](self, "delegate"));
  if ((int)[v16 remoteProtocolVersion] <= 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifiersForSessionInvitationWithMessage:v13]);
    [v16 addIdentifiers:v15];
  }

  [v14 messenger:self handledMessage:v13 fromDestination:v10 device:v11];
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end