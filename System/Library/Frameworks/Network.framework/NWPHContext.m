@interface NWPHContext
- (NWPHContext)initWithRequest:(id)a3 onConnection:(id)a4;
- (OS_xpc_object)connection;
- (OS_xpc_object)reply;
- (OS_xpc_object)request;
- (int)pid;
- (void)setConnection:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation NWPHContext

- (NWPHContext)initWithRequest:(id)a3 onConnection:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NWPHContext;
  v8 = -[NWPHContext init](&v31, sel_init);
  if (v8)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      -[NWPHContext setConnection:](v8, "setConnection:", v7);
      -[NWPHContext setRequest:](v8, "setRequest:", v6);
      -[NWPHContext setReply:](v8, "setReply:", reply);
      v10 = v8;
LABEL_16:

      goto LABEL_17;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v33 = "-[NWPHContext initWithRequest:onConnection:]";
    v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v12, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (os_log_s *)(id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed";
LABEL_20:
        v20 = v13;
        os_log_type_t v21 = v14;
        goto LABEL_21;
      }

      if (!v29)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (os_log_s *)(id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed, backtrace limit exceeded";
        goto LABEL_20;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      BOOL v18 = os_log_type_enabled(v13, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_22:

          if (!v12) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }

        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed, no backtrace";
        v20 = v13;
        os_log_type_t v21 = v17;
LABEL_21:
        _os_log_impl(&dword_181A5C000, v20, v21, v15, buf, 0xCu);
        goto LABEL_22;
      }

      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        __int16 v34 = 2082;
        v35 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v13,  v17,  "%{public}s xpc_dictionary_create_reply failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v12)
    {
LABEL_15:
      v10 = 0LL;
      goto LABEL_16;
    }

- (int)pid
{
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid_t pid = xpc_connection_get_pid(v2);

  return pid;
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)request
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
}

@end