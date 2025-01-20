@interface NWDatagramConnection
+ (NWDatagramConnection)connectionWithConnectedSocket:(int)a3;
- (BOOL)readDatagramsWithMinimumCount:(unint64_t)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)writeDatagrams:(id)a3 completionHandler:(id)a4;
@end

@implementation NWDatagramConnection

- (BOOL)readDatagramsWithMinimumCount:(unint64_t)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  v9 = -[NWConnection internalConnection](self, "internalConnection");
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke;
  v12[3] = &unk_189BC6DD8;
  id v13 = v8;
  id v10 = v8;
  LOBYTE(v5) = nw_connection_read_multiple(v9, v6, v5, v12);

  return v5;
}

- (BOOL)writeDatagrams:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  size_t v8 = [v6 count];
  if (!v8)
  {
LABEL_30:
    char v18 = 0;
    goto LABEL_31;
  }

  unint64_t v9 = v8;
  id v10 = calloc(v8, 8uLL);
  if (!v10)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
    __int16 v38 = 1024;
    int v39 = v9;
    __int16 v40 = 2048;
    uint64_t v41 = 8LL;
    v20 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v34 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (os_log_s *)(id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8LL;
        v23 = "%{public}s calloc(%u, %zu) failed";
LABEL_25:
        v29 = v21;
        os_log_type_t v30 = v22;
LABEL_26:
        _os_log_impl(&dword_181A5C000, v29, v30, v23, buf, 0x1Cu);
      }
    }

    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v21 = (os_log_s *)(id)gLogObj;
        os_log_type_t v27 = type;
        BOOL v28 = os_log_type_enabled(v21, type);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446978;
            v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
            __int16 v38 = 1024;
            int v39 = v9;
            __int16 v40 = 2048;
            uint64_t v41 = 8LL;
            __int16 v42 = 2082;
            v43 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v21,  v27,  "%{public}s calloc(%u, %zu) failed, dumping backtrace:%{public}s",  buf,  0x26u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }

        if (!v28) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8LL;
        v23 = "%{public}s calloc(%u, %zu) failed, no backtrace";
        v29 = v21;
        os_log_type_t v30 = v27;
        goto LABEL_26;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (os_log_s *)(id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8LL;
        v23 = "%{public}s calloc(%u, %zu) failed, backtrace limit exceeded";
        goto LABEL_25;
      }
    }

void __57__NWDatagramConnection_writeDatagrams_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a2 userInfo:0];
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke( uint64_t a1,  id *a2,  unsigned int a3,  int a4)
{
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    uint64_t v8 = a3;
    do
    {
      if (*a2)
      {
        id v9 = *a2;

        [v11 addObject:v9];
      }

      ++a2;
      --v8;
    }

    while (v8);
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a4 userInfo:0];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (NWDatagramConnection)connectionWithConnectedSocket:(int)a3
{
  return  -[NWConnection initWithConnectedSocket:]( objc_alloc(&OBJC_CLASS___NWDatagramConnection),  "initWithConnectedSocket:",  *(void *)&a3);
}

@end