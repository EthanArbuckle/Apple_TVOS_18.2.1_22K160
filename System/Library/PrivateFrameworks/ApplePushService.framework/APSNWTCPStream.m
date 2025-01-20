@interface APSNWTCPStream
+ (BOOL)isKeepAliveProxyFeatureEnabled;
+ (BOOL)isKeepAliveProxySupportedOnSomeInterface;
+ (unsigned)cachedServerCountForDomain:(id)a3;
+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5;
- (APSNWTCPStream)initWithEnvironment:(id)a3;
- (APSTCPStreamDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)forceWWANInterface;
- (BOOL)hasErrorStatus;
- (BOOL)isConnected;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)isKeepAliveProxySupportedOnSocketInterface;
- (BOOL)isKeepAliveProxySupportedOnSomeInterface;
- (BOOL)isPeerTrustedForTrust:(__SecTrust *)a3;
- (BOOL)isSuspended;
- (BOOL)isTrust:(__SecTrust *)a3 validWithPolicy:(__SecPolicy *)a4 forPeer:(id)a5;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)useAlternatePort;
- (Class)configurationClass;
- (NSString)cachedIPAddress;
- (NSString)connectionDebugInfo;
- (NSString)ifname;
- (NSString)interfaceName;
- (NSString)redirectHostname;
- (NSString)serverHostname;
- (NSString)serverIPAddress;
- (id)_domain;
- (id)_getTCPInfoData;
- (id)tcpInfoDescription;
- (int64_t)allowedInterfaceConstraint;
- (int64_t)interfaceConstraint;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)generation;
- (unsigned)ipAddressFamily;
- (unsigned)serverPort;
- (void)_closeQuery;
- (void)_connectToServerWithConfiguration:(id)a3;
- (void)_connectToServerWithCount:(unsigned int)a3;
- (void)_connectToServerWithPeerName:(id)a3;
- (void)_openWithTXTLookup;
- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6;
- (void)_receiveData;
- (void)close;
- (void)dealloc;
- (void)handleState:(int)a3 error:(id)a4;
- (void)open;
- (void)setAllowedInterfaceConstraint:(int64_t)a3;
- (void)setCachedIPAddress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceWWANInterface:(BOOL)a3;
- (void)setIpAddressFamily:(unsigned __int8)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setRedirectHostname:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setUseAlternatePort:(BOOL)a3;
- (void)writeDataInBackground:(id)a3;
@end

@implementation APSNWTCPStream

+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  if (!qword_10014E8C0)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)qword_10014E8C0;
    qword_10014E8C0 = (uint64_t)v9;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v12 = v11;
  v13 = objc_alloc_init(&OBJC_CLASS____APSServerCount);
  -[_APSServerCount setTtlBegin:](v13, "setTtlBegin:", v12);
  -[_APSServerCount setTtlEnd:](v13, "setTtlEnd:", v12 + (double)a5);
  -[_APSServerCount setServerCount:](v13, "setServerCount:", v6);
  [(id)qword_10014E8C0 setObject:v13 forKey:v14];

  objc_sync_exit(v8);
}

+ (unsigned)cachedServerCountForDomain:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10014E8C0 objectForKey:v4]);
  if (v6
    && (+[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate"),
        double v8 = v7,
        [v6 ttlBegin],
        v8 > v9)
    && ([v6 ttlEnd], v8 < v10))
  {
    unsigned int v11 = [v6 serverCount];
  }

  else
  {
    unsigned int v11 = 0;
  }

  objc_sync_exit(v5);
  return v11;
}

- (APSNWTCPStream)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSNWTCPStream;
  uint64_t v6 = -[APSNWTCPStream init](&v9, "init");
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v7->_opened = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSNWTCPStream;
  -[APSNWTCPStream dealloc](&v3, "dealloc");
}

- (void)setForceWWANInterface:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:174 description:@"stream is opened but expected to be closed"];
  }

  self->_forceWWANInterface = a3;
}

- (void)setUseAlternatePort:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:179 description:@"stream is opened but expected to be closed"];
  }

  self->_useAlternatePort = a3;
}

- (void)setRedirectHostname:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_opened)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:184 description:@"stream is opened but expected to be closed"];

    id v5 = v9;
  }

  uint64_t v6 = (NSString *)[v5 copy];
  redirectHostname = self->_redirectHostname;
  self->_redirectHostname = v6;
}

- (NSString)redirectHostname
{
  return self->_redirectHostname;
}

- (void)setCachedIPAddress:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_opened)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:193 description:@"stream is opened but expected to be closed"];

    id v5 = v9;
  }

  uint64_t v6 = (NSString *)[v5 copy];
  cachedIPAddress = self->_cachedIPAddress;
  self->_cachedIPAddress = v6;
}

- (NSString)cachedIPAddress
{
  return self->_cachedIPAddress;
}

- (void)setIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"YES";
    if (self->_isConnected) {
      double v7 = @"YES";
    }
    else {
      double v7 = @"NO";
    }
    int v8 = 138412802;
    id v9 = self;
    if (!v3) {
      uint64_t v6 = @"NO";
    }
    __int16 v10 = 2112;
    unsigned int v11 = v7;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to change isConnected=%@ to %@",  (uint8_t *)&v8,  0x20u);
  }

  self->_isConnected = v3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"YES";
    if (self->_isSuspended) {
      double v7 = @"YES";
    }
    else {
      double v7 = @"NO";
    }
    int v8 = 138412802;
    id v9 = self;
    if (!v3) {
      uint64_t v6 = @"NO";
    }
    __int16 v10 = 2112;
    unsigned int v11 = v7;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to change isSuspended=%@ to %@",  (uint8_t *)&v8,  0x20u);
  }

  self->_isSuspended = v3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (int64_t)interfaceConstraint
{
  return self->_interfaceConstraint;
}

- (NSString)ifname
{
  return self->_interfaceName;
}

- (id)_domain
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  unsigned __int8 v4 = [v3 hasSuffix:@"."];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  uint64_t v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"."]);

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (Class)configurationClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___APSConfiguration, a2);
}

- (void)open
{
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    environment = self->_environment;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](environment, "name"));
    *(_DWORD *)buf = 138412802;
    v15 = self;
    __int16 v16 = 2112;
    v17 = environment;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Opening %@ with environment %@[%@]", buf, 0x20u);
  }

  if (self->_opened)
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:244 description:@"stream is opened but expected to be closed"];
  }

  self->_opened = 1;
  self->_hasSentPresence = 0;
  self->_generation = arc4random();
  if (-[APSEnvironment debugHostname](self->_environment, "debugHostname"))
  {
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[APSEnvironment hostname](self->_environment, "hostname"));
    serverHostname = self->_serverHostname;
    self->_serverHostname = v7;

    -[APSNWTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", self->_serverHostname);
  }

  else
  {
    BOOL v9 = !self->_forceWWANInterface;
    __int16 v10 = -[APSNWTCPStream configurationClass](self, "configurationClass");
    unsigned int v11 = self->_environment;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100069B48;
    v13[3] = &unk_10011F398;
    v13[4] = self;
    -[objc_class loadConfigurationForEnvironment:connectionType:block:]( v10,  "loadConfigurationForEnvironment:connectionType:block:",  v11,  v9,  v13);
  }

- (void)_openWithTXTLookup
{
  if (!-[APSEnvironment isLoadBalanced](self->_environment, "isLoadBalanced"))
  {
    int v8 = self;
    id v9 = 0LL;
    goto LABEL_5;
  }

  id v5 = (void *)objc_opt_class(self, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  id v7 = [v5 cachedServerCountForDomain:v6];

  if ((_DWORD)v7)
  {
    int v8 = self;
    id v9 = v7;
LABEL_5:
    -[APSNWTCPStream _connectToServerWithCount:](v8, "_connectToServerWithCount:", v9);
    return;
  }

  if (self->_forceWWANInterface)
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 WWANInterfaceName]);

    if (v11) {
      uint32_t v12 = if_nametoindex((const char *)[v11 UTF8String]);
    }
    else {
      uint32_t v12 = 0;
    }
  }

  else
  {
    uint32_t v12 = 0;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSNWTCPStream _domain](self, "_domain"));
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ performing DNS lookup for %@", buf, 0x16u);
  }

  id v15 = objc_claimAutoreleasedReturnValue(-[APSNWTCPStream _domain](self, "_domain"));
  uint64_t Record = DNSServiceQueryRecord( &self->_serviceQuery,  0,  v12,  (const char *)[v15 UTF8String],  0x10u,  1u,  (DNSServiceQueryRecordReply)sub_10006A2B0,  self);

  if ((_DWORD)Record)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ DNS query failed!", buf, 0xCu);
    }

    -[APSNWTCPStream close](self, "close");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = Record;
    uint64_t v19 = APSError(1LL, @"DNSServiceQueryRecord() failed: %d");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v20, v22);
  }

  else if (DNSServiceSetDispatchQueue(self->_serviceQuery, &_dispatch_main_q))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:327 description:@"DNSServiceSetDispatchQueue failed"];
  }

- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6
{
  if (a3 && (unsigned int v8 = a4) != 0)
  {
    uint64_t v9 = *(void *)&a5;
    -[APSNWTCPStream _closeQuery](self, "_closeQuery");
    uint8_t valueLen = 0;
    ValuePtr = TXTRecordGetValuePtr(v8, a3, "count", &valueLen);
    size_t v12 = valueLen;
    v13 = malloc(valueLen + 1LL);
    memcpy(v13, ValuePtr, v12);
    *((_BYTE *)v13 + v12) = 0;
    uint64_t v14 = strtol((const char *)v13, 0LL, 0);
    free(v13);
    if ((_DWORD)v14)
    {
      __int16 v16 = (void *)objc_opt_class(self, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
      [v16 setCachedServerCount:v14 forDomain:v17 ttl:v9];

      -[APSNWTCPStream _connectToServerWithCount:](self, "_connectToServerWithCount:", v14);
    }

    else
    {
      -[APSNWTCPStream close](self, "close");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, v8));
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = APSError(1LL, @"Unable to parse TXT service record: %@");
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v25, v22);
    }
  }

  else
  {
    -[APSNWTCPStream close](self, "close");
    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
    if (a6 == -65554) {
      uint64_t v19 = @"DNSServiceQueryRecord() returned no such record for %@";
    }
    else {
      uint64_t v19 = @"DNSServiceQueryRecord() failed async for %@: %d";
    }
    uint64_t v20 = APSError(1LL, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v26, "tcpStream:errorOccured:", self, v21, v18);
  }

- (void)_closeQuery
{
  serviceQuery = self->_serviceQuery;
  if (serviceQuery)
  {
    DNSServiceRefDeallocate(serviceQuery);
    self->_serviceQuery = 0LL;
  }

- (void)close
{
  if (self->_opened)
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      environment = self->_environment;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](environment, "name"));
      int v8 = 138412802;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      unsigned int v11 = environment;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Closing %@ with environment %@[%@]",  (uint8_t *)&v8,  0x20u);
    }

    -[APSNWTCPStream _closeQuery](self, "_closeQuery");
    connection = self->_connection;
    if (connection)
    {
      nw_connection_cancel(connection);
      id v7 = self->_connection;
      self->_connection = 0LL;
    }

    self->_opened = 0;
    self->_generation = 0LL;
  }

- (void)_connectToServerWithPeerName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  id v5 = v4;
  if (self->_connection)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000BF2C8((uint64_t)self, v6);
    }
  }

  else
  {
    id v7 = (NSString *)-[NSString copy](v4, "copy");
    peerName = self->_peerName;
    self->_peerName = v7;

    unint64_t v9 = -[APSEnvironment port](self->_environment, "port");
    if (self->_useAlternatePort) {
      unint64_t v9 = -[APSEnvironment alternatePort](self->_environment, "alternatePort");
    }
    unint64_t v10 = v9;
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL forceWWANInterface = self->_forceWWANInterface;
      *(_DWORD *)buf = 138413058;
      if (forceWWANInterface) {
        v13 = @"YES";
      }
      else {
        v13 = @"NO";
      }
      v61 = self;
      __int16 v62 = 2112;
      v63 = v5;
      __int16 v64 = 2048;
      unint64_t v65 = v10;
      __int16 v66 = 2112;
      v67 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ _connectToServerWithPeerName: %@ and port: %lu forceWWANInterface? %@",  buf,  0x2Au);
    }

    if (self->_opened)
    {
      uint64_t v6 = (os_log_s *)sub_10007783C(APSDemoHostsKey, 1);
      if (v6)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
        if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", v16));

          if (v17)
          {
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v18);
            if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
            {
              uint64_t v20 = (NSString *)[v17 copy];
              serverHostname = self->_serverHostname;
              self->_serverHostname = v20;

              uint64_t v22 = (NSString *)[v17 copy];
              v23 = self->_peerName;
              self->_peerName = v22;

              uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v25 = self->_serverHostname;
                *(_DWORD *)buf = 138412546;
                v61 = self;
                __int16 v62 = 2112;
                v63 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ Overriding server hostname/IP to %@",  buf,  0x16u);
              }
            }
          }
        }
      }

      endpoint = (nw_endpoint *)nw_endpoint_create_host_with_numeric_port( -[NSString UTF8String](self->_serverHostname, "UTF8String"),  (unsigned __int16)v10);
      objc_initWeak(&location, self);
      BOOL nagleEnabled = self->_nagleEnabled;
      configure_tls[0] = _NSConcreteStackBlock;
      configure_tls[1] = 3221225472LL;
      configure_tls[2] = sub_10006AD1C;
      configure_tls[3] = &unk_10011F7B8;
      v57 = v5;
      v48 = &v58;
      objc_copyWeak(&v58, &location);
      configure_tcp[0] = _NSConcreteStackBlock;
      configure_tcp[1] = 3221225472LL;
      configure_tcp[2] = sub_10006AED4;
      configure_tcp[3] = &unk_10011F7E0;
      BOOL v55 = nagleEnabled;
      configure_tcp[4] = self;
      secure_tcp = nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
      xpc_object_t empty = xpc_array_create_empty();
      xpc_array_set_uint64(empty, 0xFFFFFFFFFFFFFFFFLL, 0x1389uLL);
      nw_parameters_set_prohibited_interface_subtypes(secure_tcp, empty);
      nw_parameters_set_prefer_no_proxy(secure_tcp, 1);
      nw_parameters_set_service_class(secure_tcp, nw_service_class_responsive_data);
      if (!self->_forceWWANInterface) {
        goto LABEL_29;
      }
      v29 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      v30 = nw_protocol_stack_copy_internet_protocol(v29);
      nw_ip_options_set_local_address_preference(v30, nw_ip_local_address_preference_stable);

      if (!self->_forceWWANInterface) {
        goto LABEL_29;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance",  &v58,  endpoint));
      unsigned int v32 = [v31 allowBindingToWWAN];

      if (v32)
      {
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@: binding stream to WWAN interface",  buf,  0xCu);
        }

        nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_cellular);
      }

      else
      {
LABEL_29:
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream", v48));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%@: binding stream to non cellular interface",  buf,  0xCu);
        }

        nw_parameters_prohibit_interface_type(secure_tcp, nw_interface_type_cellular);
      }

      v35 = nw_connection_create(endpoint, secure_tcp);
      connection = self->_connection;
      self->_connection = v35;

      v37 = self->_connection;
      v38 = &_dispatch_main_q;
      nw_connection_set_queue(v37, &_dispatch_main_q);

      sendData = self->_sendData;
      if (sendData)
      {
        v40 = self->_connection;
        v41 = (dispatch_data_s *)-[NSMutableData _createDispatchData](sendData, "_createDispatchData");
        nw_connection_send(v40, v41, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);

        v42 = self->_sendData;
        self->_sendData = 0LL;
      }

      v43 = self->_connection;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10006AFD4;
      handler[3] = &unk_10011F808;
      objc_copyWeak(&v53, &location);
      nw_connection_set_state_changed_handler(v43, handler);
      -[APSNWTCPStream _receiveData](self, "_receiveData");
      if (!self->_remainsConnectedWhenWWANSuspends || !self->_forceWWANInterface)
      {
        v44 = self->_connection;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_10006B02C;
        v50[3] = &unk_10011F830;
        objc_copyWeak(&v51, &location);
        v50[4] = self;
        nw_connection_set_better_path_available_handler(v44, v50);
        objc_destroyWeak(&v51);
      }

      nw_connection_start(self->_connection);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v46 = objc_opt_respondsToSelector(WeakRetained, "tcpStream:hasDeterminedServerHostname:");

      if ((v46 & 1) != 0)
      {
        id v47 = objc_loadWeakRetained((id *)&self->_delegate);
        [v47 tcpStream:self hasDeterminedServerHostname:self->_serverHostname];
      }

      objc_destroyWeak(&v53);

      objc_destroyWeak(v48);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000BE37C();
      }
    }
  }
}

- (void)_connectToServerWithCount:(unsigned int)a3
{
  if (-[APSEnvironment debugHostname](self->_environment, "debugHostname"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment hostname](self->_environment, "hostname"));
    uint64_t v6 = (NSString *)[v5 copy];
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment hostname](self->_environment, "hostname"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSNWTCPStream _domain](self, "_domain"));
    uint64_t v6 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@.%@", v5, v8);
  }

  if (-[APSEnvironment isLoadBalanced](self->_environment, "isLoadBalanced"))
  {
    if (a3 <= 1) {
      a3 = 1;
    }
    unint64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%u-%@",  arc4random() % a3 + 1,  v6);
  }

  else
  {
    unint64_t v9 = v6;
  }

  serverHostname = self->_serverHostname;
  self->_serverHostname = v9;

  if (self->_redirectHostname)
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      redirectHostname = self->_redirectHostname;
      *(_DWORD *)buf = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = redirectHostname;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ courier redirect hostname is defined, using hostname %@ and peername %@",  buf,  0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_redirectHostname);
  }

  if (self->_cachedIPAddress)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      cachedIPAddress = self->_cachedIPAddress;
      *(_DWORD *)buf = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = cachedIPAddress;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ courier last cached ip address is defined, using hostname %@ and peername %@",  buf,  0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_cachedIPAddress);
  }

  -[APSNWTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", v6);
}

- (void)_connectToServerWithConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[APSEnvironment isLoadBalanced](self->_environment, "isLoadBalanced");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = (NSString *)[v4 serverCount];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2048;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ env isLoadBalanced, using server count %lu and hostname %@",  buf,  0x20u);
    }

    unint64_t v10 = arc4random();
    unint64_t v11 = v10 % ((unint64_t)[v4 serverCount] + 1);
    __int16 v12 = objc_alloc(&OBJC_CLASS___NSString);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue([v4 hostname]);
    uint64_t v14 = -[NSString initWithFormat:](v12, "initWithFormat:", @"%u-%@", v11, v13);
    serverHostname = self->_serverHostname;
    self->_serverHostname = v14;
  }

  else
  {
    if (v7)
    {
      __int16 v16 = (NSString *)objc_claimAutoreleasedReturnValue([v4 hostname]);
      *(_DWORD *)buf = 138412546;
      id v26 = self;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ env is not load balanced, using config's host name: %@",  buf,  0x16u);
    }

    __int16 v17 = (NSString *)objc_claimAutoreleasedReturnValue([v4 hostname]);
    v13 = self->_serverHostname;
    self->_serverHostname = v17;
  }

  if (self->_redirectHostname)
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      redirectHostname = self->_redirectHostname;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      v28 = redirectHostname;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ courier redirect hostname is defined, using hostname %@ and peername %@",  buf,  0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_redirectHostname);
  }

  if (self->_cachedIPAddress)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      cachedIPAddress = self->_cachedIPAddress;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      v28 = cachedIPAddress;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ courier last cached ip address is defined, using hostname %@ and peername %@",  buf,  0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_cachedIPAddress);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
  -[APSNWTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", v24);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  if (!self->_connection) {
    return 0LL;
  }
  unsigned int v5 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", a3, a4);
  connection = self->_connection;
  BOOL v7 = (dispatch_data_s *)-[NSData _createDispatchData](v5, "_createDispatchData");
  nw_connection_send(connection, v7, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);

  NSUInteger v8 = -[NSData length](v5, "length");
  return v8;
}

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  connection = self->_connection;
  id v11 = v4;
  if (connection)
  {
    BOOL v7 = (dispatch_data_s *)[v4 _createDispatchData];
    nw_connection_send(connection, v7, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);
  }

  else
  {
    sendData = self->_sendData;
    if (!sendData)
    {
      unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      unint64_t v10 = self->_sendData;
      self->_sendData = v9;

      id v5 = v11;
      sendData = self->_sendData;
    }

    -[NSMutableData appendData:](sendData, "appendData:", v5);
  }
}

- (BOOL)isTrust:(__SecTrust *)a3 validWithPolicy:(__SecPolicy *)a4 forPeer:(id)a5
{
  id v7 = a5;
  if (!sub_100077B08()
    || (BOOL v8 = 1,
        unint64_t v9 = (void *)sub_10007783C(APSTrustAllHosts, 1),
        unsigned __int8 v10 = [v9 BOOLValue],
        v9,
        (v10 & 1) == 0))
  {
    if (SecTrustSetPolicies(a3, a4))
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000BE530();
      }

      BOOL v8 = 0;
    }

    else
    {
      CFErrorRef error = 0LL;
      BOOL v8 = SecTrustEvaluateWithError(a3, &error);
      if (!v8)
      {
        if (error)
        {
          __int16 v12 = error;
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1000BE4D0();
          }
        }

        else
        {
          __int16 v12 = (__CFError *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000BE490(v12);
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)isPeerTrustedForTrust:(__SecTrust *)a3
{
  if (!a3) {
    return 0;
  }
  if (os_variant_allows_internal_security_policies("com.apple.aps.tls")
    && !-[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated"))
  {
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      peerName = self->_peerName;
      int v20 = 138412290;
      v21 = peerName;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not performing validation for %@",  (uint8_t *)&v20,  0xCu);
    }

    BOOL v9 = 1;
    goto LABEL_20;
  }

  if (!-[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000BE668((id *)&self->_environment, v5);
    }
  }

  uint64_t ApplePushService = SecPolicyCreateApplePushService(self->_peerName, 0LL);
  if (!ApplePushService)
  {
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000BE594((uint64_t *)&self->_peerName, v10, v11);
    }
    goto LABEL_19;
  }

  id v7 = (const void *)ApplePushService;
  unsigned __int8 v8 = -[APSNWTCPStream isTrust:validWithPolicy:forPeer:]( self,  "isTrust:validWithPolicy:forPeer:",  a3,  ApplePushService,  self->_peerName);
  CFRelease(v7);
  if ((v8 & 1) == 0)
  {
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000BE600((uint64_t)&self->_peerName, v10, v13, v14, v15, v16, v17, v18);
    }
LABEL_19:
    BOOL v9 = 0;
LABEL_20:

    return v9;
  }

  return 1;
}

- (void)handleState:(int)a3 error:(id)a4
{
  uint64_t v6 = (nw_error *)a4;
  if (self->_connection)
  {
    switch(a3)
    {
      case 1:
      case 4:
        -[APSNWTCPStream close](self, "close");
        self->_hasError = 1;
        id v7 = nw_error_copy_cf_error(v6);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tcpStream:self errorOccured:v7];
        goto LABEL_36;
      case 3:
        uint64_t v9 = nw_connection_copy_connected_path();
        id v7 = (os_log_s *)v9;
        if (v9)
        {
          unsigned __int8 v10 = (nw_interface *)nw_path_copy_interface(v9);
          uint64_t v11 = v10;
          if (v10)
          {
            __int16 v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  nw_interface_get_name(v10));
            uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
            interfaceName = self->_interfaceName;
            self->_interfaceName = v13;
          }
        }

        uint64_t v15 = (nw_endpoint *)nw_connection_copy_connected_remote_endpoint(self->_connection);
        id WeakRetained = v15;
        if (v15)
        {
          self->_ipAddressFamily = nw_endpoint_get_address(v15)->sa_family;
          uint64_t v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  nw_endpoint_get_hostname((nw_endpoint_t)WeakRetained));
          uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue(v16);
          serverIPAddress = self->_serverIPAddress;
          self->_serverIPAddress = v17;

          self->_serverPort = nw_endpoint_get_port((nw_endpoint_t)WeakRetained);
        }

        if (!self->_hasSentPresence)
        {
          id v19 = objc_loadWeakRetained((id *)&self->_delegate);
          char v20 = objc_opt_respondsToSelector( v19,  "tcpStreamHasConnected:context:enabledPackedFormat:maxEncoderTableSize:maxDecoderTableSize:secureHandshakeEnabled:");

          if ((v20 & 1) != 0)
          {
            connection = self->_connection;
            uint64_t v22 = nw_protocol_copy_tls_definition();
            v23 = nw_connection_copy_protocol_metadata(connection, v22);

            v42 = v23;
            if (v23 && nw_protocol_metadata_is_tls(v23))
            {
              uint64_t v24 = nw_tls_copy_sec_protocol_metadata(v23);
              negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(v24);
              if (negotiated_protocol) {
                id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  negotiated_protocol));
              }
              else {
                id v26 = 0LL;
              }
            }

            else
            {
              id v26 = 0LL;
            }

            __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ negotiatedProtocol: %@",  buf,  0x16u);
            }

            unsigned int v40 = [v26 hasPrefix:@"apns-pack-v1"];
            v41 = v26;
            if (v40)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsSeparatedByString:@":"]);
              __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v28;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Negotiated protocol components: %@",  buf,  0xCu);
              }

              if ([v28 count] == (id)3)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:1]);
                id v39 = [v30 integerValue];

                v31 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:2]);
                id v38 = [v31 integerValue];
              }

              else
              {
                id v38 = 0LL;
                id v39 = 0LL;
              }
            }

            else
            {
              id v38 = 0LL;
              id v39 = 0LL;
            }

            self->_hasSentPresence = 1;
            memset(buf, 0, sizeof(buf));
            nw_connection_fillout_tcp_statistics(self->_connection, buf);
            unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&buf[8]));
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)buf));
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&buf[16]));
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v33,  @"dns",  v34,  @"tls",  v32,  @"tcp_handshake",  0LL));
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v43 = 138412290;
              v44 = v35;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "connectionStatistics: %@", v43, 0xCu);
            }

            id v37 = objc_loadWeakRetained((id *)&self->_delegate);
            [v37 tcpStreamHasConnected:self context:v35 enabledPackedFormat:v40 maxEncoderTableSize:v39 maxDecoderTableSize:v38 secureHandshakeEnabled:1];
          }
        }

- (BOOL)hasErrorStatus
{
  return self->_hasError;
}

- (void)_receiveData
{
  if (self->_connection)
  {
    uint32_t v3 = 4 * vm_page_size;
    objc_initWeak(&location, self);
    connection = self->_connection;
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472LL;
    completion[2] = sub_10006C094;
    completion[3] = &unk_10011F858;
    objc_copyWeak(&v6, &location);
    completion[4] = self;
    nw_connection_receive(connection, 1u, v3, completion);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (id)_getTCPInfoData
{
  connection = self->_connection;
  if (!connection) {
    return 0LL;
  }
  id v4 = (void *)nw_connection_copy_tcp_info(connection, a2);
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if ([v5 count])
  {
    uint64_t v9 = 0LL;
    unsigned __int8 v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    __int16 v12 = sub_10006C344;
    uint64_t v13 = sub_10006C354;
    id v14 = 0LL;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006C35C;
    v8[3] = &unk_10011F3C0;
    v8[4] = self;
    v8[5] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)tcpInfoDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSNWTCPStream _getTCPInfoData](self, "_getTCPInfoData"));
  if ([v2 length] == (id)408)
  {
    uint32_t v3 = (unsigned __int8 *)[v2 bytes];
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %u %x %u %u %x %u %u %u %u %u %u %u %u %u %u %u %u %d %u %llu %llu %llu %llu %llu %llu",  *v3,  v3[1],  v3[2],  v3[3],  *((unsigned int *)v3 + 1),  *((unsigned int *)v3 + 2),  *((unsigned int *)v3 + 3),  *((unsigned int *)v3 + 4),  *((unsigned int *)v3 + 5),  *((unsigned int *)v3 + 6),  *((unsigned int *)v3 + 7),  *((unsigned int *)v3 + 9),  *((unsigned int *)v3 + 10),  *((unsigned int *)v3 + 11),  *((unsigned int *)v3 + 12),  *((unsigned int *)v3 + 13),  *((unsigned int *)v3 + 14),  *((unsigned int *)v3 + 15),  *((unsigned int *)v3 + 16),  *(_OWORD *)(v3 + 76),  *(void *)(v3 + 92),  *(void *)(v3 + 108),  *(void *)(v3 + 116),  *(void *)(v3 + 132)));
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000BEA14(v5);
    }

    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)isKeepAliveProxySupportedOnSocketInterface
{
  return 0;
}

+ (BOOL)isKeepAliveProxySupportedOnSomeInterface
{
  return 0;
}

- (BOOL)isKeepAliveProxyConfigured
{
  return 0;
}

- (BOOL)isKeepAliveProxySupportedOnSomeInterface
{
  return 0;
}

+ (BOOL)isKeepAliveProxyFeatureEnabled
{
  return 0;
}

- (BOOL)didPushCauseWake
{
  return 0;
}

- (NSString)connectionDebugInfo
{
  if (self->_serverHostname)
  {
    connection = self->_connection;
    if (connection)
    {
      id v4 = (nw_endpoint *)nw_connection_copy_connected_local_endpoint(connection, a2);
      uint64_t v5 = nw_connection_copy_connected_remote_endpoint(self->_connection);
      id v6 = (nw_endpoint *)v5;
      serverHostname = self->_serverHostname;
      if (v4)
      {
        hostname = nw_endpoint_get_hostname(v4);
        uint64_t port = nw_endpoint_get_port(v4);
        if (v6)
        {
LABEL_5:
          unsigned __int8 v10 = nw_endpoint_get_hostname(v6);
          uint64_t v11 = nw_endpoint_get_port(v6);
LABEL_9:
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ([%s]:%u, [%s]:%u)",  serverHostname,  hostname,  port,  v10,  v11));

          return (NSString *)v12;
        }
      }

      else
      {
        uint64_t port = 0LL;
        hostname = "";
        if (v5) {
          goto LABEL_5;
        }
      }

      uint64_t v11 = 0LL;
      unsigned __int8 v10 = "";
      goto LABEL_9;
    }
  }

  __int16 v12 = 0LL;
  return (NSString *)v12;
}

- (APSTCPStreamDelegate)delegate
{
  return (APSTCPStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serverHostname
{
  return self->_serverHostname;
}

- (NSString)serverIPAddress
{
  return self->_serverIPAddress;
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (BOOL)forceWWANInterface
{
  return self->_forceWWANInterface;
}

- (BOOL)useAlternatePort
{
  return self->_useAlternatePort;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  self->_remainsConnectedWhenWWANSuspends = a3;
}

- (unsigned)ipAddressFamily
{
  return self->_ipAddressFamily;
}

- (void)setIpAddressFamily:(unsigned __int8)a3
{
  self->_ipAddressFamily = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int64_t)allowedInterfaceConstraint
{
  return self->_allowedInterfaceConstraint;
}

- (void)setAllowedInterfaceConstraint:(int64_t)a3
{
  self->_allowedInterfaceConstraint = a3;
}

- (void).cxx_destruct
{
}

@end