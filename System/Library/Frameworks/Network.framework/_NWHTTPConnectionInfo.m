@interface _NWHTTPConnectionInfo
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isValid;
- (void)sendPingWithReceiveHandler:(id)a3;
@end

@implementation _NWHTTPConnectionInfo

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NWHTTPConnectionInfo;
  if (-[_NWHTTPConnectionInfo isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)sendPingWithReceiveHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self) {
    connectionMetadata = self->_connectionMetadata;
  }
  else {
    connectionMetadata = 0LL;
  }
  uint64_t v6 = MEMORY[0x1895F87A8];
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke;
  v30[3] = &unk_189BBF1C0;
  v30[4] = self;
  id v31 = v4;
  id v7 = v4;
  v8 = connectionMetadata;
  v9 = v30;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
    v17 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_181A5C000, v18, v19, "%{public}s called with null metadata", buf, 0xCu);
      }
    }

    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v18, type);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v18,  v23,  "%{public}s called with null metadata, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_44:
        if (!v17) {
          goto LABEL_10;
        }
LABEL_45:
        free(v17);
        goto LABEL_10;
      }

      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_181A5C000, v18, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl( &dword_181A5C000,  v18,  v28,  "%{public}s called with null metadata, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (BOOL)isValid
{
  if (self) {
    self = (_NWHTTPConnectionInfo *)self->_connectionMetadata;
  }
  return !nw_http_connection_metadata_get_is_closed(self);
}

- (void).cxx_destruct
{
}

@end