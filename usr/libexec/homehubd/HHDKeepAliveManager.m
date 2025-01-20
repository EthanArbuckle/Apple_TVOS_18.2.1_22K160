@interface HHDKeepAliveManager
- (HHDKeepAliveManager)init;
- (HHDKeepAliveManager)initWithFactory:(id)a3;
- (void)_beginTrackingKeepAliveMetric;
- (void)_evaluateKeepAliveState;
- (void)_maybeSubmitKeepAliveMetric;
- (void)_updateKeepAliveFileState:(BOOL)a3;
- (void)_updateKeepAliveState:(BOOL)a3;
- (void)_updateMetricState:(BOOL)a3;
- (void)_updateTransactionState:(BOOL)a3;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)endpointService:(id)a3 didActivateEndpoint:(id)a4;
- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)endpointService:(id)a3 didRemoveEndpoint:(id)a4;
- (void)endpointServiceDidReactivateAllEndpoints:(id)a3;
- (void)stop;
@end

@implementation HHDKeepAliveManager

- (HHDKeepAliveManager)initWithFactory:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HHDKeepAliveManager;
  v6 = -[HHDKeepAliveManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[HHDKeepAliveManagerFactory createFileManager](v7->_factory, "createFileManager"));
    fileManager = v7->_fileManager;
    v7->_fileManager = (HHDKeepAliveFileManager *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 createAnalyticsReporter]);
    analyticsReporter = v7->_analyticsReporter;
    v7->_analyticsReporter = (HHAnalyticsReporter *)v10;
  }

  return v7;
}

- (HHDKeepAliveManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___HHDKeepAliveManagerFactory);
  v4 = -[HHDKeepAliveManager initWithFactory:](self, "initWithFactory:", v3);

  return v4;
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  id v4 = a3;
  id v5 = sub_100005EA4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@Bootstrapping", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 endpointManager]);
  [v7 addEndpointObserver:self];

  objc_storeWeak((id *)&self->_serviceRegistry, v4);
}

- (void)stop
{
  id v3 = sub_100005EA4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@Stopping", (uint8_t *)&v7, 0xCu);
  }

  -[HHDKeepAliveManager _updateKeepAliveState:](self, "_updateKeepAliveState:", 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained endpointManager]);
  [v6 removeEndpointObserver:self];
}

- (void)_beginTrackingKeepAliveMetric
{
  if (!self->_keepAliveMetric)
  {
    id v3 = (HHAnalyticsInterval *)objc_claimAutoreleasedReturnValue( -[HHAnalyticsReporter startIntervalWithEventName:eventBuilder:]( self->_analyticsReporter,  "startIntervalWithEventName:eventBuilder:",  @"com.apple.homehub.keepalive",  0LL));
    keepAliveMetric = self->_keepAliveMetric;
    self->_keepAliveMetric = v3;
  }

- (void)_maybeSubmitKeepAliveMetric
{
  keepAliveMetric = self->_keepAliveMetric;
  if (keepAliveMetric)
  {
    -[HHAnalyticsInterval endAndSendWithError:eventBuilder:]( keepAliveMetric,  "endAndSendWithError:eventBuilder:",  0LL,  0LL);
    id v4 = self->_keepAliveMetric;
    self->_keepAliveMetric = 0LL;
  }

- (void)_evaluateKeepAliveState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained endpointManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 endpointList]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "state", (void)v12) == (id)2)
        {
          uint64_t v7 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)_updateKeepAliveState:(BOOL)a3
{
  BOOL v3 = a3;
  -[HHDKeepAliveManager _updateKeepAliveFileState:](self, "_updateKeepAliveFileState:");
  -[HHDKeepAliveManager _updateTransactionState:](self, "_updateTransactionState:", v3);
  -[HHDKeepAliveManager _updateMetricState:](self, "_updateMetricState:", v3);
}

- (void)_updateKeepAliveFileState:(BOOL)a3
{
  int v3 = a3;
  unsigned int v5 = -[HHDKeepAliveFileManager exists](self->_fileManager, "exists");
  if (v5 != v3)
  {
    unsigned int v6 = v5;
    id v7 = sub_100005EA4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      __int128 v15 = &stru_100024E50;
      __int16 v16 = 1024;
      unsigned int v17 = v6;
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@State does not match (file exists: %{BOOL}d, needs keep-alive: %{BOOL}d)",  (uint8_t *)&v14,  0x18u);
    }

    fileManager = self->_fileManager;
    if ((v3 & 1) != 0)
    {
      if (!-[HHDKeepAliveFileManager createFileAndReturnError:](fileManager, "createFileAndReturnError:", 0LL)) {
        return;
      }
      id v10 = sub_100005EA4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      __int128 v15 = &stru_100024E50;
      __int128 v12 = "%@Created keep-alive file";
    }

    else
    {
      if (!-[HHDKeepAliveFileManager removeFileAndReturnError:](fileManager, "removeFileAndReturnError:", 0LL)) {
        return;
      }
      id v13 = sub_100005EA4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      __int128 v15 = &stru_100024E50;
      __int128 v12 = "%@Removed keep-alive file";
    }

    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
LABEL_12:
  }

- (void)_updateTransactionState:(BOOL)a3
{
  transaction = self->_transaction;
  if (a3)
  {
    if (transaction) {
      return;
    }
    unsigned int v5 = (OS_os_transaction *)objc_claimAutoreleasedReturnValue( -[HHDKeepAliveManagerFactory createTransactionWithName:]( self->_factory,  "createTransactionWithName:",  "com.apple.homehubd.keep-alive"));
    unsigned int v6 = self->_transaction;
    self->_transaction = v5;

    id v7 = sub_100005EA4();
    uint64_t v8 = (OS_os_transaction *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int128 v12 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Created new transaction",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    if (!transaction) {
      return;
    }
    id v9 = sub_100005EA4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int128 v12 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@Resetting transaction...",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v8 = self->_transaction;
    self->_transaction = 0LL;
  }
}

- (void)_updateMetricState:(BOOL)a3
{
  if (a3) {
    -[HHDKeepAliveManager _beginTrackingKeepAliveMetric](self, "_beginTrackingKeepAliveMetric");
  }
  else {
    -[HHDKeepAliveManager _maybeSubmitKeepAliveMetric](self, "_maybeSubmitKeepAliveMetric");
  }
}

- (void)endpointService:(id)a3 didActivateEndpoint:(id)a4
{
}

- (void)endpointService:(id)a3 didDeactivateEndpoint:(id)a4
{
}

- (void)endpointService:(id)a3 didRemoveEndpoint:(id)a4
{
}

- (void)endpointServiceDidReactivateAllEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end