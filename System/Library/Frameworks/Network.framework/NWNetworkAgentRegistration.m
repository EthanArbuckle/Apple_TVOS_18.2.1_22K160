@interface NWNetworkAgentRegistration
+ (BOOL)addActiveAssertionToNetworkAgent:(id)a3;
+ (BOOL)removeActiveAssertionFromNetworkAgent:(id)a3;
+ (BOOL)useNetworkAgent:(id)a3 returnUseCount:(unint64_t *)a4;
- (BOOL)addNetworkAgentToInterfaceNamed:(id)a3;
- (BOOL)addToken:(id)a3;
- (BOOL)assignDiscoveredEndpoints:(id)a3 toClient:(id)a4;
- (BOOL)assignNexusData:(id)a3 toClient:(id)a4;
- (BOOL)assignResolvedEndpoints:(id)a3 toClient:(id)a4;
- (BOOL)createReadSourceWithRegistrationSocket:(int)a3;
- (BOOL)flushTokens;
- (BOOL)isRegistered;
- (BOOL)isRegisteredInternal;
- (BOOL)registerNetworkAgent:(id)a3;
- (BOOL)registerNetworkAgent:(id)a3 withFileDescriptor:(int)a4;
- (BOOL)removeNetworkAgentFromInterfaceNamed:(id)a3;
- (BOOL)resetError;
- (BOOL)setLowWaterMark:(unsigned int)a3;
- (BOOL)setRegisteredNetworkAgent:(id)a3 fileDescriptor:(int)a4;
- (BOOL)unregisterNetworkAgent;
- (BOOL)updateNetworkAgent:(id)a3;
- (Class)networkAgentClass;
- (NSUUID)registeredUUID;
- (NWNetworkAgent)networkAgent;
- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3;
- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)readSource;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)dupRegistrationFileDescriptor;
- (int)registrationSocket;
- (unint64_t)useCount;
- (unsigned)tokenCount;
- (unsigned)tokenCountWithError:(int *)a3;
- (void)dealloc;
- (void)handleMessageFromAgent;
- (void)setNetworkAgent:(id)a3;
- (void)setNetworkAgentClass:(Class)a3;
- (void)setQueue:(id)a3;
- (void)setReadSource:(id)a3;
- (void)setRegisteredUUID:(id)a3;
- (void)setRegistrationSocket:(int)a3;
- (void)setUseCount:(unint64_t)a3;
@end

@implementation NWNetworkAgentRegistration

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NWNetworkAgentRegistration;
  v4 = -[NWNetworkAgentRegistration init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_networkAgentClass = a3;
    v4->_registrationSocket = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create("NWNetworkAgentRegistration queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = v5;
    goto LABEL_3;
  }

  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v13, v14, v15, buf, 0xCu);
      }
    }

    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
            __int16 v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v13,  v14,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v17) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3 queue:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v8 = v7;
  if (!a3)
  {
    __nwlog_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null agentClass";
LABEL_44:
        _os_log_impl(&dword_181A5C000, v14, v15, v16, buf, 0xCu);
      }
    }

    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      BOOL v24 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
          __int16 v34 = 2082;
          v35 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v14,  v15,  "%{public}s called with null agentClass, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_46:
        if (!v13)
        {
LABEL_48:

          v10 = 0LL;
          goto LABEL_5;
        }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWNetworkAgentRegistration readSource](self, "readSource");
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NWNetworkAgentRegistration setReadSource:](self, "setReadSource:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWNetworkAgentRegistration;
  -[NWNetworkAgentRegistration dealloc](&v5, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = objc_alloc_init(MEMORY[0x189607940]);
  -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendPrettyObject:v7 withName:@"Domain" indent:v4 showFullContent:1];
  v8 = -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
  [v6 appendPrettyObject:v8 withName:@"Type" indent:v4 showFullContent:1];
  v9 = -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  [v6 appendPrettyObject:v9 withName:@"UUID" indent:v4 showFullContent:1];

  return v6;
}

- (id)description
{
  return  -[NWNetworkAgentRegistration descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (BOOL)isRegisteredInternal
{
  return -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket") != -1;
}

- (BOOL)isRegistered
{
  if (-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket") == -1) {
    return 0;
  }
  int v4 = 0;
  -[NWNetworkAgentRegistration tokenCountWithError:](self, "tokenCountWithError:", &v4);
  return v4 == 0;
}

- (int)dupRegistrationFileDescriptor
{
  if (-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket") < 0) {
    return -1;
  }
  else {
    return dup(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"));
  }
}

- (void)handleMessageFromAgent
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  char v94 = 0;
  if (-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal"))
  {
    v3 = (unsigned __int8 *)nw_network_agent_ctl_copy_received_agent_message( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  &v94);
    if (v3)
    {
      int v4 = v3;
      unsigned int v5 = *v3;
      if (v5 > 0x1A)
      {
LABEL_77:
        free(v4);
        return;
      }

      if (((1 << v5) & 0x400F400) != 0)
      {
        if (*((_DWORD *)v3 + 3) < 0x10u)
        {
          id v6 = 0LL;
        }

        else
        {
          [MEMORY[0x189603FC8] dictionary];
          id v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!uuid_is_null(v4 + 16))
          {
            id v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v4 + 16];
            [v6 setObject:v7 forKeyedSubscript:@"ClientUUID"];
          }

          [v6 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"FromUser"];
          unsigned int v5 = *v4;
        }

        switch(v5)
        {
          case 0xAu:
            v11 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v12 = objc_opt_respondsToSelector();

            if ((v12 & 1) != 0)
            {
              v13 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              [v13 requestNexusWithOptions:v6];
            }

            break;
          case 0xCu:
            v16 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v17 = objc_opt_respondsToSelector();

            if ((v17 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 closeNexusWithOptions:v6];
            }

            break;
          case 0xDu:
            v19 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v21 startAgentWithOptions:v6];
            }

            break;
          case 0xEu:
            v22 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v23 = objc_opt_respondsToSelector();

            if ((v23 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 assertAgentWithOptions:v6];
            }

            break;
          case 0xFu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            char v26 = objc_opt_respondsToSelector();

            if ((v26 & 1) != 0)
            {
              v27 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              [v27 unassertAgentWithOptions:v6];
            }

            break;
          case 0x1Au:
            if (*((_DWORD *)v4 + 3) < 0x14u) {
              uint64_t v28 = 0LL;
            }
            else {
              uint64_t v28 = *((unsigned int *)v4 + 8);
            }
            v74 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v75 = objc_opt_respondsToSelector();

            if ((v75 & 1) != 0)
            {
              v76 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              [v76 reportError:v28 withOptions:v6];
            }

            break;
          default:
            goto LABEL_76;
        }

        goto LABEL_76;
      }

      if (((1 << v5) & 0x320) == 0)
      {
        if (v5 != 25) {
          goto LABEL_77;
        }
        -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
        os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        char v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0) {
          goto LABEL_77;
        }
        -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 tokenLowWaterMarkReached];
        goto LABEL_76;
      }

      if (*((_DWORD *)v3 + 3) < 0x18u)
      {
        id v6 = 0LL;
        goto LABEL_42;
      }

      [MEMORY[0x189603FC8] dictionary];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_DWORD *)v4 + 5))
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v9 forKeyedSubscript:@"PID"];
      }

      if (uuid_is_null(v4 + 24))
      {
        int v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0) {
          goto LABEL_19;
        }
      }

      else
      {
        objc_super v29 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v4 + 24];
        [v6 setObject:v29 forKeyedSubscript:@"ProcessUUID"];

        int v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_19:
          if ((v10 & 1) == 0)
          {
LABEL_42:
            int v30 = *v4;
            switch(v30)
            {
              case 5:
                v35 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                char v36 = objc_opt_respondsToSelector();

                if ((v36 & 1) != 0)
                {
                  v33 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                  char v34 = [v33 startAgentWithOptions:v6];
LABEL_49:
                  char v37 = v34;

                  if ((v37 & 1) != 0)
                  {
LABEL_76:

                    goto LABEL_77;
                  }
                }

                break;
              case 9:
                v72 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                char v73 = objc_opt_respondsToSelector();

                if ((v73 & 1) == 0) {
                  goto LABEL_76;
                }
                v39 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                [v39 unassertAgentWithOptions:v6];
                goto LABEL_75;
              case 8:
                v31 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                char v32 = objc_opt_respondsToSelector();

                if ((v32 & 1) != 0)
                {
                  v33 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                  char v34 = [v33 assertAgentWithOptions:v6];
                  goto LABEL_49;
                }

                break;
            }
            v38 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v39 = (void *)[v38 copyAgentData];
            v40 = -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
            [v40 getUUIDBytes:buf];
            v41 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v42 = objc_opt_respondsToSelector();

            if ((v42 & 1) != 0)
            {
              v43 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v92 = [v43 isSpecificUseOnly];
            }

            else
            {
              char v92 = 0;
            }
            v44 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v45 = objc_opt_respondsToSelector();

            if ((v45 & 1) != 0)
            {
              v46 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v91 = [v46 isNetworkProvider];
            }

            else
            {
              char v91 = 0;
            }
            v47 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v48 = objc_opt_respondsToSelector();

            if ((v48 & 1) != 0)
            {
              v49 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v90 = [v49 isNexusProvider];
            }

            else
            {
              char v90 = 0;
            }
            v50 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v51 = objc_opt_respondsToSelector();

            if ((v51 & 1) != 0)
            {
              v52 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v89 = [v52 supportsListenRequests];
            }

            else
            {
              char v89 = 0;
            }
            v53 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v54 = objc_opt_respondsToSelector();

            if ((v54 & 1) != 0)
            {
              v55 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v88 = [v55 supportsBrowseRequests];
            }

            else
            {
              char v88 = 0;
            }
            v56 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v57 = objc_opt_respondsToSelector();

            if ((v57 & 1) != 0)
            {
              v58 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v87 = [v58 supportsResolveRequests];
            }

            else
            {
              char v87 = 0;
            }
            v59 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v60 = objc_opt_respondsToSelector();

            if ((v60 & 1) != 0)
            {
              v61 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              unsigned __int8 v86 = [v61 requiresAssert];
            }

            else
            {
              unsigned __int8 v86 = 0;
            }
            v62 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v63 = objc_opt_respondsToSelector();

            v93 = v6;
            if ((v63 & 1) != 0)
            {
              v64 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              char v85 = [v64 updateClientsImmediately];
            }

            else
            {
              char v85 = 0;
            }
            v84 = -[objc_class agentDomain]( -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"),  "agentDomain");
            v83 = -[objc_class agentType]( -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"),  "agentType");
            v65 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            [v65 agentDescription];
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            int v81 = -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket");
            v80 = (_BYTE *)[v84 UTF8String];
            v79 = (_BYTE *)[v83 UTF8String];
            uint64_t v78 = [v82 UTF8String];
            v66 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            int v77 = [v66 isActive];
            v67 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            int v68 = [v67 isKernelActivated];
            v69 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            char v70 = [v69 isUserActivated];
            v71 = -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            nw_network_agent_ctl_setsockopt( v81,  3,  buf,  v80,  v79,  v78,  v77,  v68,  v70,  [v71 isVoluntary],  v92,  v91,  v90,  v89,  v88,  v87,  0,  v86,  v85,  (const unsigned __int8 *)objc_msgSend(v39, "bytes"),  objc_msgSend(v39, "length"));

            id v6 = v93;
LABEL_75:

            goto LABEL_76;
          }

- (BOOL)createReadSourceWithRegistrationSocket:(int)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v3 = *(void *)&a3;
    if (-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal"))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v5 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s Agent registration is already active",  buf,  0xCu);
      }

      return 0;
    }

    -[NWNetworkAgentRegistration queue](self, "queue");
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    char v12 = dispatch_source_create(MEMORY[0x1895F8B60], v3, 0LL, v11);

    BOOL v10 = v12 != 0LL;
    if (v12)
    {
      -[NWNetworkAgentRegistration setRegistrationSocket:](self, "setRegistrationSocket:", v3);
      uint64_t v13 = MEMORY[0x1895F87A8];
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke;
      handler[3] = &__block_descriptor_36_e5_v8__0l;
      int v32 = v3;
      dispatch_source_set_cancel_handler(v12, handler);
      objc_initWeak((id *)buf, self);
      v28[0] = v13;
      v28[1] = 3221225472LL;
      v28[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2;
      v28[3] = &unk_189BC75C0;
      objc_copyWeak(&v30, (id *)buf);
      os_log_type_t v14 = v12;
      objc_super v29 = v14;
      dispatch_source_set_event_handler(v14, v28);
      dispatch_resume(v14);
      -[NWNetworkAgentRegistration setReadSource:](self, "setReadSource:", v14);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
LABEL_30:

      return v10;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v18 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (__nwlog_fault(v19, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v20 = (os_log_s *)(id)gLogObj;
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_181A5C000, v20, v21, "%{public}s dispatch_source_create failed", buf, 0xCu);
        }
      }

      else if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v20 = (os_log_s *)(id)gLogObj;
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
            __int16 v37 = 2082;
            v38 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v20,  v25,  "%{public}s dispatch_source_create failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          if (!v19) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }

        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_181A5C000, v20, v25, "%{public}s dispatch_source_create failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v20 = (os_log_s *)(id)gLogObj;
        os_log_type_t v27 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          char v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl( &dword_181A5C000,  v20,  v27,  "%{public}s dispatch_source_create failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

    if (!v19)
    {
LABEL_29:
      close(v3);
      goto LABEL_30;
    }

- (BOOL)registerNetworkAgent:(id)a3 withFileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = "-[NWNetworkAgentRegistration registerNetworkAgent:withFileDescriptor:]";
      _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s Agent is not a valid class",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_8;
  }

  if (!-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]( self,  "createReadSourceWithRegistrationSocket:",  v4))
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_35;
  }

  __int128 buf = 0uLL;
  [v6 agentUUID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 getUUIDBytes:&buf];

  os_log_type_t v25 = (void *)[v6 copyAgentData];
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v24 = [v6 isSpecificUseOnly];
  }
  else {
    char v24 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v23 = [v6 isNetworkProvider];
  }
  else {
    char v23 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v22 = [v6 isNexusProvider];
  }
  else {
    char v22 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v21 = [v6 supportsListenRequests];
  }
  else {
    char v21 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v20 = [v6 supportsBrowseRequests];
  }
  else {
    char v20 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v18 = [v6 supportsResolveRequests];
  }
  else {
    char v18 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v16 = [v6 requiresAssert];
  }
  else {
    unsigned __int8 v16 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char v15 = [v6 updateClientsImmediately];
  }
  else {
    char v15 = 0;
  }
  -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
  [v6 agentDescription];
  v19 = v10;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = nw_network_agent_ctl_setsockopt( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  1,  (unsigned __int8 *)&buf,  (_BYTE *)[v10 UTF8String],  (_BYTE *)objc_msgSend(v11, "UTF8String"),  objc_msgSend(v17, "UTF8String"),  objc_msgSend(v6, "isActive"),  objc_msgSend(v6, "isKernelActivated"),  objc_msgSend(v6, "isUserActivated"),  objc_msgSend(v6, "isVoluntary"),  v24,  v23,  v22,  v21,  v20,  v18,  0,  v16,  v15,  (const unsigned __int8 *)objc_msgSend(v25, "bytes"),  objc_msgSend(v25, "length"));
  BOOL v9 = v12 >= 0;
  if (v12 < 0)
  {
    close(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"));
    -[NWNetworkAgentRegistration setRegistrationSocket:](self, "setRegistrationSocket:", 0xFFFFFFFFLL);
  }

  else
  {
    -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v6);
    [v6 agentUUID];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWNetworkAgentRegistration setRegisteredUUID:](self, "setRegisteredUUID:", v13);
  }

LABEL_35:
  return v9;
}

- (BOOL)registerNetworkAgent:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[NWNetworkAgentRegistration registerNetworkAgent:withFileDescriptor:]( self,  "registerNetworkAgent:withFileDescriptor:",  v4,  +[NWNetworkAgentRegistration newRegistrationFileDescriptor]( &OBJC_CLASS___NWNetworkAgentRegistration,  "newRegistrationFileDescriptor"));

  return (char)self;
}

- (BOOL)setRegisteredNetworkAgent:(id)a3 fileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v10 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      os_log_type_t v14 = "-[NWNetworkAgentRegistration setRegisteredNetworkAgent:fileDescriptor:]";
      _os_log_impl(&dword_181A5C000, v10, OS_LOG_TYPE_ERROR, "%{public}s Agent is not a valid class", buf, 0xCu);
    }

    goto LABEL_7;
  }

  -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v6);
  [v6 agentUUID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkAgentRegistration setRegisteredUUID:](self, "setRegisteredUUID:", v7);

  if (!-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]( self,  "createReadSourceWithRegistrationSocket:",  v4))
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }

  -[NWNetworkAgentRegistration queue](self, "queue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  dispatch_async(v8, block);

  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)updateNetworkAgent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal")) {
    goto LABEL_6;
  }
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 agentUUID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    *(void *)uu = 0LL;
    uint64_t v26 = 0LL;
    v8 = -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    [v8 getUUIDBytes:uu];

    char v24 = (void *)[v4 copyAgentData];
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v23 = [v4 isSpecificUseOnly];
    }
    else {
      char v23 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v22 = [v4 isNetworkProvider];
    }
    else {
      char v22 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v21 = [v4 isNexusProvider];
    }
    else {
      char v21 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v20 = [v4 supportsListenRequests];
    }
    else {
      char v20 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v19 = [v4 supportsBrowseRequests];
    }
    else {
      char v19 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v18 = [v4 supportsResolveRequests];
    }
    else {
      char v18 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      unsigned __int8 v16 = [v4 requiresAssert];
    }
    else {
      unsigned __int8 v16 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v15 = [v4 updateClientsImmediately];
    }
    else {
      char v15 = 0;
    }
    v11 = -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
    -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 agentDescription];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = v11;
    int v14 = nw_network_agent_ctl_setsockopt( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  3,  uu,  (_BYTE *)[v11 UTF8String],  (_BYTE *)objc_msgSend(v12, "UTF8String"),  objc_msgSend(v13, "UTF8String"),  objc_msgSend(v4, "isActive"),  objc_msgSend(v4, "isKernelActivated"),  objc_msgSend(v4, "isUserActivated"),  objc_msgSend(v4, "isVoluntary"),  v23,  v22,  v21,  v20,  v19,  v18,  0,  v16,  v15,  (const unsigned __int8 *)objc_msgSend(v24, "bytes"),  objc_msgSend(v24, "length"));
    BOOL v9 = v14 >= 0;
    if ((v14 & 0x80000000) == 0) {
      -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v4);
    }
  }

  else
  {
LABEL_6:
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)unregisterNetworkAgent
{
  BOOL v3 = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  if (v3)
  {
    nw_network_agent_ctl_setsockopt_inner( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  2,  0LL,  0,  0LL,  0);
    -[NWNetworkAgentRegistration queue](self, "queue");
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke;
    block[3] = &unk_189BC93A0;
    block[4] = self;
    dispatch_async(v4, block);
  }

  return v3;
}

- (BOOL)addToken:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 136446210;
    char v21 = "-[NWNetworkAgentRegistration addToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)__int128 buf = 136446210;
        char v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null token";
LABEL_31:
        _os_log_impl(&dword_181A5C000, v9, v10, v11, buf, 0xCu);
      }

- (BOOL)flushTokens
{
  BOOL v3 = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  if (v3) {
    LOBYTE(v3) = nw_network_agent_ctl_setsockopt_inner( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  22,  0LL,  0,  0LL,  0) == 0;
  }
  return v3;
}

- (BOOL)resetError
{
  BOOL v3 = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  if (v3) {
    LOBYTE(v3) = nw_network_agent_ctl_setsockopt_inner( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  27,  0LL,  0,  0LL,  0) == 0;
  }
  return v3;
}

- (BOOL)setLowWaterMark:(unsigned int)a3
{
  BOOL v5 = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  if (v5)
  {
    *(_DWORD *)int v7 = a3;
    LOBYTE(v5) = nw_network_agent_ctl_setsockopt_inner( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  24,  v7,  4u,  0LL,  0) == 0;
  }

  return v5;
}

- (BOOL)addNetworkAgentToInterfaceNamed:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal")
    && (-[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID"),
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 getUUIDBytes:uu];

    BOOL v7 = nw_network_agent_add_to_interface([v4 UTF8String], uu) == 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)removeNetworkAgentFromInterfaceNamed:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal")
    && (-[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID"),
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 getUUIDBytes:uu];

    BOOL v7 = nw_network_agent_remove_from_interface([v4 UTF8String], uu) == 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)assignNexusData:(id)a3 toClient:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal")) {
    goto LABEL_44;
  }
  v8 = -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  if (v8)
  {
    if ((unint64_t)[v6 length] >= 0xFFFFFFF0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      *(_DWORD *)__int128 buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      LODWORD(v34) = 22;
      uint64_t v10 = (const char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v35 = 0;
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          uint64_t v13 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)__int128 buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v13;
          BOOL v14 = "%{public}s Invalid data length (%lu)";
LABEL_23:
          uint64_t v27 = v11;
          os_log_type_t v28 = v12;
LABEL_24:
          _os_log_impl(&dword_181A5C000, v27, v28, v14, buf, 0x16u);
        }
      }

      else if (v35)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v18 = type;
        BOOL v19 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v19)
          {
            uint64_t v20 = objc_msgSend(v6, "length", buf, v34);
            *(_DWORD *)__int128 buf = 136446722;
            *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v11,  v18,  "%{public}s Invalid data length (%lu), dumping backtrace:%{public}s",  buf,  0x20u);
          }

          free(backtrace_string);
LABEL_26:
          if (v10)
          {
            objc_super v29 = (char *)v10;
LABEL_43:
            free(v29);
            goto LABEL_44;
          }

          goto LABEL_44;
        }

        if (v19)
        {
          uint64_t v32 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)__int128 buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v32;
          BOOL v14 = "%{public}s Invalid data length (%lu), no backtrace";
          uint64_t v27 = v11;
          os_log_type_t v28 = v18;
          goto LABEL_24;
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          uint64_t v26 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)__int128 buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v26;
          BOOL v14 = "%{public}s Invalid data length (%lu), backtrace limit exceeded";
          goto LABEL_23;
        }
      }

      goto LABEL_26;
    }

    LODWORD(v8) = [v6 length] + 16;
    char v15 = (unsigned __int8 *)calloc(v8, 1uLL);
    if (v15)
    {
      BOOL v16 = v15;
      [v7 getUUIDBytes:buf];
      *(_OWORD *)BOOL v16 = *(_OWORD *)buf;
      if ([v6 length]) {
        memcpy(v16 + 16, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
      }
      LOBYTE(v8) = (int)nw_network_agent_ctl_setsockopt_inner( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  11,  v16,  v8,  0LL,  0) >= 0;
      free(v16);
      goto LABEL_45;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v21 = (id)gLogObj;
    *(_DWORD *)__int128 buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (_DWORD)v8;
    __int16 v22 = (const char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v35 = 0;
    if (__nwlog_fault(v22, &type, &v35))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v23 = (os_log_s *)(id)gLogObj;
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)__int128 buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v8;
          os_log_type_t v25 = "%{public}s calloc(%u) failed";
LABEL_39:
          _os_log_impl(&dword_181A5C000, v23, v24, v25, buf, 0x12u);
          goto LABEL_40;
        }

        goto LABEL_40;
      }

      if (!v35)
      {
        __nwlog_obj();
        char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)__int128 buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v8;
          os_log_type_t v25 = "%{public}s calloc(%u) failed, backtrace limit exceeded";
          goto LABEL_39;
        }

- (BOOL)assignDiscoveredEndpoints:(id)a3 toClient:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignDiscoveredEndpoints:toClient:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_INFO,  "%{public}s Assigning discovered endpoints %@ to %@",  buf,  0x20u);
  }

  BOOL v9 = nw_array_create();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "internalEndpoint", (void)v20);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v9, v14);
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  *(void *)__int128 buf = 0LL;
  BOOL endpoint_array_result = nw_path_create_endpoint_array_result(buf, (void *)v9, 202);
  if (endpoint_array_result)
  {
    id v16 = objc_alloc(MEMORY[0x189603F48]);
    BOOL v17 = (void *)[v16 initWithBytesNoCopy:endpoint_array_result length:*(void *)buf freeWhenDone:1];
    BOOL v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", v17, v7);
  }

  else
  {
    BOOL v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", 0LL, v7);
  }

  return v18;
}

- (BOOL)assignResolvedEndpoints:(id)a3 toClient:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWNetworkAgentRegistration assignResolvedEndpoints:toClient:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_INFO, "%{public}s Assigning resolved endpoints %@ to %@", buf, 0x20u);
  }

  BOOL v9 = nw_array_create();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "internalEndpoint", (void)v20);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v9, v14);
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  *(void *)__int128 buf = 0LL;
  BOOL endpoint_array_result = nw_path_create_endpoint_array_result(buf, (void *)v9, 203);
  if (endpoint_array_result)
  {
    id v16 = objc_alloc(MEMORY[0x189603F48]);
    BOOL v17 = (void *)[v16 initWithBytesNoCopy:endpoint_array_result length:*(void *)buf freeWhenDone:1];
    BOOL v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", v17, v7);
  }

  else
  {
    BOOL v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", 0LL, v7);
  }

  return v18;
}

- (unint64_t)useCount
{
  unint64_t v5 = 0LL;
  BOOL v3 = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  unint64_t result = 0LL;
  if (v3)
  {
    nw_network_agent_get_use_count(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), &v5);
    return v5;
  }

  return result;
}

- (void)setUseCount:(unint64_t)a3
{
  if (-[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal")) {
    nw_network_agent_set_use_count(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), a3);
  }
}

- (unsigned)tokenCountWithError:(int *)a3
{
  unsigned int result = -[NWNetworkAgentRegistration isRegisteredInternal](self, "isRegisteredInternal");
  if (result)
  {
    unsigned int v7 = 0;
    int token_count = nw_network_agent_get_token_count( -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"),  &v7);
    if (a3) {
      *a3 = token_count;
    }
    return v7;
  }

  return result;
}

- (unsigned)tokenCount
{
  return -[NWNetworkAgentRegistration tokenCountWithError:](self, "tokenCountWithError:", 0LL);
}

- (Class)networkAgentClass
{
  return self->_networkAgentClass;
}

- (void)setNetworkAgentClass:(Class)a3
{
  self->_networkAgentClass = a3;
}

- (NWNetworkAgent)networkAgent
{
  return (NWNetworkAgent *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setNetworkAgent:(id)a3
{
}

- (NSUUID)registeredUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRegisteredUUID:(id)a3
{
}

- (int)registrationSocket
{
  return self->_registrationSocket;
}

- (void)setRegistrationSocket:(int)a3
{
  self->_registrationSocket = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setReadSource:(id)a3
{
}

- (void).cxx_destruct
{
}

void __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) readSource];
    BOOL v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setReadSource:0];
  }

uint64_t __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessageFromAgent];
}

uint64_t __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained readSource];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = *(void **)(a1 + 32);

    id WeakRetained = v5;
    if (v3 == v4)
    {
      [v5 handleMessageFromAgent];
      id WeakRetained = v5;
    }
  }
}

+ (BOOL)addActiveAssertionToNetworkAgent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  [a3 agentUUID];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 getUUIDBytes:v11];

  id v4 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    id v5 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  0LL,  0LL);
    id v6 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v5;

    id v4 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator) {
      return 0;
    }
  }

  [v4 path];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 internalPath];
  v8 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = nw_path_agent_action(v8, v11, 131);

  return v9;
}

+ (BOOL)removeActiveAssertionFromNetworkAgent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  *(void *)v8 = 0LL;
  uint64_t v9 = 0LL;
  [a3 agentUUID];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 getUUIDBytes:v8];

  if (!sharedAssertionEvaluator) {
    return 0;
  }
  [(id)sharedAssertionEvaluator path];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 internalPath];
  id v5 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = nw_path_agent_action(v5, v8, 132);

  return v6;
}

+ (BOOL)useNetworkAgent:(id)a3 returnUseCount:(unint64_t *)a4
{
  v13[2] = *MEMORY[0x1895F89C0];
  v13[0] = 0LL;
  v13[1] = 0LL;
  [a3 agentUUID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 getUUIDBytes:v13];

  BOOL v6 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    unsigned int v7 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  0LL,  0LL);
    v8 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v7;

    BOOL v6 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator) {
      return 0;
    }
  }

  [v6 path];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 internalPath];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = nw_path_increment_agent_use_count(v10, (const unsigned __int8 *)v13, a4);

  return v11;
}

@end