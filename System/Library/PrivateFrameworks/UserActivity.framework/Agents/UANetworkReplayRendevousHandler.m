@interface UANetworkReplayRendevousHandler
- (BOOL)listenForIncomingConnections:(id)a3 port:(int)a4 type:(id)a5;
- (BOOL)resume;
- (BOOL)scanForPeersOfType:(id)a3 domain:(id)a4;
- (BOOL)suspend;
- (NSNetService)listeningService;
- (NSNetServiceBrowser)browserLookup;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (UANetworkReplayRendevousHandler)initWithManager:(id)a3;
- (id)statusString;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)netServiceWillPublish:(id)a3;
- (void)netServiceWillResolve:(id)a3;
- (void)setBrowserLookup:(id)a3;
- (void)setDomain:(id)a3;
- (void)setListeningService:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation UANetworkReplayRendevousHandler

- (UANetworkReplayRendevousHandler)initWithManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UANetworkReplayRendevousHandler;
  return -[UACornerActionManagerHandler initWithManager:name:]( &v4,  "initWithManager:name:",  a3,  @"ReplayRendevousHandler");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
    [v4 stop];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v5 removeFromRunLoop:v6 forMode:NSRunLoopCommonModes];
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UANetworkReplayRendevousHandler;
  -[UANetworkReplayRendevousHandler dealloc](&v7, "dealloc");
}

- (BOOL)scanForPeersOfType:(id)a3 domain:(id)a4
{
  if (a3) {
    v5 = (const __CFString *)a3;
  }
  else {
    v5 = @"_handoff._tcp.";
  }
  v6 = (__CFString *)a4;
  -[UANetworkReplayRendevousHandler setType:](self, "setType:", v5);
  if (v6) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = @"local";
  }
  -[UANetworkReplayRendevousHandler setDomain:](self, "setDomain:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
  if (!v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSNetServiceBrowser);
    -[UANetworkReplayRendevousHandler setBrowserLookup:](self, "setBrowserLookup:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
    [v10 setDelegate:self];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v11 scheduleInRunLoop:v12 forMode:NSRunLoopCommonModes];
  }

  if (!-[UACornerActionManagerHandler suspended](self, "suspended"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler type](self, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler domain](self, "domain"));
    [v13 searchForServicesOfType:v14 inDomain:v15];
  }

  return 1;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UANetworkReplayRendevousHandler;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v7, "suspend");
  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
      [v5 stop];
    }
  }

  return v3;
}

- (BOOL)resume
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UANetworkReplayRendevousHandler;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v12, "resume");
  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));

    if (v4)
    {
      os_log_t v5 = sub_100039584(0LL);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler type](self, "type"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler domain](self, "domain"));
        *(_DWORD *)buf = 138543618;
        v14 = v7;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "NETWORK:Starting browse for rendezous items for %{public}@ %{public}@.",  buf,  0x16u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler type](self, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler domain](self, "domain"));
      -[UANetworkReplayRendevousHandler scanForPeersOfType:domain:](self, "scanForPeersOfType:domain:", v9, v10);
    }
  }

  return v3;
}

- (id)statusString
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
    os_log_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"listening, port=%ld",  [v2 port]));
  }

  else
  {
    os_log_t v5 = &stru_1000BE738;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler browserLookup](self, "browserLookup"));
  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler type](self, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler domain](self, "domain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"browsing for %@ in %@",  v7,  v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Network, %@  %@",  v5,  v9));
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Network, %@  %@",  v5,  &stru_1000BE738));
  }

  if (v4)
  {
  }

  return v10;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_autoreleasePoolPush();
  os_log_t v11 = sub_100039584(0LL);
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 name]);
    v14 = (void *)v13;
    __int16 v15 = @"NO";
    int v25 = 138413058;
    id v26 = v8;
    __int16 v27 = 2112;
    if (v5) {
      __int16 v15 = @"YES";
    }
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "NETWORK: browser=%@ service=%@/%@ more=%@",  (uint8_t *)&v25,  0x2Au);
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler name](self, "name"));
  if (!v16
    || (v17 = (void *)v16,
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler name](self, "name")),
        v19 = (void *)objc_claimAutoreleasedReturnValue([v9 name]),
        unsigned __int8 v20 = [v18 isEqual:v19],
        v19,
        v18,
        v17,
        (v20 & 1) == 0))
  {
    v21 = objc_alloc(&OBJC_CLASS___UANetworkReplayController);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    v23 = -[UANetworkReplayController initWithManager:service:](v21, "initWithManager:service:", v22, v9);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    [v24 addHandler:v23];
  }

  objc_autoreleasePoolPop(v10);
}

- (BOOL)listenForIncomingConnections:(id)a3 port:(int)a4 type:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (__CFString *)a5;
  v10 = objc_autoreleasePoolPush();
  os_log_t v11 = sub_100039584(0LL);
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    name = self->name;
    *(_DWORD *)buf = 138543874;
    v33 = name;
    __int16 v34 = 2114;
    v35 = v9;
    __int16 v36 = 2048;
    uint64_t v37 = (int)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "NETWORK: name=%{public}@ type=%{public}@ port=%ld",  buf,  0x20u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
  if (v14)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
    [v15 stop];

    -[UANetworkReplayRendevousHandler setListeningService:](self, "setListeningService:", 0LL);
  }

  if (v8)
  {
    -[UANetworkReplayRendevousHandler setName:](self, "setName:", v8);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Handoff:%@", v17));
    -[UANetworkReplayRendevousHandler setName:](self, "setName:", v18);
  }

  os_log_t v19 = sub_100039584(0LL);
  unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler name](self, "name"));
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    __int16 v34 = 2114;
    v35 = v9;
    __int16 v36 = 2048;
    uint64_t v37 = (int)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "NETWORK: Setting up mDNS listener for connections, name=%{public}@ type=%{public}@ port=%ld",  buf,  0x20u);
  }

  v22 = objc_alloc(&OBJC_CLASS___NSNetService);
  if (v9) {
    v23 = v9;
  }
  else {
    v23 = @"_handoff._tcp.";
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler name](self, "name"));
  if (v24) {
    int v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler name](self, "name"));
  }
  else {
    int v25 = &stru_1000BE738;
  }
  id v26 = -[NSNetService initWithDomain:type:name:port:]( v22,  "initWithDomain:type:name:port:",  @"local",  v23,  v25,  v6);
  -[UANetworkReplayRendevousHandler setListeningService:](self, "setListeningService:", v26);

  if (v24) {
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
  }
  [v27 setDelegate:self];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v28 scheduleInRunLoop:v29 forMode:NSRunLoopCommonModes];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayRendevousHandler listeningService](self, "listeningService"));
  [v30 publishWithOptions:3];

  objc_autoreleasePoolPop(v10);
  return 1;
}

- (void)netServiceWillPublish:(id)a3
{
  id v3 = a3;
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)netServiceDidPublish:(id)a3
{
  id v3 = a3;
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = objc_autoreleasePoolPush();
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"NSNetServicesErrorDomain"]);
  if (v8 == NSNetServicesErrorCode)
  {
    os_log_t v9 = sub_100039584(0LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"NSNetServicesErrorCode"]);
      id v12 = [v11 integerValue];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      id v14 = sub_10005BF18(v13);
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v16 = 134218242;
      id v17 = v12;
      __int16 v18 = 2114;
      os_log_t v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "NETWORK: NSNetServicesErrorCode=%ld / %{public}@",  (uint8_t *)&v16,  0x16u);
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)netServiceWillResolve:(id)a3
{
  id v3 = a3;
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v3 = a3;
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)netServiceDidStop:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100039584(0LL);
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138477827;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "NETWORK: netServicesDidStop, so terminating this listener, sender=%{private}@.",  (uint8_t *)&v8,  0xCu);
  }

  -[UACornerActionManagerHandler terminate](self, "terminate");
  objc_autoreleasePoolPop(v5);
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_autoreleasePoolPush();
  os_log_t v11 = objc_alloc(&OBJC_CLASS___UANetworkReplayController);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  id v14 = -[UANetworkReplayController initWithManager:inputStream:outputStream:name:]( v11,  "initWithManager:inputStream:outputStream:name:",  v12,  v8,  v9,  v13);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v15 addHandler:v14];

  objc_autoreleasePoolPop(v10);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSNetServiceBrowser)browserLookup
{
  return (NSNetServiceBrowser *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBrowserLookup:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDomain:(id)a3
{
}

- (NSNetService)listeningService
{
  return (NSNetService *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setListeningService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end