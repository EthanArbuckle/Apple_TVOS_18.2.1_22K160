@interface PKDXpcClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)acceptWork;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isSandboxed;
- (NSString)clientid;
- (NSString)path;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (PKBundle)bundle;
- (PKDServer)server;
- (PKDXpcClient)initWithConnection:(id)a3 server:(id)a4;
- (__SecTask)_task;
- (id)description;
- (id)entitlementValueForKey:(id)a3;
- (int)pid;
- (unsigned)requestCount;
- (void)dead;
- (void)dealloc;
- (void)dying;
- (void)setAcceptWork:(BOOL)a3;
- (void)setBundle:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestCount:(unsigned int)a3;
- (void)set_task:(__SecTask *)a3;
@end

@implementation PKDXpcClient

- (PKDXpcClient)initWithConnection:(id)a3 server:(id)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___PKDXpcClient;
  v8 = -[PKDXpcClient init](&v59, "init");
  v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  -[PKDXpcClient setConnection:](v8, "setConnection:", v6);
  objc_storeStrong((id *)&v9->_server, a4);
  -[PKDXpcClient setAcceptWork:](v9, "setAcceptWork:", 1LL);
  id v10 = (id)-[PKDXpcClient pid](v9, "pid");
  if (proc_pidinfo((int)v10, 3, 0LL, buffer, 136) == 136)
  {
    if (v64) {
      v11 = (uint64_t *)&v64;
    }
    else {
      v11 = &v63;
    }
    v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"pkd per-connection queue for %s (%d)",  v11,  v10);
  }

  else
  {
    int v13 = *__error();
    uint64_t v15 = pklog_handle_for_category(1LL, v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v13 == 3)
    {
      if (v17) {
        -[PKDXpcClient initWithConnection:server:].cold.6();
      }

      goto LABEL_36;
    }

    if (v17) {
      -[PKDXpcClient initWithConnection:server:].cold.7();
    }

    v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"pkd per-connection queue for pid %d",  v10,  v55);
  }

  v19 = v12;
  v20 = -[NSString UTF8String](v19, "UTF8String");
  dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
  dispatch_queue_t v23 = dispatch_queue_create(v20, v22);
  -[PKDXpcClient setQueue:](v9, "setQueue:", v23);

  v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient queue](v9, "queue"));
  xpc_connection_set_target_queue(v6, v24);

  bzero(v61, 0x1000uLL);
  if (proc_pidpath(-[PKDXpcClient pid](v9, "pid"), v61, 0x1000u) > 0)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v61,  0LL,  0LL));
    if (v25)
    {
      v26 = -[PKBundle initWithExecutableURL:](objc_alloc(&OBJC_CLASS___PKBundle), "initWithExecutableURL:", v25);
      -[PKDXpcClient setBundle:](v9, "setBundle:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v25, "path"));
      -[PKDXpcClient setPath:](v9, "setPath:", v27);

      uint64_t v29 = pklog_handle_for_category(1LL, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        unsigned int v31 = -[PKDXpcClient pid](v9, "pid");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v25, "path"));
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v31;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "<PKDXpcClient: %p> new client pid %d [%@]", buf, 0x1Cu);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&v9->_connection);
      xpc_connection_get_audit_token(WeakRetained, buf);

      __int128 v34 = *(_OWORD *)buf;
      __int128 v35 = *(_OWORD *)&buf[16];
      *(_OWORD *)v9->_auditToken.val = *(_OWORD *)buf;
      *(_OWORD *)&v9->_auditToken.val[4] = v35;
      *(_OWORD *)token.val = v34;
      *(_OWORD *)&token.val[4] = v35;
      v9->__task = SecTaskCreateWithAuditToken(0LL, &token);
      __int128 v36 = *(_OWORD *)&v9->_auditToken.val[4];
      *(_OWORD *)token.val = *(_OWORD *)v9->_auditToken.val;
      *(_OWORD *)&token.val[4] = v36;
      v9->_sandboxed = sandbox_check_by_audit_token(&token, 0LL, 0LL) != 0;
      v37 = (_xpc_connection_s *)objc_loadWeakRetained((id *)&v9->_connection);
      v38 = v9;
      xpc_connection_set_context(v37, v38);

      v39 = (_xpc_connection_s *)objc_loadWeakRetained((id *)&v9->_connection);
      xpc_connection_set_finalizer_f(v39, connection_finalizer);

      v40 = (_xpc_connection_s *)objc_loadWeakRetained((id *)&v9->_connection);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = __42__PKDXpcClient_initWithConnection_server___block_invoke;
      handler[3] = &unk_24B00;
      v57 = v38;
      xpc_connection_set_event_handler(v40, handler);

      v41 = (_xpc_connection_s *)objc_loadWeakRetained((id *)&v9->_connection);
      xpc_connection_resume(v41);

      int v42 = 0;
      goto LABEL_35;
    }

    int v45 = pkUseInternalDiagnostics();
    uint64_t v47 = pklog_handle_for_category(1LL, v46);
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    v49 = v48;
    if (v45)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
        -[PKDXpcClient initWithConnection:server:].cold.4(v49);
      }
    }

    else if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      -[PKDXpcClient initWithConnection:server:].cold.5(v49);
    }

LABEL_34:
    int v42 = 1;
    goto LABEL_35;
  }

  if (*__error() != 3)
  {
    int v50 = pkUseInternalDiagnostics();
    uint64_t v52 = pklog_handle_for_category(1LL, v51);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    v25 = v53;
    if (v50)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        -[PKDXpcClient initWithConnection:server:].cold.2(v9, (char *)v25);
      }
    }

    else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      -[PKDXpcClient initWithConnection:server:].cold.3(v9, (char *)v25);
    }

    goto LABEL_34;
  }

  int v42 = 1;
  uint64_t v44 = pklog_handle_for_category(1LL, v43);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[PKDXpcClient initWithConnection:server:].cold.1();
  }
LABEL_35:

  if (v42)
  {
LABEL_36:
    v18 = 0LL;
    goto LABEL_37;
  }

void __42__PKDXpcClient_initWithConnection_server___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_termination_imminent)
    {
      [*(id *)(a1 + 32) dying];
    }

    else if (v3 == &_xpc_error_connection_invalid)
    {
      [*(id *)(a1 + 32) dead];
    }

    else
    {
      int v10 = pkUseInternalDiagnostics();
      uint64_t v12 = pklog_handle_for_category(1LL, v11);
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_1();
        }
      }

      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_2();
      }
    }
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      v9 = -[PKDTransaction initWithRequest:forClient:]( objc_alloc(&OBJC_CLASS___PKDTransaction),  "initWithRequest:forClient:",  v3,  *(void *)(a1 + 32));
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = [v15 requestCount] + 1;
      [v15 setRequestCount:v16];
      HIDWORD(v18) = 652835029 * v16;
      LODWORD(v18) = 652835029 * v16;
      if ((v18 >> 3) <= 0x418937)
      {
        uint64_t v19 = pklog_handle_for_category(1LL, v17);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_3((id *)(a1 + 32), v20);
        }
      }

      -[PKDTransaction dispatch](v9, "dispatch");
    }

    else
    {
      int v5 = pkUseInternalDiagnostics();
      uint64_t v7 = pklog_handle_for_category(1LL, v6);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (PKDTransaction *)v8;
      if (v5)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_4((uint64_t)v3, a1, (os_log_s *)v9);
        }
      }

      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_5((uint64_t)v3, a1, (os_log_s *)v9);
      }
    }
  }
}

- (void)dealloc
{
  task = self->__task;
  if (task) {
    CFRelease(task);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PKDXpcClient;
  -[PKDXpcClient dealloc](&v4, "dealloc");
}

- (void)dying
{
}

- (void)dead
{
}

- (int)pid
{
  uint64_t v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient connection](self, "connection"));
  pid_t pid = xpc_connection_get_pid(v2);

  return pid;
}

- (id)entitlementValueForKey:(id)a3
{
  CFErrorRef error = 0LL;
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = (void *)SecTaskCopyValueForEntitlement(-[PKDXpcClient _task](self, "_task"), v4, &error);

  if (error)
  {
    uint64_t v7 = pklog_handle_for_category(1LL, v6);
    uint8_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PKDXpcClient entitlementValueForKey:].cold.1(self, v8);
    }

    CFRelease(error);
  }

  return v5;
}

- (BOOL)hasEntitlement:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient entitlementValueForKey:](self, "entitlementValueForKey:", a3));
  uint64_t v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 isEqual:&__kCFBooleanFalse] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient connection](self, "connection"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient connection](self, "connection"));
    uint64_t v5 = -[PKDXpcClient pid](self, "pid");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDXpcClient path](self, "path"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<PKDXpcClient: %p; con=%@ pid=%d path=%@>",
                     self,
                     v4,
                     v5,
                     v6));
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<PKDXpcClient: %p; NO CONNECTION>",
                     self));
  }

  return v7;
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (PKDServer)server
{
  return (PKDServer *)objc_getProperty(self, a2, 24LL, 1);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)clientid
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (PKBundle)bundle
{
  return (PKBundle *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBundle:(id)a3
{
}

- (BOOL)acceptWork
{
  return self->_acceptWork;
}

- (void)setAcceptWork:(BOOL)a3
{
  self->_acceptWork = a3;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (__SecTask)_task
{
  return self->__task;
}

- (void)set_task:(__SecTask *)a3
{
  self->__task = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (unsigned)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unsigned int)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

- (void)initWithConnection:server:.cold.1()
{
}

- (void)initWithConnection:(void *)a1 server:(char *)a2 .cold.2(void *a1, char *a2)
{
  _os_log_fault_impl( &dword_0,  (os_log_t)a2,  OS_LOG_TYPE_FAULT,  "Failed to get the file system path for the process with pid %d: errno=%{darwin.errno}d",  v3,  0xEu);
  OUTLINED_FUNCTION_1_5();
}

- (void)initWithConnection:(void *)a1 server:(char *)a2 .cold.3(void *a1, char *a2)
{
  _os_log_error_impl( &dword_0,  (os_log_t)a2,  OS_LOG_TYPE_ERROR,  "Failed to get the file system path for the process with pid %d: errno=%{darwin.errno}d",  v3,  0xEu);
  OUTLINED_FUNCTION_1_5();
}

- (void)initWithConnection:(os_log_t)log server:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to get the file url from file system path.", v1, 2u);
  OUTLINED_FUNCTION_6_1();
}

- (void)initWithConnection:(os_log_t)log server:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to get the file url from file system path.", v1, 2u);
  OUTLINED_FUNCTION_6_1();
}

- (void)initWithConnection:server:.cold.6()
{
}

- (void)initWithConnection:server:.cold.7()
{
}

void __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_1()
{
}

void __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_2()
{
}

void __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_3(id *a1, os_log_s *a2)
{
  unsigned int v4 = [*a1 pid];
  unsigned int v5 = [*a1 requestCount];
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 1024;
  unsigned int v8 = v5;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "client %d used %u requests so far", (uint8_t *)v6, 0xEu);
}

void __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_4( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
}

void __42__PKDXpcClient_initWithConnection_server___block_invoke_cold_5( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
}

- (void)entitlementValueForKey:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
}

@end