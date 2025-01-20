@interface SDBonjourResolver
- (NSNumber)portNumber;
- (NSString)domain;
- (NSString)hostName;
- (NSString)name;
- (NSString)path;
- (NSString)type;
- (NSURL)url;
- (SDBonjourResolver)initWithName:(id)a3 type:(id)a4 domain:(id)a5 path:(id)a6 timeout:(BOOL)a7;
- (SDBonjourResolverDelegate)delegate;
- (_DNSServiceRef_t)service;
- (int)error;
- (void)cancel;
- (void)dealloc;
- (void)notifyClient:(int)a3;
- (void)parseResults:(const char *)a3 port:(unsigned __int16)a4 txtLen:(unsigned __int16)a5 txtRecord:(const char *)a6 interface:(unsigned int)a7;
- (void)resolve;
- (void)setDelegate:(id)a3;
- (void)setHostName:(id)a3;
- (void)setPath:(id)a3;
- (void)setPortNumber:(id)a3;
@end

@implementation SDBonjourResolver

- (SDBonjourResolver)initWithName:(id)a3 type:(id)a4 domain:(id)a5 path:(id)a6 timeout:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SDBonjourResolver;
  v17 = -[SDBonjourResolver init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    v17->_connection = 0LL;
    objc_storeStrong((id *)&v17->_domain, a5);
    v18->_error = 0;
    hostName = v18->_hostName;
    v18->_hostName = 0LL;

    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v18->_path, a6);
    portNumber = v18->_portNumber;
    v18->_portNumber = 0LL;

    v18->_resolve = 0LL;
    v18->_timeout = a7;
    timer = v18->_timer;
    v18->_timer = 0LL;

    objc_storeStrong((id *)&v18->_type, a4);
    url = v18->_url;
    v18->_url = 0LL;
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDBonjourResolver;
  -[SDBonjourResolver dealloc](&v3, "dealloc");
}

- (void)notifyClient:(int)a3
{
  self->_error = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bonjourResolverDidChange:self];
}

- (void)parseResults:(const char *)a3 port:(unsigned __int16)a4 txtLen:(unsigned __int16)a5 txtRecord:(const char *)a6 interface:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v10 = a4;
  v12 = CFStringCreateWithCString(0LL, a3, 0x8000100u);
  if (v12)
  {
    id v13 = v12;
    id v14 = sub_100116B8C(v12);
    hostName = self->_hostName;
    self->_hostName = &v14->isa;

    CFRelease(v13);
  }

  id v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v10));
  portNumber = self->_portNumber;
  self->_portNumber = v16;

  if (!self->_path)
  {
    LOBYTE(v51) = 0;
    ValuePtr = TXTRecordGetValuePtr(a5, a6, "path", (uint8_t *)&v51);
    if (ValuePtr)
    {
      v19 = ValuePtr;
      v20 = objc_alloc(&OBJC_CLASS___NSString);
      v21 = -[NSString initWithBytes:length:encoding:]( v20,  "initWithBytes:length:encoding:",  v19,  v51,  4LL);
      path = self->_path;
      self->_path = v21;
    }
  }

  v23 = sub_10008EAC8(self->_type);
  if (v23)
  {
    v25 = v23;
    int v26 = CFEqual(v23, kSFNodeProtocolAirDrop);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    v28 = (os_log_s *)v27;
    if (!v26
      || (uint64_t v27 = (uint64_t)[(id)v27 browseAllInterfaces], (v27 & 1) != 0)
      || (uint64_t v27 = sub_100116A94(), (_DWORD)v27 == (_DWORD)v7))
    {
      uint64_t v29 = airdrop_log(v27);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        id v32 = sub_10011450C(v7);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = v33;
        if (!v33) {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
        }
        int v51 = 138412546;
        v52 = name;
        __int16 v53 = 2112;
        v54 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Bonjour resolved %@ over %@",  (uint8_t *)&v51,  0x16u);
        if (!v33) {
      }
        }

      v35 = (NSURL *)sub_10008D8A8( v25,  0LL,  0LL,  (__CFString *)self->_hostName,  -[NSNumber intValue](self->_portNumber, "intValue"),  (const __CFString *)self->_path,  0LL,  0);
      url = self->_url;
      self->_url = v35;

      -[SDBonjourResolver notifyClient:](self, "notifyClient:", 0LL);
    }

    else
    {
      uint64_t v45 = airdrop_log(v27);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_name;
        id v48 = sub_10011450C(v7);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v50 = v49;
        if (!v49) {
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
        }
        int v51 = 138412546;
        v52 = v47;
        __int16 v53 = 2112;
        v54 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Ignoring Bonjour resolve of %@ over %@",  (uint8_t *)&v51,  0x16u);
        if (!v49) {
      }
        }
    }
  }

  else
  {
    uint64_t v37 = browser_log(0LL, v24);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1001780C0(v28, v38, v39, v40, v41, v42, v43, v44);
    }
  }
}

- (void)resolve
{
  p_connection = &self->_connection;
  if (self->_connection) {
    return;
  }
  uint64_t Connection = DNSServiceCreateConnection(&self->_connection);
  if (!(_DWORD)Connection)
  {
    self->_resolve = self->_connection;
    id v15 = -[NSString UTF8String](self->_name, "UTF8String");
    id v16 = -[NSString UTF8String](self->_type, "UTF8String");
    v17 = -[NSString UTF8String](self->_domain, "UTF8String");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    if (-[NSString isEqual:](self->_type, "isEqual:", sub_10008E590()))
    {
      uint64_t v19 = (uint64_t)[v18 enableDemoMode];
      v65 = v15;
      if ((v19 & 1) != 0)
      {
        uint64_t v20 = 0LL;
        DNSServiceFlags v21 = 0x4000;
      }

      else
      {
        DNSServiceFlags v21 = 1064960;
        uint64_t v19 = sub_100116A94();
        if ((_DWORD)v19)
        {
          uint64_t v20 = v19;
        }

        else
        {
          uint64_t v22 = airdrop_log(v19);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1001781B8(v23, v24, v25, v26, v27, v28, v29, v30);
          }

          uint64_t v20 = 0LL;
        }
      }

      uint64_t v31 = airdrop_log(v19);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        id v33 = sub_10011450C(v20);
        uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)v34;
        v64 = v18;
        if (v34)
        {
          int v62 = 0;
          v36 = (__CFString *)v34;
        }

        else if ((_DWORD)v20)
        {
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
          int v62 = 1;
        }

        else
        {
          int v62 = 0;
          v36 = @"all interfaces";
        }

        *(_DWORD *)buf = 138412546;
        v68 = name;
        __int16 v69 = 2112;
        v70 = v36;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Bonjour resolving %@ over %@", buf, 0x16u);
        if (v62) {

        }
        v18 = v64;
      }

      id v15 = v65;
    }

    else
    {
      LODWORD(v20) = 0;
      DNSServiceFlags v21 = 0x4000;
    }

    uint64_t v37 = DNSServiceResolve(&self->_resolve, v21, v20, v15, v16, v17, (DNSServiceResolveReply)sub_100177F04, self);
    if ((_DWORD)v37)
    {
      uint64_t v39 = v37;
      uint64_t v40 = browser_log(v37, v38);
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100178154(v39, v41, v42, v43, v44, v45, v46, v47);
      }
    }

    else
    {
      uint64_t v48 = DNSServiceSetDispatchQueue(*p_connection, &_dispatch_main_q);
      if (!(_DWORD)v48)
      {
        if (self->_timeout)
        {
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472LL;
          v66[2] = sub_100177F34;
          v66[3] = &unk_1005CB2F8;
          v66[4] = self;
          v57 = sub_100114598(0, &_dispatch_main_q, v66);
          v58 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v57);
          timer = self->_timer;
          self->_timer = v58;

          v60 = self->_timer;
          dispatch_time_t v61 = sub_100114580(15.0);
          sub_100114638((dispatch_source_s *)v60, v61);
          dispatch_resume((dispatch_object_t)self->_timer);
        }

        goto LABEL_32;
      }

      uint64_t v39 = v48;
      uint64_t v50 = browser_log(v48, v49);
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1001780F0(v39, v41, v51, v52, v53, v54, v55, v56);
      }
    }

    -[SDBonjourResolver notifyClient:](self, "notifyClient:", v39);
LABEL_32:

    return;
  }

  uint64_t v6 = Connection;
  uint64_t v7 = browser_log(Connection, v5);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1001781E8(v6, v8, v9, v10, v11, v12, v13, v14);
  }

  -[SDBonjourResolver notifyClient:](self, "notifyClient:", v6);
}

- (void)cancel
{
  resolve = self->_resolve;
  if (resolve)
  {
    DNSServiceRefDeallocate(resolve);
    self->_resolve = 0LL;
  }

  connection = self->_connection;
  if (connection)
  {
    DNSServiceRefDeallocate(connection);
    self->_connection = 0LL;
  }

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    uint64_t v6 = self->_timer;
    self->_timer = 0LL;
  }

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)hostName
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setHostName:(id)a3
{
}

- (NSNumber)portNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setPortNumber:(id)a3
{
}

- (_DNSServiceRef_t)service
{
  return self->_service;
}

- (int)error
{
  return self->_error;
}

- (SDBonjourResolverDelegate)delegate
{
  return (SDBonjourResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end