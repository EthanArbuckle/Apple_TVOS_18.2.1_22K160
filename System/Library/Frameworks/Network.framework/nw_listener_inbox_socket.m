@interface nw_listener_inbox_socket
- (BOOL)cancel;
- (BOOL)resume;
- (BOOL)suspend;
- (id)description;
- (id)start;
- (nw_listener_inbox_socket)initWithParameters:(id)a3 delegate:(id)a4;
- (void)initWithParameters:(void *)a3 delegate:(_OWORD *)a4 necpUUID:;
@end

@implementation nw_listener_inbox_socket

- (id)start
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  int sockfd_from_client = self->_sockfd_from_client;
  int v3 = sockfd_from_client;
  self->_int sockfd_from_client = -1;
  if (v3 < 0)
  {
    posix_error = nw_listener_socket_inbox_create_socket( self->super._parameters,  self->_listenUUID,  &sockfd_from_client);
    int v5 = sockfd_from_client;
    if (posix_error) {
      return posix_error;
    }
  }

  else
  {
    posix_error = 0LL;
    int v5 = v3;
  }

  if ((v5 & 0x80000000) == 0)
  {
    v6 = nw_fd_wrapper_create(v5);
    int v91 = 1;
    if (ioctl(sockfd_from_client, 0x8004667EuLL, &v91) < 0)
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8));
      int error_code = nw_error_get_error_code((nw_error_t)posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v16 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446466;
      *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = error_code;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v90) = 0;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_181A5C000, v10, v17, "%{public}s FIONBIO failed %{darwin.errno}d", &buf[0].sa_len, 0x12u);
        }
      }

      else if ((_BYTE)v90)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v20 = type[0];
        BOOL v21 = os_log_type_enabled(v10, type[0]);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)&buf[0].sa_len = 136446722;
            *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
            *(_WORD *)&buf[0].sa_data[10] = 1024;
            *(_DWORD *)&buf[0].sa_data[12] = error_code;
            *(_WORD *)buf[1].sa_data = 2082;
            *(void *)&buf[1].sa_data[2] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v10,  v20,  "%{public}s FIONBIO failed %{darwin.errno}d, dumping backtrace:%{public}s",  &buf[0].sa_len,  0x1Cu);
          }

          free(backtrace_string);
          if (!v9) {
            goto LABEL_160;
          }
          goto LABEL_159;
        }

        if (v21)
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl( &dword_181A5C000,  v10,  v20,  "%{public}s FIONBIO failed %{darwin.errno}d, no backtrace",  &buf[0].sa_len,  0x12u);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v29 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl( &dword_181A5C000,  v10,  v29,  "%{public}s FIONBIO failed %{darwin.errno}d, backtrace limit exceeded",  &buf[0].sa_len,  0x12u);
        }
      }

      goto LABEL_58;
    }

    if (nw_parameters_get_tfo(self->super._parameters) && setsockopt(sockfd_from_client, 6, 261, &v91, 4u))
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8));
      int v7 = nw_error_get_error_code((nw_error_t)posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446722;
      *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
      *(_WORD *)buf[1].sa_data = 1024;
      *(_DWORD *)&buf[1].sa_data[2] = v7;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v90) = 0;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v11 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d",  &buf[0].sa_len,  0x18u);
        }

- (nw_listener_inbox_socket)initWithParameters:(id)a3 delegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___nw_listener_inbox_socket;
  v9 = -[nw_listener_inbox initWithDelegate:](&v24, sel_initWithDelegate_, v8);
  int ip_protocol = nw_parameters_get_ip_protocol(v7);
  int v11 = ip_protocol;
  if (ip_protocol != 6 && ip_protocol != 17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
    __int16 v27 = 1024;
    int v28 = v11;
    v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v14, &type, &v22))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl(&dword_181A5C000, v15, v16, "%{public}s Cannot create listener with IP Protocol %u", buf, 0x12u);
        }
      }

      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v15, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446722;
            v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
            __int16 v27 = 1024;
            int v28 = v11;
            __int16 v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v15,  v19,  "%{public}s Cannot create listener with IP Protocol %u, dumping backtrace:%{public}s",  buf,  0x1Cu);
          }

          free(backtrace_string);
          if (!v14) {
            goto LABEL_11;
          }
          goto LABEL_10;
        }

        if (v20)
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl( &dword_181A5C000,  v15,  v19,  "%{public}s Cannot create listener with IP Protocol %u, no backtrace",  buf,  0x12u);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl( &dword_181A5C000,  v15,  v21,  "%{public}s Cannot create listener with IP Protocol %u, backtrace limit exceeded",  buf,  0x12u);
        }
      }
    }

    if (!v14)
    {
LABEL_11:
      int v12 = 0LL;
      goto LABEL_12;
    }

- (id)description
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy__66670;
  v10 = __Block_byref_object_dispose__66671;
  id v11 = 0LL;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __39__nw_listener_inbox_socket_description__block_invoke;
  v5[3] = &unk_189BC9210;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __39__nw_listener_inbox_socket_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)suspend
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___nw_listener_inbox_socket;
  BOOL v3 = -[nw_listener_inbox suspend](&v6, sel_suspend);
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v8 = "-[nw_listener_inbox_socket suspend]";
      __int16 v9 = 2114;
      v10 = self;
      _os_log_impl(&dword_181A5C000, v4, OS_LOG_TYPE_INFO, "%{public}s Suspended inbox %{public}@", buf, 0x16u);
    }

    nw_queue_suspend_source((uint64_t)self->_source);
  }

  return v3;
}

- (BOOL)resume
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___nw_listener_inbox_socket;
  BOOL v3 = -[nw_listener_inbox resume](&v7, sel_resume);
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v9 = "-[nw_listener_inbox_socket resume]";
      __int16 v10 = 2114;
      uint64_t v11 = self;
      _os_log_impl(&dword_181A5C000, v4, OS_LOG_TYPE_INFO, "%{public}s Resumed inbox %{public}@", buf, 0x16u);
    }

    nw_queue_resume_source((uint64_t)self->_source, v5);
  }

  return v3;
}

- (BOOL)cancel
{
  source = self->_source;
  if (source)
  {
    nw_queue_cancel_source((uint64_t)self->_source, (uint64_t)a2);
    self->_source = 0LL;
  }

  sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
  if (sockfd_wrapper_for_connection_group_only)
  {
    self->_sockfd_wrapper_for_connection_group_only = 0LL;
  }

  return source != 0LL;
}

- (void).cxx_destruct
{
}

- (void)initWithParameters:(void *)a3 delegate:(_OWORD *)a4 necpUUID:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [a1 initWithParameters:v7 delegate:v8];
    a1 = (void *)v9;
    if (v9) {
      *(_OWORD *)(v9 + 89) = *a4;
    }
  }

  return a1;
}

@end