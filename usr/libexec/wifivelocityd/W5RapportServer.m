@interface W5RapportServer
- (BOOL)_configureCompaionLinkClient;
- (NSArray)listeners;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)rapportClient;
- (W5RapportServer)initWithRequestListeners:(id)a3;
- (void)_registerRequestsForListener:(id)a3 rapportClient:(id)a4;
- (void)invalidateDiscoveryClient;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportClient:(id)a3;
@end

@implementation W5RapportServer

- (W5RapportServer)initWithRequestListeners:(id)a3
{
  id v5 = a3;
  if ((_os_feature_enabled_impl("WiFiVelocity", "RapportServer") & 1) != 0)
  {
    if (+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled"))
    {
      v17.receiver = self;
      v17.super_class = (Class)&OBJC_CLASS___W5RapportServer;
      self = -[W5RapportServer init](&v17, "init");
      if (!self) {
        goto LABEL_17;
      }
      v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifi.W5RapportServer", 0LL);
      queue = self->_queue;
      self->_queue = v6;

      if (!self->_queue) {
        goto LABEL_17;
      }
      objc_storeStrong((id *)&self->_listeners, a3);
      if (self->_listeners)
      {
        if (-[W5RapportServer _configureCompaionLinkClient](self, "_configureCompaionLinkClient")) {
          goto LABEL_7;
        }
        uint64_t v13 = sub_10008C90C();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315650;
          v19 = "-[W5RapportServer initWithRequestListeners:]";
          __int16 v20 = 2080;
          v21 = "W5RapportServer.m";
          __int16 v22 = 1024;
          int v23 = 56;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to configure link client",  &v18,  28);
        }
      }

      else
      {
        uint64_t v12 = sub_10008C90C();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315650;
          v19 = "-[W5RapportServer initWithRequestListeners:]";
          __int16 v20 = 2080;
          v21 = "W5RapportServer.m";
          __int16 v22 = 1024;
          int v23 = 54;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) rapport listeners is nil",  &v18,  28);
        }
      }
    }

    else
    {
      uint64_t v11 = sub_10008C90C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        v19 = "-[W5RapportServer initWithRequestListeners:]";
        __int16 v20 = 2080;
        v21 = "W5RapportServer.m";
        __int16 v22 = 1024;
        int v23 = 44;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) rapport server is not available.",  &v18,  28);
      }
    }
  }

  else
  {
    uint64_t v9 = sub_10008C90C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      v19 = "-[W5RapportServer initWithRequestListeners:]";
      __int16 v20 = 2080;
      v21 = "W5RapportServer.m";
      __int16 v22 = 1024;
      int v23 = 43;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) rapport server feature flag is off.",  &v18,  28);
    }
  }

LABEL_17:
  uint64_t v14 = sub_10008C90C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    v19 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v20 = 2080;
    v21 = "W5RapportServer.m";
    __int16 v22 = 1024;
    int v23 = 63;
    LODWORD(v16) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v18,  v16,  LODWORD(v17.receiver));
  }

  self = 0LL;
LABEL_7:

  return self;
}

- (BOOL)_configureCompaionLinkClient
{
  v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  v4 = v3;
  if (v3)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100081478;
    v18[3] = &unk_1000D11C8;
    v18[4] = self;
    -[RPCompanionLinkClient setInvalidationHandler:](v3, "setInvalidationHandler:", v18);
    -[RPCompanionLinkClient setDispatchQueue:](v4, "setDispatchQueue:", self->_queue);
    -[RPCompanionLinkClient setServiceType:](v4, "setServiceType:", @"com.apple.wifivelocityd.rapportWake");
    uint64_t v5 = sub_10008C90C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      v21 = "-[W5RapportServer _configureCompaionLinkClient]";
      __int16 v22 = 2080;
      int v23 = "W5RapportServer.m";
      __int16 v24 = 1024;
      int v25 = 87;
      LODWORD(v13) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) companion link client activated successfully",  (const char *)&v20,  v13,  (_DWORD)v14);
    }

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportServer listeners](self, "listeners"));
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[W5RapportServer _registerRequestsForListener:rapportClient:]( self,  "_registerRequestsForListener:rapportClient:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  v4);
          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v9);
    }

    -[W5RapportServer setRapportClient:](self, "setRapportClient:", v4);
  }

  return v4 != 0LL;
}

- (void)_registerRequestsForListener:(id)a3 rapportClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      unsigned __int8 v9 = [v6 conformsToProtocol:&OBJC_PROTOCOL___W5PeerRequestListener];
      uint64_t v10 = sub_10008C90C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          int v19 = 138543618;
          id v20 = v6;
          __int16 v21 = 2114;
          __int16 v22 = v13;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] Registering listener='%{public}@' for identifier='%{public}@'",  &v19,  22);
        }

        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000817D0;
        v17[3] = &unk_1000D3340;
        int v18 = (os_log_s *)v6;
        [v8 registerRequestID:v14 options:0 handler:v17];

        -[RPCompanionLinkClient activateWithCompletion:]( self->_rapportClient,  "activateWithCompletion:",  &stru_1000D3360);
        uint64_t v11 = v18;
      }

      else if (v12)
      {
        int v19 = 138543362;
        id v20 = v6;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] listener='%{public}@' doesn't conform to protocol",  &v19,  12);
      }
    }

    else
    {
      uint64_t v16 = sub_10008C90C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] nil rapport client",  &v19,  2);
      }
    }
  }

  else
  {
    uint64_t v15 = sub_10008C90C();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] nil rapport listener",  &v19,  2);
    }
  }
}

- (void)invalidateDiscoveryClient
{
  rapportClient = self->_rapportClient;
  self->_rapportClient = 0LL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RPCompanionLinkClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end