@interface Collation
- (Collation)init;
- (CollationCore)ccore;
- (NSString)coll_description;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_xpc_object)client_con;
- (OS_xpc_object)endpoint;
- (__CFDictionary)package;
- (id)getValidPaths:(id)a3 forLabels:(id)a4;
- (id)initForUser:(unsigned int)a3;
- (id)mountPointOfBundleID:(id)a3;
- (void)package;
- (void)setCcore:(id)a3;
- (void)setClient_con:(id)a3;
- (void)setColl_description:(id)a3;
- (void)setDq:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation Collation

- (Collation)init
{
  return (Collation *)-[Collation initForUser:](self, "initForUser:", getuid());
}

- (id)initForUser:(unsigned int)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___Collation;
  v4 = -[Collation init](&v25, sel_init);
  if (!v4)
  {
LABEL_6:
    v21 = v4;
    goto LABEL_10;
  }

  os_log_t v5 = os_log_create("com.apple.libcryptex", "collations");
  -[Collation setLog:](v4, "setLog:", v5);

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.security.libcryptex.collations", 0LL);
  -[Collation setDq:](v4, "setDq:", v6);

  collation_interface_request_endpoint_for_user();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[Collation setEndpoint:](v4, "setEndpoint:", v7);
  v8 = -[Collation endpoint](v4, "endpoint");
  if (v8)
  {
    -[Collation endpoint](v4, "endpoint");
    v9 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_t v10 = xpc_connection_create_from_endpoint(v9);
    -[Collation setClient_con:](v4, "setClient_con:", v10);

    -[Collation client_con](v4, "client_con");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __25__Collation_initForUser___block_invoke;
    handler[3] = &unk_18A2076C8;
    v12 = v4;
    v24 = v12;
    xpc_connection_set_event_handler(v11, handler);

    -[Collation client_con](v12, "client_con");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    -[Collation dq](v12, "dq");
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v13, v14);

    -[Collation client_con](v12, "client_con");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_activate(v15);

    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "command", "package");
    -[Collation client_con](v12, "client_con");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v17, empty);

    if (v18)
    {
      xpc_dictionary_get_value(v18, "package");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)[objc_alloc(MEMORY[0x189614D00]) initWithXPC:v19];
      -[Collation setCcore:](v12, "setCcore:", v20);
    }

    goto LABEL_6;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[Collation initForUser:].cold.1(a3);
  }
  v21 = 0LL;
LABEL_10:

  return v21;
}

void __25__Collation_initForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1895BEB60]();
  if (v4 == MEMORY[0x1895F9250])
  {
    [*(id *)(a1 + 32) log];
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1881FF000, v5, OS_LOG_TYPE_DEFAULT, "Received message %@", (uint8_t *)&v14, 0xCu);
    }
  }

  else if (v4 == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    [*(id *)(a1 + 32) log];
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __25__Collation_initForUser___block_invoke_cold_1((uint64_t)string, v5);
    }
  }

  else
  {
    [*(id *)(a1 + 32) log];
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __25__Collation_initForUser___block_invoke_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (__CFDictionary)package
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v2 = -[Collation ccore](self, "ccore");
  [v2 packToXPC];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (__CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();

  if (!v4) {
    -[Collation package].cold.1(&v6, v7);
  }
  return v4;
}

- (id)mountPointOfBundleID:(id)a3
{
  id v4 = a3;
  -[Collation ccore](self, "ccore");
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 mountPointOfBundleID:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getValidPaths:(id)a3 forLabels:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[Collation ccore](self, "ccore");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 getValidPaths:v7 forBundleID:v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CollationCore)ccore
{
  return self->_ccore;
}

- (void)setCcore:(id)a3
{
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (OS_xpc_object)client_con
{
  return self->_client_con;
}

- (void)setClient_con:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSString)coll_description
{
  return self->_coll_description;
}

- (void)setColl_description:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initForUser:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_1881FF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "No endpoint for user %d",  (uint8_t *)v1,  8u);
  OUTLINED_FUNCTION_1_5();
}

void __25__Collation_initForUser___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1881FF000, a2, OS_LOG_TYPE_ERROR, "Client message returned error %s", (uint8_t *)&v2, 0xCu);
}

void __25__Collation_initForUser___block_invoke_cold_2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)package
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end