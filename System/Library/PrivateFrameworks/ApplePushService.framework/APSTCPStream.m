@interface APSTCPStream
+ (BOOL)isKeepAliveProxyFeatureEnabled;
+ (BOOL)isKeepAliveProxySupportedOnSomeInterface;
+ (unsigned)cachedServerCountForDomain:(id)a3;
+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5;
- (APSTCPStream)initWithEnvironment:(id)a3;
- (APSTCPStreamDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)forceWWANInterface;
- (BOOL)hasErrorStatus;
- (BOOL)isConnected;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)isKeepAliveProxySupportedOnSocketInterface;
- (BOOL)isKeepAliveProxySupportedOnSomeInterface;
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
- (id)_copyServerIPAddressString;
- (id)_domain;
- (id)_getTCPInfoData;
- (id)taskTransactionMetrics;
- (id)tcpInfoDescription;
- (int64_t)allowedInterfaceConstraint;
- (int64_t)interfaceConstraint;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (sockaddr)_copyLocalSockAddr;
- (sockaddr)_copyRemoteSockAddr;
- (unint64_t)generation;
- (unsigned)ipAddressFamily;
- (unsigned)serverPort;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_closeQuery;
- (void)_connectToServerWithConfiguration:(id)a3;
- (void)_connectToServerWithCount:(unsigned int)a3;
- (void)_connectToServerWithPeerName:(id)a3;
- (void)_hasBytesAvailable;
- (void)_hasSpaceAvailable;
- (void)_openWithTXTLookup;
- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6;
- (void)close;
- (void)configureWhetherPeerIsTrustedFor:(__SecTrust *)a3;
- (void)dealloc;
- (void)open;
- (void)setCachedIPAddress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceWWANInterface:(BOOL)a3;
- (void)setIpAddressFamily:(unsigned __int8)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setRedirectHostname:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setUseAlternatePort:(BOOL)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeDataInBackground:(id)a3;
@end

@implementation APSTCPStream

+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  if (!qword_10014E848)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)qword_10014E848;
    qword_10014E848 = (uint64_t)v9;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v12 = v11;
  v13 = objc_alloc_init(&OBJC_CLASS____APSServerCount);
  -[_APSServerCount setTtlBegin:](v13, "setTtlBegin:", v12);
  -[_APSServerCount setTtlEnd:](v13, "setTtlEnd:", v12 + (double)a5);
  -[_APSServerCount setServerCount:](v13, "setServerCount:", v6);
  [(id)qword_10014E848 setObject:v13 forKey:v14];

  objc_sync_exit(v8);
}

+ (unsigned)cachedServerCountForDomain:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10014E848 objectForKey:v4]);
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

- (APSTCPStream)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSTCPStream;
  uint64_t v6 = -[APSTCPStream init](&v9, "init");
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    *(_WORD *)&v7->_hasCompletedTLSHandshake = 0;
    v7->_opened = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSTCPStream;
  -[APSTCPStream dealloc](&v3, "dealloc");
}

- (void)setForceWWANInterface:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:177 description:@"stream is opened but expected to be closed"];
  }

  self->_forceWWANInterface = a3;
}

- (void)setUseAlternatePort:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:182 description:@"stream is opened but expected to be closed"];
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
    [v8 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:187 description:@"stream is opened but expected to be closed"];

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
    [v8 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:196 description:@"stream is opened but expected to be closed"];

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
  return 0LL;
}

- (int64_t)allowedInterfaceConstraint
{
  return 0LL;
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
    [v12 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:255 description:@"stream is opened but expected to be closed"];
  }

  self->_opened = 1;
  self->_hasSentPresence = 0;
  self->_generation = arc4random();
  if (-[APSEnvironment debugHostname](self->_environment, "debugHostname"))
  {
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[APSEnvironment hostname](self->_environment, "hostname"));
    serverHostname = self->_serverHostname;
    self->_serverHostname = v7;

    -[APSTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", self->_serverHostname);
  }

  else
  {
    BOOL v9 = !self->_forceWWANInterface;
    __int16 v10 = -[APSTCPStream configurationClass](self, "configurationClass");
    unsigned int v11 = self->_environment;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000558A8;
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
    -[APSTCPStream _connectToServerWithCount:](v8, "_connectToServerWithCount:", v9);
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
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream _domain](self, "_domain"));
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ performing DNS lookup for %@", buf, 0x16u);
  }

  id v15 = objc_claimAutoreleasedReturnValue(-[APSTCPStream _domain](self, "_domain"));
  uint64_t Record = DNSServiceQueryRecord( &self->_serviceQuery,  0,  v12,  (const char *)[v15 UTF8String],  0x10u,  1u,  (DNSServiceQueryRecordReply)sub_100056010,  self);

  if ((_DWORD)Record)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ DNS query failed!", buf, 0xCu);
    }

    -[APSTCPStream close](self, "close");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = Record;
    uint64_t v19 = APSError(1LL, @"DNSServiceQueryRecord() failed: %d");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v20, v22);
  }

  else if (DNSServiceSetDispatchQueue(self->_serviceQuery, &_dispatch_main_q))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:339 description:@"DNSServiceSetDispatchQueue failed"];
  }

- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6
{
  if (a3 && (unsigned int v8 = a4) != 0)
  {
    uint64_t v9 = *(void *)&a5;
    -[APSTCPStream _closeQuery](self, "_closeQuery");
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

      -[APSTCPStream _connectToServerWithCount:](self, "_connectToServerWithCount:", v14);
    }

    else
    {
      -[APSTCPStream close](self, "close");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, v8));
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = APSError(1LL, @"Unable to parse TXT service record: %@");
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v25, v22);
    }
  }

  else
  {
    -[APSTCPStream close](self, "close");
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
      int v11 = 138412802;
      size_t v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = environment;
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Closing %@ with environment %@[%@]",  (uint8_t *)&v11,  0x20u);
    }

    -[APSTCPStream _closeQuery](self, "_closeQuery");
    readStream = self->_readStream;
    if (readStream && self->_writeStream)
    {
      -[NSInputStream setDelegate:](readStream, "setDelegate:", 0LL);
      -[NSOutputStream setDelegate:](self->_writeStream, "setDelegate:", 0LL);
      -[NSInputStream close](self->_readStream, "close");
      -[NSOutputStream close](self->_writeStream, "close");
      streamTask = self->_streamTask;
      self->_streamTask = 0LL;

      urlSession = self->_urlSession;
      self->_urlSession = 0LL;

      uint64_t v9 = self->_readStream;
      self->_readStream = 0LL;

      writeStream = self->_writeStream;
      self->_writeStream = 0LL;
    }

    else
    {
      -[NSURLSessionStreamTask cancel](self->_streamTask, "cancel");
    }

    self->_opened = 0;
    self->_generation = 0LL;
  }

- (void)_connectToServerWithPeerName:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  id v5 = v4;
  if (*(_OWORD *)&self->_readStream != 0LL)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000BE3DC((uint64_t)self, v6);
    }
    goto LABEL_4;
  }

  id v7 = (NSString *)-[__CFString copy](v4, "copy");
  peerName = self->_peerName;
  self->_peerName = v7;

  unint64_t v9 = -[APSEnvironment port](self->_environment, "port");
  if (self->_useAlternatePort) {
    unint64_t v9 = -[APSEnvironment alternatePort](self->_environment, "alternatePort");
  }
  unint64_t v10 = v9;
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL forceWWANInterface = self->_forceWWANInterface;
    *(_DWORD *)buf = 138413058;
    if (forceWWANInterface) {
      __int16 v13 = @"YES";
    }
    else {
      __int16 v13 = @"NO";
    }
    v52 = self;
    __int16 v53 = 2112;
    v54 = v5;
    __int16 v55 = 2048;
    unint64_t v56 = v10;
    __int16 v57 = 2112;
    v58 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ _connectToServerWithPeerName: %@ and port: %lu forceWWANInterface? %@",  buf,  0x2Au);
  }

  if (self->_opened)
  {
    unint64_t v50 = v10;
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
              v52 = self;
              __int16 v53 = 2112;
              v54 = (const __CFString *)v25;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ Overriding server hostname/IP to %@",  buf,  0x16u);
            }
          }
        }
      }
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    objc_msgSend(v27, "set_tlsTrustPinningPolicyName:", kSecPolicyNameApplePushService);
    [v27 setAllowsCellularAccess:1];
    [v27 setNetworkServiceType:6];
    if (-[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated")) {
      v28 = v5;
    }
    else {
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v29 = v28;
    v30 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated")));
    v49 = v29;
    v32 = -[NSMutableDictionary initWithObjectsAndKeys:]( v30,  "initWithObjectsAndKeys:",  v29,  kCFStreamSSLPeerName,  v31,  kCFStreamSSLValidatesCertificateChain,  0LL);

    [v26 setObject:v32 forKey:kCFStreamPropertySSLSettings];
    [v26 setObject:&off_10012B8D0 forKey:_kCFStreamPropertyNPNProtocolsAvailable];
    if (self->_forceWWANInterface
      && (v33 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( PCPersistentInterfaceManager,  "sharedInstance")),  unsigned int v34 = [v33 allowBindingToWWAN],  v33,  v34))
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@: binding stream to WWAN interface",  buf,  0xCu);
      }

      v36 = &kCFStreamPropertyDataConnectionServiceType;
      v37 = (const CFBooleanRef *)&kCTDataConnectionServiceTypeInternet;
    }

    else
    {
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%@: binding stream to non cellular interface",  buf,  0xCu);
      }

      [v26 setObject:kCFBooleanTrue forKey:kCFStreamPropertyNoCellular];
      v36 = &kCFStreamPropertyDataContextOnDemand;
      v37 = &kCFBooleanFalse;
    }

    [v26 setObject:*v37 forKey:*v36];
    [v26 setObject:v32 forKey:kCFStreamPropertySSLSettings];
    [v26 setObject:&__kCFBooleanTrue forKey:_kCFStreamPropertyEnableConnectionStatistics];
    if (self->_remainsConnectedWhenWWANSuspends)
    {
      if (!self->_forceWWANInterface)
      {
LABEL_39:
        if (!self->_nagleEnabled)
        {
          [v26 setObject:&__kCFBooleanTrue forKey:_kCFStreamSocketSetNoDelay];
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = @"NO";
            if (!self->_nagleEnabled) {
              v40 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            v52 = self;
            __int16 v53 = 2112;
            v54 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%@ Set _kCFStreamSocketSetNoDelay = %@",  buf,  0x16u);
          }
        }

        [v26 setObject:kCFBooleanTrue forKey:_kCFStreamPropertyNoCompanion];
        [v26 setObject:&__kCFBooleanTrue forKey:@"_kCFStreamPropertyPrefersNoProxy"];
        objc_msgSend(v27, "set_socketStreamProperties:", v26);
        [v27 setTLSMinimumSupportedProtocolVersion:772];
        v41 = objc_autoreleasePoolPush();
        uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
        v43 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v27,  self,  v42));
        urlSession = self->_urlSession;
        self->_urlSession = v43;

        v45 = (NSURLSessionStreamTask *)objc_claimAutoreleasedReturnValue( -[NSURLSession streamTaskWithHostName:port:]( self->_urlSession,  "streamTaskWithHostName:port:",  self->_serverHostname,  v50));
        streamTask = self->_streamTask;
        self->_streamTask = v45;

        -[NSURLSessionStreamTask startSecureConnection](self->_streamTask, "startSecureConnection");
        -[NSURLSessionStreamTask resume](self->_streamTask, "resume");
        -[NSURLSessionStreamTask captureStreams](self->_streamTask, "captureStreams");
        -[NSURLSession finishTasksAndInvalidate](self->_urlSession, "finishTasksAndInvalidate");
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v42) = objc_opt_respondsToSelector(WeakRetained, "tcpStream:hasDeterminedServerHostname:");

        if ((v42 & 1) != 0)
        {
          id v48 = objc_loadWeakRetained((id *)&self->_delegate);
          [v48 tcpStream:self hasDeterminedServerHostname:self->_serverHostname];
        }

        objc_autoreleasePoolPop(v41);

        goto LABEL_4;
      }

      [v26 setObject:&__kCFBooleanFalse forKey:@"kCFStreamPropertyAutoErrorOnSystemChange"];
    }

    if (self->_forceWWANInterface) {
      [v26 setObject:&off_10012B4B8 forKey:_kCFStreamPropertyLocalAddressPreference];
    }
    goto LABEL_39;
  }

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000BE37C();
  }
LABEL_4:
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
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream _domain](self, "_domain"));
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
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
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
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
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

  -[APSTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", v6);
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
      unsigned int v8 = (NSString *)[v4 serverCount];
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
    size_t v12 = objc_alloc(&OBJC_CLASS___NSString);
    __int16 v13 = (NSString *)objc_claimAutoreleasedReturnValue([v4 hostname]);
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
    __int16 v13 = self->_serverHostname;
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
  -[APSTCPStream _connectToServerWithPeerName:](self, "_connectToServerWithPeerName:", v24);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  writeStream = self->_writeStream;
  if (writeStream
    && (self->_hasCompletedTLSHandshake
     || (-[APSTCPStream stream:handleEvent:](self, "stream:handleEvent:"), (writeStream = self->_writeStream) != 0LL))
    && !self->_sendData)
  {
    return -[NSOutputStream write:maxLength:](writeStream, "write:maxLength:", a3, a4);
  }

  else
  {
    return 0LL;
  }

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  if (self->_isSuspended)
  {
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      unint64_t v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to write data on suspended stream",  (uint8_t *)&v10,  0xCu);
    }
  }

  sendData = self->_sendData;
  if (!sendData)
  {
    BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    unsigned int v8 = self->_sendData;
    self->_sendData = v7;

    sendData = self->_sendData;
  }

  -[NSMutableData appendData:](sendData, "appendData:", v4);
  writeStream = self->_writeStream;
  if (writeStream && -[NSOutputStream hasSpaceAvailable](writeStream, "hasSpaceAvailable")) {
    -[APSTCPStream _hasSpaceAvailable](self, "_hasSpaceAvailable");
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
      unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
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
          size_t v12 = error;
          __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1000BE4D0();
          }
        }

        else
        {
          size_t v12 = (__CFError *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000BE490(v12);
          }
        }
      }
    }
  }

  return v8;
}

- (void)configureWhetherPeerIsTrustedFor:(__SecTrust *)a3
{
  if (a3)
  {
    *(_WORD *)&self->_hasCompletedTLSHandshake = 1;
    if (os_variant_allows_internal_security_policies("com.apple.aps.tls")
      && !-[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated"))
    {
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        peerName = self->_peerName;
        int v19 = 138412290;
        uint64_t v20 = peerName;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not performing validation for %@",  (uint8_t *)&v19,  0xCu);
      }

      self->_peerCertificateIsAuthorized = 1;
    }

    else
    {
      if (!-[APSEnvironment isCertificateValidated](self->_environment, "isCertificateValidated"))
      {
        unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          sub_1000BE668((id *)&self->_environment, v5);
        }
      }

      p_peerName = (uint64_t *)&self->_peerName;
      uint64_t ApplePushService = SecPolicyCreateApplePushService(self->_peerName, 0LL);
      if (ApplePushService)
      {
        BOOL v8 = (const void *)ApplePushService;
        self->_peerCertificateIsAuthorized = -[APSTCPStream isTrust:validWithPolicy:forPeer:]( self,  "isTrust:validWithPolicy:forPeer:",  *a3,  ApplePushService,  self->_peerName);
        CFRelease(v8);
        if (self->_peerCertificateIsAuthorized) {
          return;
        }
        unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000BE600((uint64_t)p_peerName, v9, v10, v11, v12, v13, v14, v15);
        }
      }

      else
      {
        unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          sub_1000BE594(p_peerName, v9, v16);
        }
      }
    }
  }

  else
  {
    *(_WORD *)&self->_hasCompletedTLSHandshake = 0;
  }

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v6 = (NSInputStream *)a3;
  id v7 = v6;
  if (self->_opened)
  {
    switch(a4)
    {
      case 1uLL:
        if (self->_readStream == v6)
        {
          BOOL v8 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( v6,  "propertyForKey:",  @"kCFStreamPropertyInterfaceIdentifier"));
          interfaceName = self->_interfaceName;
          self->_interfaceName = v8;

          if (!self->_interfaceName)
          {
            uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              sub_1000BE754();
            }
          }

          if (!self->_serverIPAddress)
          {
            uint64_t v11 = -[APSTCPStream _copyServerIPAddressString](self, "_copyServerIPAddressString");
            serverIPAddress = self->_serverIPAddress;
            self->_serverIPAddress = v11;

            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSessionStreamTask _incompleteCurrentTaskTransactionMetrics]( self->_streamTask,  "_incompleteCurrentTaskTransactionMetrics"));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remotePort]);
            self->_serverPort = (unsigned __int16)[v14 unsignedIntValue];

            uint64_t v15 = -[APSTCPStream _copyLocalSockAddr](self, "_copyLocalSockAddr");
            if (v15) {
              unsigned __int8 sa_family = v15->sa_family;
            }
            else {
              unsigned __int8 sa_family = 30;
            }
            self->_ipAddressFamily = sa_family;
            free(v15);
          }
        }

        goto LABEL_20;
      case 2uLL:
        -[APSTCPStream _hasBytesAvailable](self, "_hasBytesAvailable");
        goto LABEL_20;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_20;
      case 4uLL:
        if (self->_hasSentPresence) {
          goto LABEL_17;
        }
        if (!self->_hasCompletedTLSHandshake) {
          goto LABEL_17;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v20 = objc_opt_respondsToSelector( WeakRetained,  "tcpStreamHasConnected:context:enabledPackedFormat:maxEncoderTableSize:maxDecoderTableSize:secureHandshakeEnabled:");

        if ((v20 & 1) == 0) {
          goto LABEL_17;
        }
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( v7,  "propertyForKey:",  @"_kCFStreamPropertyNPNSelectedProtocol"));
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v44 = self;
          __int16 v45 = 2112;
          v46 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ npnSelectedProtocols: %@", buf, 0x16u);
        }

        unsigned int v42 = -[__CFString hasPrefix:](v21, "hasPrefix:", @"apns-pack-v1");
        v39 = v21;
        if (v42)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( v7,  "propertyForKey:",  @"_kCFStreamPropertyNPNSelectedProtocol"));
          uint64_t v24 = (APSTCPStream *)objc_claimAutoreleasedReturnValue([v23 componentsSeparatedByString:@":"]);

          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "NPN Selected protocol components: %@",  buf,  0xCu);
          }

          if (-[APSTCPStream count](v24, "count") == (id)3)
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", 1LL));
            id v41 = [v26 integerValue];

            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", 2LL));
            id v40 = [v27 integerValue];
          }

          else
          {
            id v40 = 0LL;
            id v41 = 0LL;
          }
        }

        else
        {
          id v40 = 0LL;
          id v41 = 0LL;
        }

        self->_hasSentPresence = 1;
        v28 = (APSTCPStream *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( v7,  "propertyForKey:",  @"_kCFStreamPropertyConnectionStatistics"));
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( -[APSTCPStream objectForKey:]( v28,  "objectForKey:",  @"_kCFStreamStatsConnectionEstablishmentTimeMs"));
        v30 = (void *)objc_claimAutoreleasedReturnValue( -[APSTCPStream objectForKey:]( v28,  "objectForKey:",  @"_kCFStreamStatsDNS_ResolutionTimeMs"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream objectForKey:](v28, "objectForKey:", @"_kCFStreamStatsTLS_HandshakeTimeMs"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v30,  @"dns",  v31,  @"tls",  v29,  @"tcp_handshake",  0LL));
        v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( v7,  "propertyForKey:",  _kCFStreamPropertySSLClientCertificateState));
        id v34 = [v33 isEqualToNumber:&off_10012B4D0];

        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = @"NO";
          if ((_DWORD)v34) {
            v36 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          v44 = v28;
          __int16 v45 = 2112;
          v46 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "connectionStatistics: %@ secureHandshakeEnabled %@",  buf,  0x16u);
        }

        CFRetain(self);
        id v37 = objc_loadWeakRetained((id *)&self->_delegate);
        [v37 tcpStreamHasConnected:self context:v32 enabledPackedFormat:v42 maxEncoderTableSize:v41 maxDecoderTableSize:v40 secureHandshakeEnabled:v34];

        LODWORD(v37) = self->_opened;
        CFRelease(self);
        if ((_DWORD)v37)
        {

LABEL_17:
          -[APSTCPStream _hasSpaceAvailable](self, "_hasSpaceAvailable");
        }

        else
        {
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v44 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "<APSTCPStream: %p> TCPStream closed in call to tcpStreamHasConnected: -- returning",  buf,  0xCu);
          }
        }

        goto LABEL_20;
      case 8uLL:
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSInputStream streamError](v7, "streamError"));
        [v17 tcpStream:self errorOccured:v18];

        goto LABEL_19;
      default:
        if (a4 != 16) {
          goto LABEL_20;
        }
        -[APSTCPStream close](self, "close");
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 tcpStreamEndEncountered:self withReason:21];
        goto LABEL_19;
    }
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
    sub_1000BE6F4();
  }
LABEL_19:

LABEL_20:
}

- (BOOL)hasErrorStatus
{
  return -[NSInputStream streamStatus](self->_readStream, "streamStatus") == (id)7;
}

- (id)_copyServerIPAddressString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSessionStreamTask _incompleteCurrentTaskTransactionMetrics]( self->_streamTask,  "_incompleteCurrentTaskTransactionMetrics"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteAddress]);

  return v3;
}

- (sockaddr)_copyLocalSockAddr
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSessionStreamTask _incompleteCurrentTaskTransactionMetrics]( self->_streamTask,  "_incompleteCurrentTaskTransactionMetrics"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 localAddress]);
  unsigned int v5 = (char *)[v4 UTF8String];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localPort]);
  unsigned int v7 = [v6 unsignedShortValue];

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Copying local sockaddr {address: %s, port: %d}",  (uint8_t *)&v11,  0x1Cu);
  }

  unint64_t v9 = 0LL;
  if (v5 && v7) {
    unint64_t v9 = (sockaddr *)sub_100057CD0(v5, v7);
  }

  return v9;
}

- (sockaddr)_copyRemoteSockAddr
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSessionStreamTask _incompleteCurrentTaskTransactionMetrics]( self->_streamTask,  "_incompleteCurrentTaskTransactionMetrics"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 remoteAddress]);
  unsigned int v5 = (char *)[v4 UTF8String];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 remotePort]);
  unsigned int v7 = [v6 unsignedShortValue];

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Copying remote sockaddr {address: %s, port: %d}",  (uint8_t *)&v11,  0x1Cu);
  }

  unint64_t v9 = 0LL;
  if (v5 && v7) {
    unint64_t v9 = (sockaddr *)sub_100057CD0(v5, v7);
  }

  return v9;
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = v14;
  if (!v13 || !v14)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v30 handleFailureInMethod:a2, self, @"APSTCPStream.m", 862, @" %s: %@ received nil streams, readStream %@ writeStream %@", "-[APSTCPStream URLSession:streamTask:didBecomeInputStream:outputStream:]", self, self->_readStream, self->_writeStream object file lineNumber description];
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 streamError]);
  if (v16 || (unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 streamError])) != 0)
  {
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000BE834();
    }

    [v13 close];
    [v15 close];
    -[APSTCPStream close](self, "close");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector(WeakRetained, "tcpStream:errorOccured:");

    if ((v19 & 1) != 0)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 tcpStream:self errorOccured:v16];
    }
  }

  else
  {
    if (self->_opened)
    {
      p_readStream = (id *)&self->_readStream;
      objc_storeStrong((id *)&self->_readStream, a5);
      p_writeStream = (id *)&self->_writeStream;
      objc_storeStrong((id *)&self->_writeStream, a6);
      clientContext.version = 0LL;
      clientContext.info = self;
      clientContext.retain = (void *(__cdecl *)(void *))&_CFRetain;
      clientContext.release = (void (__cdecl *)(void *))&_CFRelease;
      clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
      CFReadStreamSetClient( (CFReadStreamRef)self->_readStream,  0x1BuLL,  (CFReadStreamClientCallBack)sub_1000581FC,  &clientContext);
      -[NSOutputStream setDelegate:](self->_writeStream, "setDelegate:", self);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Opening streams", buf, 2u);
      }

      uint64_t v24 = (__CFReadStream *)*p_readStream;
      Main = CFRunLoopGetMain();
      CFReadStreamScheduleWithRunLoop(v24, Main, kCFRunLoopDefaultMode);
      id v26 = (__CFWriteStream *)*p_writeStream;
      __int16 v27 = CFRunLoopGetMain();
      CFWriteStreamScheduleWithRunLoop(v26, v27, kCFRunLoopDefaultMode);
      [*p_readStream open];
      [*p_writeStream open];
    }

    else
    {
      streamTask = self->_streamTask;
      self->_streamTask = 0LL;

      urlSession = self->_urlSession;
      self->_urlSession = 0LL;
    }

    unsigned int v16 = 0LL;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  unint64_t v9 = (void (**)(id, void, void *))a6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authenticationMethod]);
  unsigned int v12 = [v11 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 host]);

    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      peerName = self->_peerName;
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      *(void *)v28 = v14;
      *(_WORD *)&v28[8] = 2112;
      __int16 v29 = peerName;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ sslHostname: %@ peerName: %@", buf, 0x20u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
    id v18 = [v17 serverTrust];

    id v24 = v18;
    -[APSTCPStream configureWhetherPeerIsTrustedFor:](self, "configureWhetherPeerIsTrustedFor:", &v24);
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hasCompletedTLSHandshake = self->_hasCompletedTLSHandshake;
      BOOL peerCertificateIsAuthorized = self->_peerCertificateIsAuthorized;
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = hasCompletedTLSHandshake;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = peerCertificateIsAuthorized;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ didReceiveChallenge: _hasCompletedTLSHandshake: %d _peerCertificateIsAuthorized : %d",  buf,  0x18u);
    }

    if (self->_hasCompletedTLSHandshake && self->_peerCertificateIsAuthorized)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v22 serverTrust]));
      v9[2](v9, 0LL, v23);
    }

    else
    {
      v9[2](v9, 2LL, 0LL);
    }
  }

  else
  {
    v9[2](v9, 1LL, 0LL);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_opened)
  {
    if (v7)
    {
      unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000BE8F4();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector(WeakRetained, "tcpStream:errorOccured:");

      if ((v11 & 1) != 0)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        [v12 tcpStream:self errorOccured:v8];
      }

      -[APSTCPStream close](self, "close");
    }
  }

  else
  {
    streamTask = self->_streamTask;
    self->_streamTask = 0LL;

    urlSession = self->_urlSession;
    self->_urlSession = 0LL;

    if (v8)
    {
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000BE894();
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = v10;
  if (self->_opened)
  {
    if (v10)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000BE9B4();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector(WeakRetained, "tcpStream:errorOccured:");

      if ((v14 & 1) != 0)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 tcpStream:self errorOccured:v11];
      }

      -[APSTCPStream close](self, "close");
    }
  }

  else
  {
    streamTask = self->_streamTask;
    self->_streamTask = 0LL;

    urlSession = self->_urlSession;
    self->_urlSession = 0LL;

    if (v11)
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000BE954();
      }
    }
  }
}

- (void)_hasBytesAvailable
{
  vm_size_t v3 = 4 * vm_page_size;
  receiveData = self->_receiveData;
  if (!receiveData)
  {
    unsigned int v5 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", v3);
    id v6 = self->_receiveData;
    self->_receiveData = v5;

    receiveData = self->_receiveData;
  }

  id v7 = -[NSMutableData length](receiveData, "length");
  -[NSMutableData increaseLengthBy:](self->_receiveData, "increaseLengthBy:", v3);
  uint64_t v8 = -[NSInputStream read:maxLength:]( self->_readStream,  "read:maxLength:",  &v7[(void)-[NSMutableData mutableBytes](self->_receiveData, "mutableBytes")],  v3);
  id v9 = &v7[v8 & ~(v8 >> 63)];
  -[NSMutableData setLength:](self->_receiveData, "setLength:", v9);
  unsigned int v16 = self;
  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSInputStream propertyForKey:]( self->_readStream,  "propertyForKey:",  @"_kCFStreamPropertyWakeReadEvent")),  id v11 = [v10 BOOLValue],  v10,  WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate),  v13 = (char *)objc_msgSend( WeakRetained,  "tcpStream:dataReceived:isWakingMessage:",  v16,  self->_receiveData,  v11),  WeakRetained,  v13 != v9))
  {
    if (v13)
    {
      if (v13 >= v9) {
        id v15 = v9;
      }
      else {
        id v15 = v13;
      }
      -[NSMutableData replaceBytesInRange:withBytes:length:]( self->_receiveData,  "replaceBytesInRange:withBytes:length:",  0LL,  v15,  0LL,  0LL);
    }
  }

  else
  {
    char v14 = self->_receiveData;
    self->_receiveData = 0LL;
  }
}

- (void)_hasSpaceAvailable
{
  if (self->_writeStream && !self->_hasCompletedTLSHandshake) {
    -[APSTCPStream stream:handleEvent:](self, "stream:handleEvent:");
  }
  sendData = self->_sendData;
  if (sendData)
  {
    uint64_t v4 = -[NSOutputStream write:maxLength:]( self->_writeStream,  "write:maxLength:",  -[NSMutableData bytes](sendData, "bytes"),  -[NSMutableData length](self->_sendData, "length"));
    unint64_t v5 = v4 & ~(v4 >> 63);
    NSUInteger v6 = -[NSMutableData length](self->_sendData, "length");
    id v7 = self->_sendData;
    if (v6 <= v5)
    {
      self->_sendData = 0LL;
    }

    else
    {
      -[NSMutableData replaceBytesInRange:withBytes:length:]( v7,  "replaceBytesInRange:withBytes:length:",  0LL,  v5,  0LL,  0LL);
    }
  }

- (id)_getTCPInfoData
{
  readStream = self->_readStream;
  if (!readStream) {
    return 0LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSInputStream propertyForKey:](readStream, "propertyForKey:", _kCFStreamPropertyTCPInfo));
  if ([v4 count])
  {
    uint64_t v8 = 0LL;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000LL;
    id v11 = sub_100058A0C;
    id v12 = sub_100058A1C;
    id v13 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100058A24;
    v7[3] = &unk_10011F3C0;
    v7[4] = self;
    v7[5] = &v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)tcpInfoDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream _getTCPInfoData](self, "_getTCPInfoData"));
  if ([v2 length] == (id)408)
  {
    vm_size_t v3 = (unsigned __int8 *)[v2 bytes];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %u %x %u %u %x %u %u %u %u %u %u %u %u %u %u %u %u %d %u %llu %llu %llu %llu %llu %llu",  *v3,  v3[1],  v3[2],  v3[3],  *((unsigned int *)v3 + 1),  *((unsigned int *)v3 + 2),  *((unsigned int *)v3 + 3),  *((unsigned int *)v3 + 4),  *((unsigned int *)v3 + 5),  *((unsigned int *)v3 + 6),  *((unsigned int *)v3 + 7),  *((unsigned int *)v3 + 9),  *((unsigned int *)v3 + 10),  *((unsigned int *)v3 + 11),  *((unsigned int *)v3 + 12),  *((unsigned int *)v3 + 13),  *((unsigned int *)v3 + 14),  *((unsigned int *)v3 + 15),  *((unsigned int *)v3 + 16),  *(_OWORD *)(v3 + 76),  *(void *)(v3 + 92),  *(void *)(v3 + 108),  *(void *)(v3 + 116),  *(void *)(v3 + 132)));
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog stream](&OBJC_CLASS___APSLog, "stream"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000BEA14(v5);
    }

    uint64_t v4 = 0LL;
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
    vm_size_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream taskTransactionMetrics](self, "taskTransactionMetrics"));
    serverHostname = self->_serverHostname;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localAddress]);
    NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localPort]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteAddress]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 remotePort]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ([%@]:%@, [%@]:%@)",  serverHostname,  v5,  v6,  v7,  v8));
  }

  else
  {
    id v9 = 0LL;
  }

  return (NSString *)v9;
}

- (id)taskTransactionMetrics
{
  return -[NSURLSessionStreamTask _incompleteCurrentTaskTransactionMetrics]( self->_streamTask,  "_incompleteCurrentTaskTransactionMetrics");
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

- (void).cxx_destruct
{
}

@end