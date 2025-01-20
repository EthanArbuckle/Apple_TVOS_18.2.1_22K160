@interface MMTConnection
- (BOOL)sendMessage:(id)a3;
- (DMCPowerAssertion)powerAssertion;
- (MDMAbstractTunnelParser)parser;
- (MMTConnection)initWithLockdownConnection:(_lockdown_connection *)a3;
- (OS_dispatch_queue)workQueue;
- (_lockdown_connection)lockdownConnection;
- (id)parseErrorFromResponse:(id)a3;
- (id)receiveMessage;
- (void)executeNextCommand;
- (void)setLockdownConnection:(_lockdown_connection *)a3;
- (void)setParser:(id)a3;
- (void)start;
@end

@implementation MMTConnection

- (MMTConnection)initWithLockdownConnection:(_lockdown_connection *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MMTConnection;
  v4 = -[MMTConnection init](&v20, "init");
  if (v4)
  {
    v5 = -[DMCPowerAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___DMCPowerAssertion),  "initWithReason:",  @"mc_mobile_tunnel-MMTConnection");
    powerAssertion = v4->_powerAssertion;
    v4->_powerAssertion = v5;

    v4->_lockdownConnection = a3;
    dispatch_queue_t v7 = dispatch_queue_create("Work Queue", 0LL);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v7;

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"ForceTunnelIsSupervised",  @"com.apple.managedconfiguration",  &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue)
    {
      v10 = objc_opt_new(&OBJC_CLASS___MTChaperoneParser);
      parser = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v10;
    }

    else
    {
      v12 = objc_opt_new(&OBJC_CLASS___MTIPCUTunnelParser);
      v13 = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v12;

      objc_initWeak(&location, v4);
      v14 = v4->_parser;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100005480;
      v16[3] = &unk_100010758;
      objc_copyWeak(&v17, &location);
      -[MDMAbstractTunnelParser setEscalationBlock:](v14, "setEscalationBlock:", v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v4;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MMTConnection workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005554;
  block[3] = &unk_100010780;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)receiveMessage
{
  v3 = *(void **)DMCLogObjects(self);
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    *(void *)v39 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Receiving on lockdown connection: %p",  buf,  0xCu);
  }

  uint64_t v5 = lockdown_recv(-[MMTConnection lockdownConnection](self, "lockdownConnection"), &v37, 4LL);
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  if (v5 != 4)
  {
    v12 = *(void **)DMCLogObjects(v5);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)buf = 134218242;
      *(void *)v39 = v6;
      *(_WORD *)&v39[8] = 2082;
      v40 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Could not receive size of message: %ld %{public}s",  buf,  0x16u);
    }

    goto LABEL_14;
  }

  if (v37)
  {
    unint64_t v7 = bswap32(v37);
    if (v7 >= 0x1400001)
    {
      v8 = *(os_log_s **)DMCLogObjects(4LL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v39 = v7;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = 20971520;
        v9 = "Message size %d exceeds limit of %d bytes";
        v10 = v8;
        uint32_t v11 = 14;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
        goto LABEL_14;
      }

      goto LABEL_14;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v7));
    objc_super v20 = v19;
    if (v19)
    {
      id v21 = v19;
      v22 = (char *)[v21 mutableBytes];
      unint64_t v23 = 0LL;
      while (1)
      {
        uint64_t v24 = lockdown_recv(-[MMTConnection lockdownConnection](self, "lockdownConnection"), v22, (int)v7 - (int)v23);
        if (v24 == -1) {
          break;
        }
        v23 += v24;
        v22 += v24;
        if (v23 >= v7) {
          goto LABEL_25;
        }
      }

      v28 = *(os_log_s **)DMCLogObjects(-1LL);
      uint64_t v24 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot receive message.", buf, 2u);
      }

- (BOOL)sendMessage:(id)a3
{
  v4 = (_lockdown_connection *)a3;
  uint64_t v5 = *(os_log_s **)DMCLogObjects(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    unint64_t v7 = v5;
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sending response on lockdown connection: %p",  buf,  0xCu);
  }

  v8 = *(os_log_s **)DMCLogObjects(v6);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    v10 = v8;
    uint32_t v11 = (_lockdown_connection *)objc_claimAutoreleasedReturnValue( -[_lockdown_connection objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"Status"));
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending reply status: %{public}@", buf, 0xCu);
  }

  v12 = *(os_log_s **)DMCLogObjects(v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending message: %{private}@", buf, 0xCu);
  }

  if (v4)
  {
    id v31 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  &v31));
    v14 = (_lockdown_connection *)v31;
    v15 = v14;
    if (!v13)
    {
      objc_super v20 = *(os_log_s **)DMCLogObjects(v14);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Cannot convert reply dictionary into PList: %{public}@",  buf,  0xCu);
      }

      goto LABEL_20;
    }

    unsigned int v16 = [v13 length];
    unsigned int v30 = bswap32(v16);
    uint64_t v17 = lockdown_send(-[MMTConnection lockdownConnection](self, "lockdownConnection"), &v30, 4LL);
    if (v17 == 4)
    {
      uint64_t v18 = lockdown_send( -[MMTConnection lockdownConnection](self, "lockdownConnection"), [v13 bytes], v16);
      if (v18 == v16)
      {
        BOOL v19 = 1;
LABEL_21:

        goto LABEL_22;
      }

      v26 = *(void **)DMCLogObjects(v18);
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        v22 = v26;
        v27 = __error();
        v28 = strerror(*v27);
        *(_DWORD *)buf = 136446210;
        uint64_t v33 = (_lockdown_connection *)v28;
        v25 = "Could not send message: %{public}s";
        goto LABEL_19;
      }
    }

    else
    {
      id v21 = *(void **)DMCLogObjects(v17);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        unint64_t v23 = __error();
        uint64_t v24 = strerror(*v23);
        *(_DWORD *)buf = 136446210;
        uint64_t v33 = (_lockdown_connection *)v24;
        v25 = "Could not send message size: %{public}s";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
      }
    }

- (id)parseErrorFromResponse:(id)a3
{
  id v3 = [a3 mutableCopy];
  uint64_t v4 = kMCTPErrorObjectKey;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCTPErrorObjectKey]);
  if (v5)
  {
    [v3 setObject:0 forKeyedSubscript:v4];
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    id v21 = -[NSArchiver initForWritingWithMutableData:]( objc_alloc(&OBJC_CLASS___NSArchiver),  "initForWritingWithMutableData:",  v6);
    -[NSArchiver encodeRootObject:](v21, "encodeRootObject:", v5);
    uint64_t v24 = v3;
    v22 = (void *)v6;
    [v3 setObject:v6 forKeyedSubscript:@"CommandErrorArchive"];
    unint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    unint64_t v23 = v5;
    id v8 = v5;
    uint64_t v9 = kMDMPErrorChainLocalizedDescriptionKey;
    uint64_t v10 = kMDMPErrorChainErrorDomainKey;
    uint64_t v11 = kMDMPErrorChainUSEnglishDescriptionKey;
    uint64_t v12 = kMDMPErrorChainErrorCodeKey;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
      [v13 setObject:v15 forKeyedSubscript:v9];

      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      [v13 setObject:v16 forKeyedSubscript:v10];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 DMCUSEnglishDescription]);
      [v13 setObject:v17 forKeyedSubscript:v11];

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 code]));
      [v13 setObject:v18 forKeyedSubscript:v12];

      -[NSMutableArray addObject:](v7, "addObject:", v13);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 objectForKey:NSUnderlyingErrorKey]);

      id v8 = (id)v19;
    }

    while (v19);
    id v3 = v24;
    [v24 setObject:v7 forKeyedSubscript:kMDMPErrorChainKey];

    uint64_t v5 = v23;
  }

  return v3;
}

- (void)executeNextCommand
{
  id v3 = *(void **)DMCLogObjects(self);
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Executing command from lockdown connection: %p",  buf,  0xCu);
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MMTConnection receiveMessage](self, "receiveMessage"));
  uint64_t v6 = (void *)v5;
  if ((byte_100014BA0 & 1) != 0) {
    goto LABEL_9;
  }
  uint64_t v5 = (uint64_t)+[DMCMobileGestalt isAppleTV](&OBJC_CLASS___DMCMobileGestalt, "isAppleTV");
  if ((v5 & 1) != 0 || (uint64_t v5 = DMIsMigrationNeeded(), !(_DWORD)v5))
  {
LABEL_8:
    byte_100014BA0 = 1;
LABEL_9:
    if (v6)
    {
      id v8 = *(void **)DMCLogObjects(v5);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = v8;
        uint64_t v10 = (_lockdown_connection *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestType"]);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received request: %{public}@", buf, 0xCu);
      }

      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MMTConnection parser](self, "parser"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MMTConnection powerAssertion](self, "powerAssertion"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10000623C;
      v14[3] = &unk_1000107A8;
      v14[4] = self;
      -[dispatch_queue_s processRequest:assertion:completionBlock:]( v11,  "processRequest:assertion:completionBlock:",  v6,  v12,  v14);
    }

    else
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MMTConnectionManager sharedInstance]( &OBJC_CLASS___MMTConnectionManager,  "sharedInstance"));
      -[dispatch_queue_s removeConnection:](v11, "removeConnection:", self);
    }

    goto LABEL_14;
  }

  uint64_t v7 = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)v7)
  {
    uint64_t v5 = DMPerformMigrationIfNeeded();
    goto LABEL_8;
  }

  v13 = *(os_log_s **)DMCLogObjects(v7);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Telling client to wait until preboard is finished.",  buf,  2u);
  }

  -[MMTConnection sendMessage:](self, "sendMessage:", &off_1000113B0);
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MMTConnection workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006234;
  block[3] = &unk_100010780;
  block[4] = self;
  dispatch_async(v11, block);
LABEL_14:
}

- (_lockdown_connection)lockdownConnection
{
  return self->_lockdownConnection;
}

- (void)setLockdownConnection:(_lockdown_connection *)a3
{
  self->_lockdownConnection = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (MDMAbstractTunnelParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (DMCPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void).cxx_destruct
{
}

@end