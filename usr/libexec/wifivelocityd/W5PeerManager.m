@interface W5PeerManager
- (BOOL)_discoveryRequestsContainsRapportRequest;
- (BOOL)_setupRapportClient;
- (BOOL)registerPeerListeners:(id)a3;
- (NSMutableSet)activePeers;
- (NSMutableSet)discoveryRequests;
- (NSString)localIDSIdentifier;
- (W5PeerManager)init;
- (W5RapportClient)rapportClient;
- (W5RapportServer)rapportServer;
- (id)_activePeersWithDiscoveryFlags:(int64_t)a3;
- (id)_sendRapportRequest:(id)a3;
- (id)_stopPeerDiscoveryWithRequest:(id)a3;
- (id)queryDatabaseForPeerWithRequest:(id)a3;
- (id)queryStatusForPeerWithRequest:(id)a3;
- (id)requestFileFromPeerWithRequest:(id)a3;
- (id)runDiagnosticsOnPeerWithRequest:(id)a3;
- (id)runSnifferAtPeerWithRequest:(id)a3;
- (id)sendDebugConfigurationForPeerWithRequest:(id)a3;
- (id)sendRequest:(id)a3;
- (id)startPeerDiscoveryWithRequest:(id)a3;
- (id)stopPeerDiscoveryWithRequestUUID:(id)a3;
- (void)_handleRapportDeviceFound:(id)a3;
- (void)_handleRapportDeviceLost:(id)a3;
- (void)_newPeersDiscovered:(id)a3;
- (void)_peersLost:(id)a3;
- (void)setActivePeers:(id)a3;
- (void)setDiscoveryRequests:(id)a3;
- (void)setLocalIDSIdentifier:(id)a3;
- (void)setRapportClient:(id)a3;
- (void)setRapportServer:(id)a3;
@end

@implementation W5PeerManager

- (W5PeerManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___W5PeerManager;
  v2 = -[W5PeerManager init](&v16, "init");
  if (!v2) {
    goto LABEL_11;
  }
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  discoveryRequests = v2->_discoveryRequests;
  v2->_discoveryRequests = v3;

  if (!v2->_discoveryRequests
    || (v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet),
        activePeers = v2->_activePeers,
        v2->_activePeers = v5,
        activePeers,
        !v2->_activePeers))
  {
LABEL_11:

    uint64_t v14 = sub_10008C90C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[W5PeerManager init]";
      __int16 v19 = 2080;
      v20 = "W5PeerManager.m";
      __int16 v21 = 1024;
      int v22 = 61;
      LODWORD(v15) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v17,  v15,  LODWORD(v16.receiver));
    }

    v2 = 0LL;
    goto LABEL_9;
  }

  localIDSIdentifier = v2->_localIDSIdentifier;
  v2->_localIDSIdentifier = 0LL;

  if (objc_opt_class(&OBJC_CLASS___IDSService, v8))
  {
    uint64_t v9 = IDSCopyLocalDeviceUniqueID();
    v10 = v2->_localIDSIdentifier;
    v2->_localIDSIdentifier = (NSString *)v9;
  }

  if (!v2->_localIDSIdentifier)
  {
    uint64_t v11 = sub_10008C90C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[W5PeerManager init]";
      __int16 v19 = 2080;
      v20 = "W5PeerManager.m";
      __int16 v21 = 1024;
      int v22 = 53;
      LODWORD(v15) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) no local IDS device identifier",  (const char *)&v17,  v15,  LODWORD(v16.receiver));
    }

- (BOOL)registerPeerListeners:(id)a3
{
  id v4 = a3;
  v5 = -[W5RapportServer initWithRequestListeners:]( objc_alloc(&OBJC_CLASS___W5RapportServer),  "initWithRequestListeners:",  v4);

  rapportServer = self->_rapportServer;
  self->_rapportServer = v5;

  BOOL v7 = -[W5PeerManager _setupRapportClient](self, "_setupRapportClient");
  if (!v7)
  {
    uint64_t v9 = sub_10008C90C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerManager registerPeerListeners:]";
      __int16 v13 = 2080;
      uint64_t v14 = "W5PeerManager.m";
      __int16 v15 = 1024;
      int v16 = 70;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to setup rapport client",  (const char *)&v11,  28);
    }
  }

  return v7;
}

- (id)startPeerDiscoveryWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  unsigned int v6 = [v5 containsObject:v4];

  uint64_t v7 = sub_10008C90C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v21 = 136315906;
      int v22 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerManager.m";
      __int16 v25 = 1024;
      int v26 = 81;
      __int16 v27 = 2114;
      id v28 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) discovery request already exists for request='%{public}@'",  &v21,  38);
    }

    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    v20 = @"W5NotPermittedErr";
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v10));
LABEL_13:

    goto LABEL_14;
  }

  if (v9)
  {
    int v21 = 136315906;
    int v22 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
    __int16 v23 = 2080;
    v24 = "W5PeerManager.m";
    __int16 v25 = 1024;
    int v26 = 85;
    __int16 v27 = 2114;
    id v28 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) starting discovery for request='%{public}@'",  &v21,  38);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  [v12 addObject:v4];

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
  unsigned __int8 v14 = [v13 discoveryFlags];

  if ((v14 & 1) != 0)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    [v15 startDiscoveringDevices];

    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _activePeersWithDiscoveryFlags:](self, "_activePeersWithDiscoveryFlags:", 1LL));
      if ([v10 count])
      {
        int v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
        ((void (**)(void, void *, void))v16)[2](v16, v17, 0LL);
      }

      int v11 = 0LL;
      goto LABEL_13;
    }
  }

  else
  {
    int v11 = 0LL;
  }

- (id)stopPeerDiscoveryWithRequestUUID:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
      unsigned __int8 v12 = [v11 isEqual:v4];

      if ((v12 & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v33 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v13 = v10;

    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[W5PeerManager _stopPeerDiscoveryWithRequest:](self, "_stopPeerDiscoveryWithRequest:", v13));
  }

  else
  {
LABEL_9:

LABEL_12:
    uint64_t v15 = sub_10008C90C();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315906;
      int v26 = "-[W5PeerManager stopPeerDiscoveryWithRequestUUID:]";
      __int16 v27 = 2080;
      id v28 = "W5PeerManager.m";
      __int16 v29 = 1024;
      int v30 = 117;
      __int16 v31 = 2114;
      id v32 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) no existing discovery request matching UUID='%{public}@'",  &v25,  38);
    }

    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    v24 = @"W5ParamErr";
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v13));
  }

  int v17 = (void *)v14;

  return v17;
}

- (id)_stopPeerDiscoveryWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v13 = sub_10008C90C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315906;
      int v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v27 = 2080;
      id v28 = "W5PeerManager.m";
      __int16 v29 = 1024;
      int v30 = 127;
      __int16 v31 = 2114;
      id v32 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) no existing discovery request for request='%{public}@'",  &v25,  38);
    }

    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    v24 = @"W5NotPermittedErr";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v15));
    goto LABEL_16;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  [v7 removeObject:v4];

  unsigned __int8 v8 = -[W5PeerManager _discoveryRequestsContainsRapportRequest](self, "_discoveryRequestsContainsRapportRequest");
  uint64_t v9 = sub_10008C90C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
      int v25 = 136315906;
      int v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v27 = 2080;
      id v28 = "W5PeerManager.m";
      __int16 v29 = 1024;
      int v30 = 138;
      __int16 v31 = 2114;
      id v32 = v12;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) existing rapport discovery requests, not stopping discovery (requests='%{public}@')",  &v25,  38);
    }
  }

  else
  {
    if (v11)
    {
      int v25 = 136315650;
      int v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v27 = 2080;
      id v28 = "W5PeerManager.m";
      __int16 v29 = 1024;
      int v30 = 135;
      LODWORD(v22) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) no remaining rapport discovery requests, stopping discovery",  (const char *)&v25,  v22,  (_DWORD)v23);
    }

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    -[os_log_s stopDiscoveryingDevices](v10, "stopDiscoveryingDevices");
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  id v18 = [v17 count];

  if (!v18)
  {
    uint64_t v19 = sub_10008C90C();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      int v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v27 = 2080;
      id v28 = "W5PeerManager.m";
      __int16 v29 = 1024;
      int v30 = 143;
      LODWORD(v22) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] %s (%s:%u) no remaining discovery requests, clearing active peers",  (const char *)&v25,  v22,  (_DWORD)v23);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    [v15 removeAllObjects];
    int v16 = 0LL;
LABEL_16:

    goto LABEL_17;
  }

  int v16 = 0LL;
LABEL_17:

  return v16;
}

- (void)_newPeersDiscovered:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v6 = sub_10008C90C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    int v43 = 136315906;
    v44 = "-[W5PeerManager _newPeersDiscovered:]";
    __int16 v45 = 2080;
    v46 = "W5PeerManager.m";
    __int16 v47 = 1024;
    int v48 = 156;
    __int16 v49 = 2114;
    v50 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) self.activePeers='%{public}@'",  &v43,  38);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v40;
    int v33 = 136315906;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
        unsigned int v16 = [v15 containsObject:v14];

        if (v16)
        {
          uint64_t v17 = sub_10008C90C();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = 136315906;
            v44 = "-[W5PeerManager _newPeersDiscovered:]";
            __int16 v45 = 2080;
            v46 = "W5PeerManager.m";
            __int16 v47 = 1024;
            int v48 = 159;
            __int16 v49 = 2114;
            v50 = v14;
            LODWORD(v32) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) peer='%{public}@' already discovered",  &v43,  v32);
          }

          [v5 removeObject:v14];
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
          [v19 addObject:v14];

          v11 |= (unint64_t)[v14 discoveryFlags];
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
    }

    while (v10);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  if ([v5 count])
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
    id v21 = [v20 countByEnumeratingWithState:&v35 objects:v53 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
          uint64_t v26 = sub_10008C90C();
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = 136316162;
            v44 = "-[W5PeerManager _newPeersDiscovered:]";
            __int16 v45 = 2080;
            v46 = "W5PeerManager.m";
            __int16 v47 = 1024;
            int v48 = 174;
            __int16 v49 = 2114;
            v50 = v25;
            __int16 v51 = 2114;
            id v52 = v5;
            LODWORD(v32) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) notify request='%{public}@' of peers found='%{public}@'",  &v43,  v32);
          }

          id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 configuration]);
          unint64_t v29 = (unint64_t)[v28 discoveryFlags] & v11;

          if (v29)
          {
            int v30 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v25 handler]);
            ((void (**)(void, id, void))v30)[2](v30, v5, 0LL);
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v35 objects:v53 count:16];
      }

      while (v22);
    }
  }

  else
  {
    uint64_t v31 = sub_10008C90C();
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136315650;
      v44 = "-[W5PeerManager _newPeersDiscovered:]";
      __int16 v45 = 2080;
      v46 = "W5PeerManager.m";
      __int16 v47 = 1024;
      int v48 = 168;
      LODWORD(v32) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] %s (%s:%u) no new peers discovered",  (const char *)&v43,  v32,  v33);
    }
  }
}

- (void)_peersLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10008C90C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    int v40 = 136315906;
    __int128 v41 = "-[W5PeerManager _peersLost:]";
    __int16 v42 = 2080;
    int v43 = "W5PeerManager.m";
    __int16 v44 = 1024;
    int v45 = 185;
    __int16 v46 = 2114;
    __int16 v47 = v7;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) self.activePeers='%{public}@'",  &v40,  38);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v51 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
        unsigned int v16 = [v15 containsObject:v14];

        if (v16)
        {
          uint64_t v17 = sub_10008C90C();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v40 = 136315906;
            __int128 v41 = "-[W5PeerManager _peersLost:]";
            __int16 v42 = 2080;
            int v43 = "W5PeerManager.m";
            __int16 v44 = 1024;
            int v45 = 188;
            __int16 v46 = 2114;
            __int16 v47 = v14;
            LODWORD(v31) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) lost peer='%{public}@'",  &v40,  v31);
          }

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
          [v19 removeObject:v14];

          v11 |= (unint64_t)[v14 discoveryFlags];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v51 count:16];
    }

    while (v10);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  id v21 = [v20 countByEnumeratingWithState:&v32 objects:v50 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        int v25 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        uint64_t v26 = sub_10008C90C();
        __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136316162;
          __int128 v41 = "-[W5PeerManager _peersLost:]";
          __int16 v42 = 2080;
          int v43 = "W5PeerManager.m";
          __int16 v44 = 1024;
          int v45 = 196;
          __int16 v46 = 2114;
          __int16 v47 = v25;
          __int16 v48 = 2114;
          id v49 = v8;
          LODWORD(v31) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) notify request='%{public}@' of peers lost='%{public}@'",  &v40,  v31);
        }

        id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 configuration]);
        unint64_t v29 = (unint64_t)[v28 discoveryFlags] & v11;

        if (v29)
        {
          int v30 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v25 handler]);
          ((void (**)(void, void, id))v30)[2](v30, 0LL, v8);
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v32 objects:v50 count:16];
    }

    while (v22);
  }
}

- (id)_activePeersWithDiscoveryFlags:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.discoveryFlags == %d",  a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.discoveryFlags == %d",  a3 | 2,  v5));
  v12[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredSetUsingPredicate:v8]);

  return v10;
}

- (id)queryStatusForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)requestFileFromPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 companionLinkDevice]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sendMessageToDevice:v6 request:v4]);
    }

    else
    {
      uint64_t v10 = sub_10008C90C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
        int v16 = 136315906;
        uint64_t v17 = "-[W5PeerManager requestFileFromPeerWithRequest:]";
        __int16 v18 = 2080;
        uint64_t v19 = "W5PeerManager.m";
        __int16 v20 = 1024;
        int v21 = 236;
        __int16 v22 = 2114;
        uint64_t v23 = v12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'",  &v16,  38);
      }

      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      uint64_t v15 = @"W5ParamErr";
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v7));
    }

    id v9 = (void *)v8;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)runSnifferAtPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)sendDebugConfigurationForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)runDiagnosticsOnPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 companionLinkDevice]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sendMessageToDevice:v6 request:v4]);
    }

    else
    {
      uint64_t v10 = sub_10008C90C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
        int v16 = 136315906;
        uint64_t v17 = "-[W5PeerManager runDiagnosticsOnPeerWithRequest:]";
        __int16 v18 = 2080;
        uint64_t v19 = "W5PeerManager.m";
        __int16 v20 = 1024;
        int v21 = 282;
        __int16 v22 = 2114;
        uint64_t v23 = v12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'",  &v16,  38);
      }

      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      uint64_t v15 = @"W5ParamErr";
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v7));
    }

    id v9 = (void *)v8;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)queryDatabaseForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_sendRapportRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 companionLinkDevice]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sendMessageToDevice:v6 request:v4]);
  }

  else
  {
    uint64_t v9 = sub_10008C90C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
      int v16 = 136315906;
      uint64_t v17 = "-[W5PeerManager _sendRapportRequest:]";
      __int16 v18 = 2080;
      uint64_t v19 = "W5PeerManager.m";
      __int16 v20 = 1024;
      int v21 = 312;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'",  &v16,  38);
    }

    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    uint64_t v15 = @"W5ParamErr";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v7));
  }

  uint64_t v12 = (void *)v8;

  return v12;
}

- (BOOL)_setupRapportClient
{
  v3 = objc_alloc_init(&OBJC_CLASS___W5RapportClient);
  -[W5PeerManager setRapportClient:](self, "setRapportClient:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
  if (v4)
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000885B4;
    v10[3] = &unk_1000D2890;
    objc_copyWeak(&v11, &location);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    [v5 setDeviceFoundHandler:v10];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000885FC;
    v8[3] = &unk_1000D2890;
    objc_copyWeak(&v9, &location);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    [v6 setDeviceLostHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v4 != 0LL;
}

- (void)_handleRapportDeviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[W5Peer initWithCompanionLinkDevice:](objc_alloc(&OBJC_CLASS___W5Peer), "initWithCompanionLinkDevice:", v4);

  id v7 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  -[W5PeerManager _newPeersDiscovered:](self, "_newPeersDiscovered:", v6);
}

- (void)_handleRapportDeviceLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[W5Peer initWithCompanionLinkDevice:](objc_alloc(&OBJC_CLASS___W5Peer), "initWithCompanionLinkDevice:", v4);

  id v7 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  -[W5PeerManager _peersLost:](self, "_peersLost:", v6);
}

- (BOOL)_discoveryRequestsContainsRapportRequest
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) configuration]);
        unsigned __int8 v7 = [v6 discoveryFlags];

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)sendRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 companionLinkDevice]);

  uint64_t v7 = sub_10008C90C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 requestInfo]);
      int v17 = 136316162;
      __int16 v18 = "-[W5PeerManager sendRequest:]";
      __int16 v19 = 2080;
      __int16 v20 = "W5PeerManager.m";
      __int16 v21 = 1024;
      int v22 = 372;
      __int16 v23 = 2114;
      v24 = v10;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) SEND REQUEST (peer=%{public}@, info=%{public}@)",  &v17,  48);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 sendMessageToDevice:v6 request:v4]);
  }

  else
  {
    if (v9)
    {
      NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
      int v17 = 136315906;
      __int16 v18 = "-[W5PeerManager sendRequest:]";
      __int16 v19 = 2080;
      __int16 v20 = "W5PeerManager.m";
      __int16 v21 = 1024;
      int v22 = 369;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'",  &v17,  38);
    }

    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    id v28 = @"W5ParamErr";
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v12));
  }

  uint64_t v15 = (void *)v13;

  return v15;
}

- (NSString)localIDSIdentifier
{
  return self->_localIDSIdentifier;
}

- (void)setLocalIDSIdentifier:(id)a3
{
}

- (W5RapportClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (W5RapportServer)rapportServer
{
  return self->_rapportServer;
}

- (void)setRapportServer:(id)a3
{
}

- (NSMutableSet)discoveryRequests
{
  return self->_discoveryRequests;
}

- (void)setDiscoveryRequests:(id)a3
{
}

- (NSMutableSet)activePeers
{
  return self->_activePeers;
}

- (void)setActivePeers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end