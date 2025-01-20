@interface MRDAVReconnaissanceSession
- (MRDAVReconnaissanceSession)initWithRouteUID:(id)a3;
- (NSString)routeUID;
- (NSTimer)timeoutTimer;
- (id)callback;
- (void)_concludeSearchWithRoute:(id)a3;
- (void)_endSearch;
- (void)_routingDataSourcePickableRoutesDidChange:(id)a3;
- (void)_timeoutTimerFired:(id)a3;
- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4;
- (void)cancelSearch;
- (void)dealloc;
- (void)setCallback:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation MRDAVReconnaissanceSession

- (MRDAVReconnaissanceSession)initWithRouteUID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDAVReconnaissanceSession;
  v5 = -[MRDAVReconnaissanceSession init](&v12, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    routeUID = v5->_routeUID;
    v5->_routeUID = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___MRDAVRoutingDataSource);
    routingDataSource = v5->_routingDataSource;
    v5->_routingDataSource = v8;

    v5->_searchInProgress = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v5 selector:"_routingDataSourcePickableRoutesDidChange:" name:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:v5->_routingDataSource];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDAVReconnaissanceSession;
  -[MRDAVReconnaissanceSession dealloc](&v4, "dealloc");
}

- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v7 = a4;
  if (self->_searchInProgress) {
    -[MRDAVReconnaissanceSession cancelSearch](self, "cancelSearch");
  }
  uint64_t v8 = _MRLogForCategory(0LL, v6);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[ReconnaissanceSession] Beginning search with timeout %f",  (uint8_t *)&v11,  0xCu);
  }

  self->_searchInProgress = 1;
  self->_timeoutInterval = a3;
  -[MRDAVReconnaissanceSession setCallback:](self, "setCallback:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_timeoutTimerFired:",  0LL,  0LL,  a3));
  -[MRDAVReconnaissanceSession setTimeoutTimer:](self, "setTimeoutTimer:", v10);

  -[MRDAVRoutingDataSource setDiscoveryMode:](self->_routingDataSource, "setDiscoveryMode:", 3LL);
}

- (void)cancelSearch
{
  if (self->_searchInProgress)
  {
    uint64_t v3 = _MRLogForCategory(0LL, a2);
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[ReconnaissanceSession] Cancelling search for session %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
    if (v5)
    {
      Error = (void *)MRMediaRemoteCreateError(25LL);
      id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
      ((void (**)(void, void, void *))v7)[2](v7, 0LL, Error);
    }

    -[MRDAVReconnaissanceSession _endSearch](self, "_endSearch");
  }

- (void)_routingDataSourcePickableRoutesDidChange:(id)a3
{
  if (self->_searchInProgress)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource pickableRoutesForCategory:]( self->_routingDataSource,  "pickableRoutesForCategory:",  0LL));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    id v7 = v5;
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v13;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (v8 == (id)++v10)
        {
          id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8) {
            goto LABEL_4;
          }
          id v7 = v5;
          goto LABEL_13;
        }
      }

      id v7 = v11;

      if (!v7) {
        goto LABEL_14;
      }
      -[MRDAVReconnaissanceSession _concludeSearchWithRoute:](self, "_concludeSearchWithRoute:", v7);
    }

- (void)_timeoutTimerFired:(id)a3
{
  uint64_t v4 = _MRLogForCategory(0LL, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double timeoutInterval = self->_timeoutInterval;
    int v10 = 134217984;
    double v11 = timeoutInterval;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[ReconnaissanceSession] Session timed out after %f seconds",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
  if (v7)
  {
    Error = (void *)MRMediaRemoteCreateError(26LL);
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, Error);
  }

  -[MRDAVReconnaissanceSession _endSearch](self, "_endSearch");
}

- (void)_concludeSearchWithRoute:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ReconnaissanceSession] Found route matching query: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
  if (v8)
  {
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession callback](self, "callback"));
    ((void (**)(void, id, void))v9)[2](v9, v4, 0LL);
  }

  -[MRDAVReconnaissanceSession _endSearch](self, "_endSearch");
}

- (void)_endSearch
{
  if (self->_searchInProgress)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVReconnaissanceSession timeoutTimer](self, "timeoutTimer"));
    [v3 invalidate];

    -[MRDAVReconnaissanceSession setTimeoutTimer:](self, "setTimeoutTimer:", 0LL);
    -[MRDAVRoutingDataSource setDiscoveryMode:](self->_routingDataSource, "setDiscoveryMode:", 0LL);
    self->_searchInProgress = 0;
  }

- (NSString)routeUID
{
  return self->_routeUID;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end