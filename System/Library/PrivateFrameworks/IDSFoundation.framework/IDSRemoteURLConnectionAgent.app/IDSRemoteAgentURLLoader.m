@interface IDSRemoteAgentURLLoader
+ (BOOL)shouldAssertWiFi;
- (BOOL)disableKeepAlive;
- (BOOL)forceCellularIfPossible;
- (BOOL)requireIDSHost;
- (BOOL)shouldReturnTimingData;
- (BOOL)shouldUsePipelining;
- (IDSRemoteAgentURLLoader)initWithURLRequest:(id)a3 completionBlock:(id)a4;
- (NSString)bundleIdentifierForDataUsage;
- (NSString)uniqueID;
- (id)block;
- (int)concurrentConnections;
- (int)keepAliveCell;
- (int)keepAliveWifi;
- (void)cancel;
- (void)dealloc;
- (void)load;
- (void)setBundleIdentifierForDataUsage:(id)a3;
- (void)setConcurrentConnections:(int)a3;
- (void)setDisableKeepAlive:(BOOL)a3;
- (void)setForceCellularIfPossible:(BOOL)a3;
- (void)setKeepAliveCell:(int)a3;
- (void)setKeepAliveWifi:(int)a3;
- (void)setRequireIDSHost:(BOOL)a3;
- (void)setShouldReturnTimingData:(BOOL)a3;
- (void)setShouldUsePipelining:(BOOL)a3;
@end

@implementation IDSRemoteAgentURLLoader

+ (BOOL)shouldAssertWiFi
{
  if (qword_100015978 != -1) {
    dispatch_once(&qword_100015978, &stru_100010658);
  }
  return byte_100015970;
}

- (IDSRemoteAgentURLLoader)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSRemoteAgentURLLoader;
  v8 = -[IDSRemoteAgentURLLoader init](&v23, "init");
  if (v8)
  {
    uint64_t v9 = OSLogHandleForIDSCategory("URLLoading");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating loader with request: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v11) && _IDSShouldLog(0LL, @"URLLoading"))
    {
      id v22 = v6;
      _IDSLogV(0LL, @"IDSFoundation", @"URLLoading", @"Creating loader with request: %@");
    }

    v12 = (NSMutableURLRequest *)objc_msgSend(v6, "mutableCopy", v22);
    request = v8->_request;
    v8->_request = v12;

    id v14 = [v7 copy];
    id block = v8->_block;
    v8->_id block = v14;

    remoteURLConnection = v8->_remoteURLConnection;
    v8->_remoteURLConnection = 0LL;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    uniqueID = v8->_uniqueID;
    v8->_uniqueID = (NSString *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"IDSRemoteAgent",  v8->_uniqueID));
    wifiAssertionToken = v8->_wifiAssertionToken;
    v8->_wifiAssertionToken = (NSString *)v19;
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___IDSRemoteAgentURLLoader;
  -[IDSRemoteAgentURLLoader dealloc](&v2, "dealloc");
}

- (void)load
{
  v3 = objc_alloc(&OBJC_CLASS___IMRemoteURLConnection);
  request = self->_request;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005EDC;
  v9[3] = &unk_100010680;
  v9[4] = self;
  v5 = -[IMRemoteURLConnection initWithURLRequest:completionBlockWithTimingData:]( v3,  "initWithURLRequest:completionBlockWithTimingData:",  request,  v9);
  remoteURLConnection = self->_remoteURLConnection;
  self->_remoteURLConnection = v5;

  -[IMRemoteURLConnection setShouldUsePipelining:]( self->_remoteURLConnection,  "setShouldUsePipelining:",  -[IDSRemoteAgentURLLoader shouldUsePipelining](self, "shouldUsePipelining"));
  -[IMRemoteURLConnection setConcurrentConnections:]( self->_remoteURLConnection,  "setConcurrentConnections:",  -[IDSRemoteAgentURLLoader concurrentConnections](self, "concurrentConnections"));
  -[IMRemoteURLConnection setDisableKeepAlive:]( self->_remoteURLConnection,  "setDisableKeepAlive:",  -[IDSRemoteAgentURLLoader disableKeepAlive](self, "disableKeepAlive"));
  -[IMRemoteURLConnection setKeepAliveWifi:]( self->_remoteURLConnection,  "setKeepAliveWifi:",  -[IDSRemoteAgentURLLoader keepAliveWifi](self, "keepAliveWifi"));
  -[IMRemoteURLConnection setKeepAliveCell:]( self->_remoteURLConnection,  "setKeepAliveCell:",  -[IDSRemoteAgentURLLoader keepAliveCell](self, "keepAliveCell"));
  id v7 = self->_remoteURLConnection;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRemoteAgentURLLoader bundleIdentifierForDataUsage](self, "bundleIdentifierForDataUsage"));
  -[IMRemoteURLConnection setBundleIdentifierForDataUsage:](v7, "setBundleIdentifierForDataUsage:", v8);

  -[IMRemoteURLConnection setForceCellularIfPossible:]( self->_remoteURLConnection,  "setForceCellularIfPossible:",  -[IDSRemoteAgentURLLoader forceCellularIfPossible](self, "forceCellularIfPossible"));
  -[IMRemoteURLConnection setRequireIDSHost:]( self->_remoteURLConnection,  "setRequireIDSHost:",  -[IDSRemoteAgentURLLoader requireIDSHost](self, "requireIDSHost"));
  -[IMRemoteURLConnection setShouldReturnTimingData:]( self->_remoteURLConnection,  "setShouldReturnTimingData:",  -[IDSRemoteAgentURLLoader shouldReturnTimingData](self, "shouldReturnTimingData"));
  -[IMRemoteURLConnection load](self->_remoteURLConnection, "load");
}

- (void)cancel
{
  uint64_t v3 = OSLogHandleForIDSCategory("URLLoading");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v10 = request;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", buf, 0x16u);
  }

  id block = self->_block;
  if (block)
  {
    self->_id block = 0LL;
  }

  remoteURLConnection = self->_remoteURLConnection;
  if (remoteURLConnection) {
    -[IMRemoteURLConnection cancel](remoteURLConnection, "cancel");
  }
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (BOOL)forceCellularIfPossible
{
  return self->_forceCellularIfPossible;
}

- (void)setForceCellularIfPossible:(BOOL)a3
{
  self->_forceCellularIfPossible = a3;
}

- (NSString)bundleIdentifierForDataUsage
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundleIdentifierForDataUsage:(id)a3
{
}

- (BOOL)requireIDSHost
{
  return self->_requireIDSHost;
}

- (void)setRequireIDSHost:(BOOL)a3
{
  self->_requireIDSHost = a3;
}

- (BOOL)shouldUsePipelining
{
  return self->_shouldUsePipelining;
}

- (void)setShouldUsePipelining:(BOOL)a3
{
  self->_shouldUsePipelining = a3;
}

- (int)concurrentConnections
{
  return self->_concurrentConnections;
}

- (void)setConcurrentConnections:(int)a3
{
  self->_concurrentConnections = a3;
}

- (BOOL)disableKeepAlive
{
  return self->_disableKeepAlive;
}

- (void)setDisableKeepAlive:(BOOL)a3
{
  self->_disableKeepAlive = a3;
}

- (int)keepAliveWifi
{
  return self->_keepAliveWifi;
}

- (void)setKeepAliveWifi:(int)a3
{
  self->_keepAliveWifi = a3;
}

- (int)keepAliveCell
{
  return self->_keepAliveCell;
}

- (void)setKeepAliveCell:(int)a3
{
  self->_keepAliveCell = a3;
}

- (BOOL)shouldReturnTimingData
{
  return self->_shouldReturnTimingData;
}

- (void)setShouldReturnTimingData:(BOOL)a3
{
  self->_shouldReturnTimingData = a3;
}

- (void).cxx_destruct
{
}

@end