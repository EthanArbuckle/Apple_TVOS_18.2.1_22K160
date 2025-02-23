@interface APSCourier
- (APSCourier)initWithEnvironment:(id)a3 defaultUser:(id)a4 userDependencies:(id)a5 delegate:(id)a6;
- (APSCourierConnectionManager)connectionManager;
- (APSCourierDelegate)delegate;
- (APSEnvironment)environment;
- (APSIDSProxyManager)proxyManager;
- (APSProxyAgent)proxyAgent;
- (APSUserCourier)mainCourier;
- (BOOL)courierConnectionManagerClientsCanConnectRightNow;
- (BOOL)courierConnectionManagerClientsHaveEagerMessages;
- (BOOL)courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled;
- (BOOL)courierConnectionManagerClientsWantsCriticalReliability;
- (BOOL)courierConnectionManagerClientsWillBeAbleToConnect;
- (BOOL)hasIdentity;
- (BOOL)isConnectedToService;
- (BOOL)isIdle;
- (BOOL)isInteractivePushDuringSleepEnabled;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)shouldUseInternet;
- (NSMutableArray)orderedListOfNonMainCouriers;
- (NSMutableDictionary)courierByUser;
- (NSString)debugDescription;
- (NSString)description;
- (double)currentKeepAliveInterval;
- (id)JSONDebugState;
- (id)allRegisteredChannelsForTopic:(id)a3 user:(id)a4;
- (id)aps_prettyDescription;
- (id)connectionForConnectionPortName:(id)a3 user:(id)a4;
- (id)connectionServerDelegateForUser:(id)a3 dependencies:(id)a4;
- (id)connectionServersForUser:(id)a3;
- (id)daemonUserIDs;
- (id)ifname;
- (id)latestGeoRegion;
- (id)publicTokenForUser:(id)a3;
- (unint64_t)getNextTaskMessageId;
- (unint64_t)serverTimeInNanoSeconds;
- (void)_addProtocolConnectionsToUserCourier:(id)a3;
- (void)addConnection:(id)a3 forUser:(id)a4 dependencies:(id)a5;
- (void)addTaskServer:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)canUseProxyChanged;
- (void)courierConnectionManager:(id)a3 openedNewProtocolConnection:(id)a4;
- (void)courierConnectionManager:(id)a3 receivedServerBag:(id)a4;
- (void)courierConnectionStatusDidChange:(id)a3;
- (void)courierFilterChanged:(id)a3;
- (void)courierHasNoConnections:(id)a3;
- (void)courierIdentityBecameAvailable:(id)a3;
- (void)courierIsIdle:(id)a3;
- (void)courierShouldRollBAAEnvironmentTokens:(id)a3;
- (void)didConnectOrDisconnectTokenForCourier:(id)a3 onProtocolConnection:(id)a4;
- (void)fetchUserCourierIdentityWithCompletion:(id)a3;
- (void)flushUser:(id)a3;
- (void)forceBAAIdentityRefreshWithCompletion:(id)a3;
- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10;
- (void)invalidateDeviceIdentity;
- (void)kickstartProxyConnection;
- (void)logoutUser:(id)a3;
- (void)performKeepAlive;
- (void)periodicSignalFired;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)proxyAgent:(id)a3 openedNewProtocolConnection:(id)a4;
- (void)removeConnectionForConnectionPortName:(id)a3 user:(id)a4;
- (void)removeTaskServer:(id)a3;
- (void)requestConnectionIfNeeded;
- (void)rollTokenAndReconnect;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4;
- (void)setConnectionManager:(id)a3;
- (void)setCourierByUser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setMainCourier:(id)a3;
- (void)setOrderedListOfNonMainCouriers:(id)a3;
- (void)setProxyAgent:(id)a3;
- (void)setupForUser:(id)a3 dependencies:(id)a4;
- (void)shouldUseInternetDidChange:(id)a3;
- (void)updateKeepAliveInterval:(double)a3;
- (void)userCourier:(id)a3 hasReasonToConnectChangedTo:(BOOL)a4;
@end

@implementation APSCourier

- (APSCourier)initWithEnvironment:(id)a3 defaultUser:(id)a4 userDependencies:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___APSCourier;
  v15 = -[APSCourier init](&v34, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a3);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    courierByUser = v16->_courierByUser;
    v16->_courierByUser = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    orderedListOfNonMainCouriers = v16->_orderedListOfNonMainCouriers;
    v16->_orderedListOfNonMainCouriers = v19;

    objc_storeWeak((id *)&v16->_delegate, v14);
    v21 = -[APSCourierConnectionManager initWithEnvironment:delegate:]( objc_alloc(&OBJC_CLASS___APSCourierConnectionManager),  "initWithEnvironment:delegate:",  v11,  v16);
    connectionManager = v16->_connectionManager;
    v16->_connectionManager = v21;

    v23 = objc_alloc(&OBJC_CLASS___APSUserCourier);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 userPreferences]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v13 clientIdentityProvider]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v13 userAppIDManager]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v13 systemTokenStorage]);
    v28 = -[APSUserCourier initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:delegate:withConnectionEstablisher:]( v23,  "initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:d elegate:withConnectionEstablisher:",  v11,  v12,  v24,  v25,  v26,  v27,  v16,  v16->_connectionManager);
    mainCourier = v16->_mainCourier;
    v16->_mainCourier = v28;

    v30 = v16->_courierByUser;
    v31 = v16->_mainCourier;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, v32);
  }

  return v16;
}

- (void)courierHasNoConnections:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  [v5 courierHasNoConnections:v4];
}

- (void)courierConnectionStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  [v5 courierConnectionStatusDidChange:v4];
}

- (void)courierFilterChanged:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  [v5 courierFilterChanged:v4];
}

- (void)userCourier:(id)a3 hasReasonToConnectChangedTo:(BOOL)a4
{
  if (a4) {
    -[APSProxyAgent setEnabled:](self->_proxyAgent, "setEnabled:", 1LL);
  }
}

- (void)courierIsIdle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  [v5 courierIsIdle:v4];
}

- (void)shouldUseInternetDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  [v5 shouldUseInternetDidChange:v4];
}

- (void)courierIdentityBecameAvailable:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier proxyAgent](self, "proxyAgent", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeProtocolConnections]);

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&__int128 v7 = 138412802LL;
    __int128 v15 = v7;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", v15));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
          *(_DWORD *)buf = v15;
          v21 = self;
          __int16 v22 = 2112;
          v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ Proxy was available adding since courier now has an identity {mainCourier: %@, protocolConnection: %@}",  buf,  0x20u);
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
        [v14 beginTrackingProtocolConnection:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }

    while (v8);
  }
}

- (void)kickstartProxyConnection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier proxyAgent](self, "proxyAgent"));
  [v2 kickstartProxyConnection];
}

- (APSIDSProxyManager)proxyManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 proxyManager]);

  return (APSIDSProxyManager *)v3;
}

- (void)didConnectOrDisconnectTokenForCourier:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = (APSUserCourier *)a3;
  id v7 = a4;
  if (self->_mainCourier == v6) {
    id v8 = 0LL;
  }
  else {
    id v8 = (char *)-[NSMutableArray indexOfObject:](self->_orderedListOfNonMainCouriers, "indexOfObject:", v6) + 1;
  }
  if (-[NSMutableArray count](self->_orderedListOfNonMainCouriers, "count") > v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_orderedListOfNonMainCouriers,  "objectAtIndexedSubscript:",  v8));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ Trying to connect/disconnect for courier %@",  (uint8_t *)&v11,  0x16u);
    }

    [v9 beginTrackingProtocolConnection:v7];
  }
}

- (void)courierShouldRollBAAEnvironmentTokens:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier delegate](self, "delegate", a3));
  [v4 rollTokensForAllBAAEnvironments:self];
}

- (void)proxyAgent:(id)a3 openedNewProtocolConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v7 = [v6 hasIdentity];

  if ((v7 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
    unsigned __int8 v9 = [v8 hasReasonToConnect];

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
      [v10 beginTrackingProtocolConnection:v5];
    }

    else
    {
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
        int v15 = 138412802;
        __int128 v16 = self;
        __int16 v17 = 2112;
        __int128 v18 = v14;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ Proxy available but courier does not have any active topics, waiting {mainCourier: %@, protocolConnection: %@}",  (uint8_t *)&v15,  0x20u);
      }

      -[APSProxyAgent setEnabled:](self->_proxyAgent, "setEnabled:", 0LL);
    }
  }

  else
  {
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
      int v15 = 138412802;
      __int128 v16 = self;
      __int16 v17 = 2112;
      __int128 v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ Proxy available but courier does not have an identity yet, waiting {mainCourier: %@, protocolConnection: %@}",  (uint8_t *)&v15,  0x20u);
    }
  }
}

- (void)updateKeepAliveInterval:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v4 updateKeepAliveInterval:a3];
}

- (void)courierConnectionManager:(id)a3 openedNewProtocolConnection:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v6 beginTrackingProtocolConnection:v5];
}

- (void)courierConnectionManager:(id)a3 receivedServerBag:(id)a4
{
  id v5 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) updateForReceivedConfig:v5];
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BOOL)courierConnectionManagerClientsWillBeAbleToConnect
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v3 = [v2 willBeAbleToConnect];

  return v3;
}

- (BOOL)courierConnectionManagerClientsCanConnectRightNow
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) isConnectableRightNow])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)courierConnectionManagerClientsHaveEagerMessages
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) hasEagerMessages])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)courierConnectionManagerClientsWantsCriticalReliability
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) wantsCriticalReliability])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) isInteractivePushDuringSleepEnabled])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)_addProtocolConnectionsToUserCourier:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeProtocolConnections]);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier proxyAgent](self, "proxyAgent"));
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeProtocolConnections]);
    *(_DWORD *)buf = 138413058;
    v33 = self;
    __int16 v34 = 2112;
    id v35 = v4;
    __int16 v36 = 2112;
    v37 = v7;
    __int16 v38 = 2112;
    v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ Adding protocol connections to userCourier %@ {connectionManager.activeProtocolConnections: %@, proxyAgent.acti veProtocolConnections: %@}",  buf,  0x2Au);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeProtocolConnections]);

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      int v15 = 0LL;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [v4 beginTrackingProtocolConnection:*(void *)(*((void *)&v26 + 1) + 8 * (void)v15)];
        int v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v13);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier proxyAgent](self, "proxyAgent", 0LL));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeProtocolConnections]);

  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [v4 beginTrackingProtocolConnection:*(void *)(*((void *)&v22 + 1) + 8 * (void)v21)];
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v19);
  }
}

- (id)daemonUserIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier courierByUser](self, "courierByUser"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = self->_courierByUser;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[APSSystemUser systemUserWithUserID:]( &OBJC_CLASS___APSSystemUser,  "systemUserWithUserID:",  v10,  (void)v14));
        unsigned int v12 = [v11 isDaemonUser];

        if (v12) {
          [v4 addObject:v10];
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }

  return v4;
}

- (void)setupForUser:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  courierByUser = self->_courierByUser;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v9));

  if (!v10)
  {
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      *(_DWORD *)buf = 138412546;
      __int128 v24 = self;
      __int16 v25 = 2112;
      __int128 v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Login user %@", buf, 0x16u);
    }

    id v13 = objc_alloc(&OBJC_CLASS___APSUserCourier);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier environment](self, "environment"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 userPreferences]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 clientIdentityProvider]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 userAppIDManager]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 systemTokenStorage]);
    id v19 = -[APSUserCourier initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:delegate:withConnectionEstablisher:]( v13,  "initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:d elegate:withConnectionEstablisher:",  v14,  v6,  v15,  v16,  v17,  v18,  self,  self->_connectionManager);

    uint64_t v20 = self->_courierByUser;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, v21);

    -[NSMutableArray addObject:](self->_orderedListOfNonMainCouriers, "addObject:", v19);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
    -[APSUserCourier setEnabled:](v19, "setEnabled:", [v22 enabled]);

    -[APSCourier _addProtocolConnectionsToUserCourier:](self, "_addProtocolConnectionsToUserCourier:", v19);
  }
}

- (void)logoutUser:(id)a3
{
  id v4 = a3;
  courierByUser = self->_courierByUser;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v6));

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int128 v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Logging out user %@ on %@",  (uint8_t *)&v9,  0x20u);
  }

  [v7 logout];
}

- (void)flushUser:(id)a3
{
  id v4 = a3;
  courierByUser = self->_courierByUser;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v6));

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int128 v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Flushing user %@ on %@",  (uint8_t *)&v9,  0x20u);
  }

  [v7 flush];
}

- (BOOL)isIdle
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v3 = [v2 isIdle];

  return v3;
}

- (id)connectionServersForUser:(id)a3
{
  courierByUser = self->_courierByUser;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionServers]);

  return v6;
}

- (void)addConnection:(id)a3 forUser:(id)a4 dependencies:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  courierByUser = self->_courierByUser;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v11));

  if (v12)
  {
    [v12 addConnection:v23];
  }

  else
  {
    __int16 v13 = objc_alloc(&OBJC_CLASS___APSUserCourier);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier environment](self, "environment"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 userPreferences]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentityProvider]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 userAppIDManager]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 systemTokenStorage]);
    id v19 = -[APSUserCourier initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:delegate:withConnectionEstablisher:]( v13,  "initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:d elegate:withConnectionEstablisher:",  v14,  v8,  v15,  v16,  v17,  v18,  self,  self->_connectionManager);

    uint64_t v20 = self->_courierByUser;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, v21);

    -[NSMutableArray addObject:](self->_orderedListOfNonMainCouriers, "addObject:", v19);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
    -[APSUserCourier setEnabled:](v19, "setEnabled:", [v22 enabled]);

    -[APSUserCourier addConnection:](v19, "addConnection:", v23);
    -[APSCourier _addProtocolConnectionsToUserCourier:](self, "_addProtocolConnectionsToUserCourier:", v19);
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[APSCourierConnectionManager setEnabled:](self->_connectionManager, "setEnabled:");
  -[APSProxyAgent setEnabled:](self->_proxyAgent, "setEnabled:", v3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setEnabled:v3];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (BOOL)isInteractivePushDuringSleepEnabled
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) isInteractivePushDuringSleepEnabled])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isKeepAliveProxyConfigured
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfigured];

  return v3;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v5 appendPrettyStatusToStatusPrinter:v4];

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) appendPrettyStatusToStatusPrinter:v4];
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (id)JSONDebugState
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = self->_courierByUser;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_courierByUser,  "objectForKeyedSubscript:",  v10,  (void)v15));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 JSONDebugState]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"users"];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager JSONDebugState](self->_connectionManager, "JSONDebugState"));
  [v3 setObject:v13 forKeyedSubscript:@"connection"];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier environment](self, "environment"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier courierByUser](self, "courierByUser"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@ %p %@ numCouriers: %d>",  v3,  self,  v5,  [v6 count]));

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues"));
  uint64_t v4 = APSPrettyPrintCollection(v3, 1LL, 0LL, 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v7 = objc_opt_class(self, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier environment](self, "environment"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager debugDescription](self->_connectionManager, "debugDescription"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, %@, couriers=%@, connectionManager=%@>",  v7,  self,  v9,  v5,  v10));

  return (NSString *)v11;
}

- (id)aps_prettyDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues"));
  uint64_t v4 = APSPrettyPrintCollection(v3, 1LL, 0LL, 2LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier environment](self, "environment"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  uint64_t v8 = APSPrettyPrintObject(self->_connectionManager, 2LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@, couriers=%@, connectionManager=%@>",  v7,  v5,  v9));

  return v10;
}

- (double)currentKeepAliveInterval
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v2 currentKeepAliveInterval];
  double v4 = v3;

  return v4;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)removeConnectionForConnectionPortName:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a4 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v8));
  [v7 removeConnectionForConnectionPortName:v6];
}

- (id)connectionForConnectionPortName:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionForConnectionPortName:v6]);

  return v9;
}

- (void)requestConnectionIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v2 requestConnectionIfNeeded];
}

- (id)publicTokenForUser:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier courierByUser](self, "courierByUser"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicToken]);

  return v8;
}

- (void)canUseProxyChanged
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) canUseProxyChanged];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v25 incomingPresenceWithGuid:v24 token:v23 hwVersion:v22 swVersion:v21 swBuild:v20 certificate:v19 nonce:v18 signature:v17];
}

- (BOOL)isConnectedToService
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v3 = [v2 isConnectedToService];

  return v3;
}

- (void)invalidateDeviceIdentity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v2 invalidateDeviceIdentity];
}

- (void)periodicSignalFired
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v2 periodicSignalFired];
}

- (id)connectionServerDelegateForUser:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  courierByUser = self->_courierByUser;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v9));

  if (!v10) {
    -[APSCourier setupForUser:dependencies:](self, "setupForUser:dependencies:", v6, v7);
  }
  __int128 v11 = self->_courierByUser;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12));

  return v13;
}

- (BOOL)hasIdentity
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  unsigned __int8 v3 = [v2 hasIdentity];

  return v3;
}

- (unint64_t)serverTimeInNanoSeconds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  id v3 = [v2 serverTimeInNanoSeconds];

  return (unint64_t)v3;
}

- (id)latestGeoRegion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 latestGeoRegion]);

  return v3;
}

- (id)allRegisteredChannelsForTopic:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 name]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](courierByUser, "objectForKey:", v7));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allRegisteredChannelsForTopic:v6]);

  return v9;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v7 sendTaskControlMessageWithMetadata:v6 messageId:a4];
}

- (void)addTaskServer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v5 addTaskServer:v4];
}

- (void)removeTaskServer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v5 removeTaskServer:v4];
}

- (unint64_t)getNextTaskMessageId
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  id v3 = [v2 getNextTaskMessageId];

  return (unint64_t)v3;
}

- (void)performKeepAlive
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v2 performKeepAlive];
}

- (BOOL)shouldUseInternet
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_courierByUser, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) shouldUseInternet])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)ifname
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 ifname]);

  return v3;
}

- (void)fetchUserCourierIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v5 getClientIdentityForcingRefresh:0 withCompletion:v4];
}

- (void)rollTokenAndReconnect
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v2 rollTokenAndReconnect];
}

- (void)forceBAAIdentityRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008890;
  v7[3] = &unk_10011DCE0;
  id v8 = v4;
  id v6 = v4;
  [v5 getClientIdentityForcingRefresh:1 withCompletion:v7];
}

- (void)prepareForDarkWake
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v3 prepareForDarkWake];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v4 prepareForDarkWake];
}

- (void)prepareForFullWake
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v3 prepareForFullWake];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v4 prepareForFullWake];
}

- (void)prepareForSleep
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourier mainCourier](self, "mainCourier"));
  [v3 prepareForSleep];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourier connectionManager](self, "connectionManager"));
  [v4 prepareForSleep];
}

- (APSCourierDelegate)delegate
{
  return (APSCourierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (APSUserCourier)mainCourier
{
  return self->_mainCourier;
}

- (void)setMainCourier:(id)a3
{
}

- (APSCourierConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (APSProxyAgent)proxyAgent
{
  return self->_proxyAgent;
}

- (void)setProxyAgent:(id)a3
{
}

- (NSMutableDictionary)courierByUser
{
  return self->_courierByUser;
}

- (void)setCourierByUser:(id)a3
{
}

- (NSMutableArray)orderedListOfNonMainCouriers
{
  return self->_orderedListOfNonMainCouriers;
}

- (void)setOrderedListOfNonMainCouriers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end