@interface NWTCPConnection
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)stringFromNWTCPConnectionState:(int64_t)a3;
- (BOOL)TFOSucceeded;
- (BOOL)fillOutTCPConnectionInfo:(tcp_connection_info *)a3;
- (BOOL)hasBetterPath;
- (BOOL)isMultipath;
- (BOOL)isViable;
- (BOOL)startInternal;
- (NSData)metadata;
- (NSData)txtRecord;
- (NSDictionary)TCPInfo;
- (NSDictionary)multipathSubflowSwitchCounts;
- (NSError)internalError;
- (NSString)privateDescription;
- (NWEndpoint)endpoint;
- (NWEndpoint)localAddress;
- (NWEndpoint)remoteAddress;
- (NWParameters)parameters;
- (NWPath)connectedPath;
- (NWTCPConnection)initWithAcceptedInternalConnection:(id)a3;
- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPConnection)initWithUpgradeForConnection:(NWTCPConnection *)connection;
- (NWTCPConnectionAuthenticationDelegate)delegate;
- (NWTCPConnectionState)state;
- (OS_nw_connection)internalConnection;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)multipathPrimarySubflowInterfaceIndex;
- (unint64_t)multipathConnectedSubflowCount;
- (unint64_t)multipathSubflowCount;
- (void)cancel;
- (void)dealloc;
- (void)handleIdentityRequestWithMetadata:(id)a3 completionHandler:(id)a4;
- (void)handlePeerCertificateTrustEvaluationWithMetadata:(id)a3 trust:(id)a4 completionHandler:(id)a5;
- (void)readLength:(NSUInteger)length completionHandler:(void *)completion;
- (void)readMinimumLength:(NSUInteger)minimum maximumLength:(NSUInteger)maximum completionHandler:(void *)completion;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHasBetterPath:(BOOL)a3;
- (void)setInternalConnection:(id)a3;
- (void)setInternalError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setViable:(BOOL)a3;
- (void)setupEventHandler;
- (void)write:(NSData *)data completionHandler:(void *)completion;
- (void)writeClose;
@end

@implementation NWTCPConnection

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"state"] & 1) != 0
    || ([v4 isEqualToString:@"hasBetterPath"] & 1) != 0
    || ([v4 isEqualToString:@"viable"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWTCPConnection;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)stringFromNWTCPConnectionState:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NWTCPConnection)initWithAcceptedInternalConnection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v22, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_181A5C000, v23, v24, "%{public}s called with null internalConnection", buf, 0xCu);
        }
      }

      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v30 = type;
        BOOL v31 = os_log_type_enabled(v23, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
            __int16 v42 = 2082;
            v43 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v23,  v30,  "%{public}s called with null internalConnection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }

        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl( &dword_181A5C000,  v23,  v30,  "%{public}s called with null internalConnection, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl( &dword_181A5C000,  v23,  v35,  "%{public}s called with null internalConnection, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id obj = a5;
  if (!v9)
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    os_log_type_t v33 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v58 = 0;
    if (__nwlog_fault(v33, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v34, v35, "%{public}s called with null endpoint", buf, 0xCu);
        }
      }

      else if (v58)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v45 = type;
        BOOL v46 = os_log_type_enabled(v34, type);
        if (backtrace_string)
        {
          if (v46)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            __int16 v62 = 2082;
            v63 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v34,  v45,  "%{public}s called with null endpoint, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_76;
        }

        if (v46)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v34, v45, "%{public}s called with null endpoint, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v53 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl( &dword_181A5C000,  v34,  v53,  "%{public}s called with null endpoint, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  return -[NWTCPConnection initWithEndpoint:parameters:delegate:]( self,  "initWithEndpoint:parameters:delegate:",  a3,  a4,  0LL);
}

- (NWTCPConnection)initWithUpgradeForConnection:(NWTCPConnection *)connection
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v4 = connection;
  id v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    os_log_type_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    BOOL v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type;
      if (!os_log_type_enabled(v35, type)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      objc_super v37 = "%{public}s called with null connection";
LABEL_78:
      _os_log_impl(&dword_181A5C000, v35, v36, v37, buf, 0xCu);
      goto LABEL_79;
    }

    if (!v53)
    {
      __nwlog_obj();
      os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        objc_super v37 = "%{public}s called with null connection, backtrace limit exceeded";
        goto LABEL_78;
      }

      goto LABEL_79;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v36 = type;
    BOOL v46 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v46)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        objc_super v37 = "%{public}s called with null connection, no backtrace";
        goto LABEL_78;
      }

      goto LABEL_79;
    }

    if (!v46) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v57 = 2082;
    char v58 = backtrace_string;
    v47 = "%{public}s called with null connection, dumping backtrace:%{public}s";
LABEL_59:
    _os_log_impl(&dword_181A5C000, v35, v36, v47, buf, 0x16u);
LABEL_60:

    free(backtrace_string);
    goto LABEL_80;
  }
  v6 = -[NWTCPConnection endpoint](v4, "endpoint");
  if (!v6)
  {
    __nwlog_obj();
    char v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    BOOL v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type;
      if (!os_log_type_enabled(v35, type)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      objc_super v37 = "%{public}s called with null connection.endpoint";
      goto LABEL_78;
    }

    if (!v53)
    {
      __nwlog_obj();
      os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        objc_super v37 = "%{public}s called with null connection.endpoint, backtrace limit exceeded";
        goto LABEL_78;
      }

      goto LABEL_79;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v36 = type;
    BOOL v48 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v48)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        objc_super v37 = "%{public}s called with null connection.endpoint, no backtrace";
        goto LABEL_78;
      }

      goto LABEL_79;
    }

    if (!v48) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v57 = 2082;
    char v58 = backtrace_string;
    v47 = "%{public}s called with null connection.endpoint, dumping backtrace:%{public}s";
    goto LABEL_59;
  }

  -[NWTCPConnection parameters](v5, "parameters");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[NWTCPConnection endpoint](v5, "endpoint");
    [v8 internalEndpoint];
    id v9 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
    -[NWTCPConnection parameters](v5, "parameters");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 internalParameters];
    uint64_t v11 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
    v12 = nw_connection_create(v9, v11);

    if (v12)
    {
      v52.receiver = self;
      v52.super_class = (Class)&OBJC_CLASS___NWTCPConnection;
      v13 = -[NWTCPConnection init](&v52, sel_init);
      if (v13)
      {
        nw_protocol_options_t v14 = v13;
        if (NWCopyInternalQueue_init_once != -1) {
          dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
        }
        BOOL v15 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
        nw_connection_set_queue(v12, v15);

        uint64_t v16 = -[NWTCPConnection endpoint](v5, "endpoint");
        endpoint = v14->_endpoint;
        v14->_endpoint = (NWEndpoint *)v16;

        uint64_t v18 = -[NWTCPConnection parameters](v5, "parameters");
        parameters = v14->_parameters;
        v14->_parameters = (NWParameters *)v18;
        v20 = -[NWTCPConnection delegate](v5, "delegate");
        objc_storeWeak((id *)&v14->_delegate, v20);

        objc_storeStrong((id *)&v14->_internalConnection, v12);
        v14->_state = 1LL;
        -[NWTCPConnection startInternal](v14, "startInternal");
        self = v14;
        v21 = self;
        goto LABEL_27;
      }

      __nwlog_obj();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v41 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v53 = 0;
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          uint64_t v44 = "%{public}s [super init] failed";
LABEL_87:
          _os_log_impl(&dword_181A5C000, v42, v43, v44, buf, 0xCu);
        }
      }

      else if (v53)
      {
        v50 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v43 = type;
        BOOL v51 = os_log_type_enabled(v42, type);
        if (v50)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
            __int16 v57 = 2082;
            char v58 = v50;
            _os_log_impl( &dword_181A5C000,  v42,  v43,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v50);
          goto LABEL_89;
        }

        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          uint64_t v44 = "%{public}s [super init] failed, no backtrace";
          goto LABEL_87;
        }
      }

      else
      {
        __nwlog_obj();
        __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          uint64_t v44 = "%{public}s [super init] failed, backtrace limit exceeded";
          goto LABEL_87;
        }
      }

LABEL_89:
      if (v41) {
        free(v41);
      }
      self = 0LL;
      goto LABEL_26;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v22 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    id v23 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault((const char *)v23, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v24 = (os_log_s *)(id)gLogObj;
        os_log_type_t v25 = type;
        if (!os_log_type_enabled(v24, type)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        os_log_type_t v26 = "%{public}s nw_connection_create failed";
LABEL_22:
        os_log_type_t v30 = v24;
        os_log_type_t v31 = v25;
        goto LABEL_23;
      }

      if (!v53)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v24 = (os_log_s *)(id)gLogObj;
        os_log_type_t v25 = type;
        if (!os_log_type_enabled(v24, type)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        os_log_type_t v26 = "%{public}s nw_connection_create failed, backtrace limit exceeded";
        goto LABEL_22;
      }

      v27 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v24 = (os_log_s *)(id)gLogObj;
      os_log_type_t v28 = type;
      BOOL v29 = os_log_type_enabled(v24, type);
      if (!v27)
      {
        if (!v29)
        {
LABEL_24:

          if (!v23)
          {
LABEL_26:
            v21 = 0LL;
LABEL_27:

            goto LABEL_28;
          }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    id v4 = (nw_connection *)objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v4);

    -[NWTCPConnection setInternalConnection:](self, "setInternalConnection:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWTCPConnection;
  -[NWTCPConnection dealloc](&v5, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  [v7 appendString:@"{"];
  v8 = -[NWTCPConnection parameters](self, "parameters");
  [v7 appendPrettyObject:v8 withName:@"parameters" indent:v5 showFullContent:v4];

  -[NWTCPConnection endpoint](self, "endpoint");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"endpoint" indent:v5 showFullContent:v4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (id)description
{
  return  -[NWTCPConnection descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWTCPConnection descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (NWPath)connectedPath
{
  v3 = (NWPath *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = nw_connection_copy_connected_path(v4);

    if (v5) {
      v3 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v5);
    }
    else {
      v3 = 0LL;
    }
  }

  return v3;
}

- (NWEndpoint)localAddress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = nw_connection_copy_connected_local_endpoint(v4);

    if (v5)
    {
      v3 = +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v5);
    }

    else
    {
      v3 = 0LL;
    }
  }

  return (NWEndpoint *)v3;
}

- (NWEndpoint)remoteAddress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = nw_connection_copy_connected_remote_endpoint(v4);

    if (v5)
    {
      v3 = +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v5);
    }

    else
    {
      v3 = 0LL;
    }
  }

  return (NWEndpoint *)v3;
}

- (NSData)txtRecord
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = nw_connection_copy_host_endpoint(v4);

    if (v5)
    {
      v6 = (id *)v5;
      id v7 = v6[23];

      if (!v7 || ((v8 = v7[1], v9 = v7[2], v8) ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), v10)) {
        uint64_t v11 = 0LL;
      }
      else {
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v8 length:v9];
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return (NSData *)v11;
}

- (void)cancel
{
  if (-[NWTCPConnection state](self, "state") != NWTCPConnectionStateCancelled)
  {
    v3 = -[NWTCPConnection internalConnection](self, "internalConnection");
    if (v3)
    {
      -[NWTCPConnection internalConnection](self, "internalConnection");
      BOOL v4 = (nw_connection *)objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v4);
    }
  }

- (void)readLength:(NSUInteger)length completionHandler:(void *)completion
{
}

- (void)readMinimumLength:(NSUInteger)minimum maximumLength:(NSUInteger)maximum completionHandler:(void *)completion
{
  unsigned int v5 = maximum;
  unsigned int v6 = minimum;
  uint64_t v8 = completion;
  -[NWTCPConnection internalConnection](self, "internalConnection");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke;
    v16[3] = &unk_189BC56E8;
    uint64_t v11 = &v17;
    v17 = v8;
    id v12 = v8;
    nw_connection_receive_internal(v10, 0LL, v6, v5, v16);
  }

  else
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
    }
    BOOL v10 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2;
    v14[3] = &unk_189BC8740;
    uint64_t v11 = &v15;
    BOOL v15 = v8;
    id v13 = v8;
    dispatch_async(v10, v14);
  }
}

- (void)write:(NSData *)data completionHandler:(void *)completion
{
  unsigned int v6 = data;
  id v7 = completion;
  -[NWTCPConnection internalConnection](self, "internalConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6) {
      uint64_t v9 = (dispatch_data_s *)-[NSData _createDispatchData](v6, "_createDispatchData");
    }
    else {
      uint64_t v9 = 0LL;
    }
    -[NWTCPConnection internalConnection](self, "internalConnection");
    id v12 = (nw_connection *)objc_claimAutoreleasedReturnValue();
    completiona[0] = MEMORY[0x1895F87A8];
    completiona[1] = 3221225472LL;
    completiona[2] = __43__NWTCPConnection_write_completionHandler___block_invoke;
    completiona[3] = &unk_189BC5710;
    id v16 = v7;
    id v11 = v7;
    nw_connection_send(v12, v9, (nw_content_context_t)&__block_literal_global_41831, 1, completiona);
  }

  else
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
    }
    BOOL v10 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __43__NWTCPConnection_write_completionHandler___block_invoke_2;
    v13[3] = &unk_189BC8740;
    nw_protocol_options_t v14 = v7;
    uint64_t v9 = v7;
    dispatch_async(v10, v13);

    id v11 = v14;
  }
}

- (void)writeClose
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    BOOL v4 = (nw_connection *)objc_claimAutoreleasedReturnValue();
    nw_connection_send(v4, 0LL, (nw_content_context_t)&__block_literal_global_3_41839, 1, &__block_literal_global_24170);
  }

- (void)handlePeerCertificateTrustEvaluationWithMetadata:(id)a3 trust:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (sec_protocol_metadata *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    objc_initWeak(&location, self);
    -[NWTCPConnection delegate](self, "delegate");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v13 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke;
    handler[3] = &unk_189BB60A8;
    id v14 = v12;
    id v30 = v14;
    sec_protocol_metadata_access_peer_certificate_chain(v8, handler);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v15 = (os_log_s *)(id)gLogObj;
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v14 count];
        *(_DWORD *)buf = 136446466;
        BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s Evaluating trust for peer cert chain of length %lu",  buf,  0x16u);
      }

      v26[0] = v13;
      v26[1] = 3221225472LL;
      v26[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_28;
      v26[3] = &unk_189BB60D0;
      objc_copyWeak(&v28, &location);
      id v27 = v10;
      [v11 evaluateTrustForConnection:self peerCertificateChain:v14 completionHandler:v26];

      objc_destroyWeak(&v28);
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        __int16 v35 = 2048;
        uint64_t v36 = 0LL;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s Can't create certificate chain %p for trust evaluation",  buf,  0x16u);
      }
    }

    objc_destroyWeak(&location);
    goto LABEL_10;
  }

  __nwlog_obj();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
  v19 = (char *)_os_log_send_and_compose_impl();

  LOBYTE(location) = 16;
  char v32 = 0;
  if (__nwlog_fault(v19, &location, &v32))
  {
    if (location == 17)
    {
      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = location;
      if (os_log_type_enabled(v20, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_181A5C000, v20, v21, "%{public}s called with null metadata", buf, 0xCu);
      }
    }

    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = location;
      BOOL v24 = os_log_type_enabled(v20, (os_log_type_t)location);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
          __int16 v35 = 2082;
          uint64_t v36 = (uint64_t)backtrace_string;
          _os_log_impl( &dword_181A5C000,  v20,  v23,  "%{public}s called with null metadata, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_27;
      }

      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_181A5C000, v20, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v25 = location;
      if (os_log_type_enabled(v20, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl( &dword_181A5C000,  v20,  v25,  "%{public}s called with null metadata, backtrace limit exceeded",  buf,  0xCu);
      }
    }
  }

- (void)handleIdentityRequestWithMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[NWTCPConnection delegate](self, "delegate");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    BOOL v15 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]";
    _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s Peer asked for identity, asking delegate to provide identity",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke;
  v11[3] = &unk_189BB60F8;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [v8 provideIdentityForConnection:self completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)setupEventHandler
{
  v3 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __36__NWTCPConnection_setupEventHandler__block_invoke;
  handler[3] = &unk_189BC8C38;
  objc_copyWeak(&v12, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  -[NWTCPConnection internalConnection](self, "internalConnection");
  unsigned int v5 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_32;
  v9[3] = &unk_189BB7F78;
  objc_copyWeak(&v10, &location);
  nw_connection_set_viability_changed_handler(v5, v9);

  -[NWTCPConnection internalConnection](self, "internalConnection");
  id v6 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472LL;
  v7[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_34;
  v7[3] = &unk_189BB7F78;
  objc_copyWeak(&v8, &location);
  nw_connection_set_better_path_available_handler(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)startInternal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 enableTLS];

  if (v4)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    unsigned int v5 = (nw_connection *)objc_claimAutoreleasedReturnValue();
    nw_parameters_t v6 = nw_connection_copy_parameters(v5);

    id v7 = (void *)nw_protocol_boringssl_copy_definition();
    id v8 = nw_parameters_copy_protocol_options_for_definition(v6, v7);

    id v9 = v8;
    -[NWTCPConnection delegate](self, "delegate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || [v10 shouldEvaluateTrustForConnection:self]))
    {
      verify_block[0] = MEMORY[0x1895F87A8];
      verify_block[1] = 3221225472LL;
      verify_block[2] = __32__NWTCPConnection_startInternal__block_invoke;
      verify_block[3] = &unk_189BB6120;
      objc_copyWeak(&v18, &location);
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
      }
      id v11 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_verify_block(v9, verify_block, v11);

      objc_destroyWeak(&v18);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || [v10 shouldProvideIdentityForConnection:self]))
    {
      challenge_block[0] = MEMORY[0x1895F87A8];
      challenge_block[1] = 3221225472LL;
      challenge_block[2] = __32__NWTCPConnection_startInternal__block_invoke_44;
      challenge_block[3] = &unk_189BB6148;
      objc_copyWeak(&v16, &location);
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
      }
      id v12 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_challenge_block(v9, challenge_block, v12);

      objc_destroyWeak(&v16);
    }
  }

  -[NWTCPConnection internalConnection](self, "internalConnection");
  id v13 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_connection_start(v13);

  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)fillOutTCPConnectionInfo:(tcp_connection_info *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v3 = a3;
    -[NWTCPConnection internalConnection](self, "internalConnection");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = nw_connection_fillout_tcp_connection_info(v4, (uint64_t)v3);

    return (char)v3;
  }

  __nwlog_obj();
  nw_parameters_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  id v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
  id v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        id v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        id v10 = "%{public}s called with null tcp_conn_info";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v8, v9, v10, buf, 0xCu);
      }
    }

    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            id v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
            __int16 v17 = 2082;
            id v18 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s called with null tcp_conn_info, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        id v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        id v10 = "%{public}s called with null tcp_conn_info, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        id v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        id v10 = "%{public}s called with null tcp_conn_info, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (BOOL)TFOSucceeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = nw_connection_used_tfo(v2);

  return v3;
}

- (BOOL)isMultipath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = nw_connection_uses_multipath(v2);

  return v3;
}

- (unint64_t)multipathSubflowCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (unint64_t)multipathConnectedSubflowCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (int)multipathPrimarySubflowInterfaceIndex
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = -[NWTCPConnection internalConnection](self, "internalConnection");
  id v3 = nw_connection_copy_connected_path(v2);

  if (v3)
  {
    int v4 = (NWConcrete_nw_path *)v3;
    if (nw_path_network_is_satisfied_update_reason(v4, 0LL)) {
      int routed_interface_index = v4->policy_result.routed_interface_index;
    }
    else {
      int routed_interface_index = 0;
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    nw_parameters_t v6 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446210;
      os_log_type_t v9 = "-[NWTCPConnection multipathPrimarySubflowInterfaceIndex]";
      _os_log_impl(&dword_181A5C000, v6, OS_LOG_TYPE_ERROR, "%{public}s No connected path", (uint8_t *)&v8, 0xCu);
    }

    int routed_interface_index = 0;
  }

  return routed_interface_index;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_connection_multipath_copy_subflow_counts(v2);

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke;
    applier[3] = &unk_189BC5148;
    id v5 = v4;
    id v8 = v5;
    xpc_dictionary_apply(v3, applier);
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (NSDictionary)TCPInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_connection_copy_tcp_info(v2);

  if (v3) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (NSData)metadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_connection_copy_metadata(v2);

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x189603F48]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    nw_parameters_t v6 = (void *)[v4 initWithBytes:bytes_ptr length:xpc_data_get_length(v3)];
  }

  else
  {
    nw_parameters_t v6 = 0LL;
  }

  return (NSData *)v6;
}

- (NWTCPConnectionState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInternalError:(id)a3
{
}

- (OS_nw_connection)internalConnection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInternalConnection:(id)a3
{
}

- (NWTCPConnectionAuthenticationDelegate)delegate
{
  return (NWTCPConnectionAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
}

uint64_t __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke( uint64_t a1,  uint64_t a2,  xpc_object_t xuint)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_t v6 = *(void **)(a1 + 32);
  [NSString stringWithUTF8String:a2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1LL;
}

void __32__NWTCPConnection_startInternal__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handlePeerCertificateTrustEvaluationWithMetadata:v7 trust:v8 completionHandler:v9];
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v12 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446210;
      id v14 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v12,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v13,  0xCu);
    }
  }
}

void __32__NWTCPConnection_startInternal__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleIdentityRequestWithMetadata:v5 completionHandler:v6];
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446210;
      id v11 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v10,  0xCu);
    }
  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      CFErrorRef v7 = nw_error_copy_cf_error(v5);
      [WeakRetained setInternalError:v7];
    }

    uint64_t v8 = [WeakRetained state];
    if (a2 > 5) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = qword_182667138[a2];
    }
    if ([WeakRetained state] != v9)
    {
      [WeakRetained willChangeValueForKey:@"state"];
      [WeakRetained setState:v9];
      [WeakRetained didChangeValueForKey:@"state"];
    }

    if (v9 == 5) {
      [WeakRetained setInternalConnection:0];
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v10 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446210;
      uint64_t v12 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_32(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isViable] != (_DWORD)a2)
    {
      [v4 willChangeValueForKey:@"viable"];
      [v4 setViable:a2];
      [v4 didChangeValueForKey:@"viable"];
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446210;
      CFErrorRef v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_34(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained hasBetterPath] != (_DWORD)a2)
    {
      [v4 willChangeValueForKey:@"hasBetterPath"];
      [v4 setHasBetterPath:a2];
      [v4 didChangeValueForKey:@"hasBetterPath"];
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446210;
      CFErrorRef v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke( uint64_t a1,  __SecIdentity *a2,  void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    sec_identity_t v7 = sec_identity_create_with_certificates(a2, v5);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v8 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446210;
      int v10 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  (uint8_t *)&v9,  0xCu);
    }
  }
}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke( uint64_t a1,  sec_certificate_t certificate)
{
  SecCertificateRef v3 = sec_certificate_copy_ref(certificate);
  [*(id *)(a1 + 32) addObject:v3];
}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_28( uint64_t a1,  __SecTrust *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(void *)cf = 0LL;
    SecTrustEvaluateWithError(a2, (CFErrorRef *)cf);
    if (*(void *)cf)
    {
      CFRelease(*(CFTypeRef *)cf);
      *(void *)cf = 0LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 136446210;
      *(void *)&cf[4] = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]_block_invoke";
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s Connection went away while waiting for event",  cf,  0xCu);
    }
  }
}

void __43__NWTCPConnection_write_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error) {
    error = nw_error_copy_cf_error(error);
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __43__NWTCPConnection_write_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  int a4,  void *a5)
{
  id v16 = a2;
  id v9 = a3;
  int v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = nw_error_copy_cf_error(v10);
    if (v16) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    if (v16) {
      goto LABEL_8;
    }
  }

  if (a4 && !v12)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:57 userInfo:0];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = 0LL;
    uint64_t v14 = *(void *)(a1 + 32);
LABEL_9:
    id v15 = v13;
    goto LABEL_10;
  }

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

@end