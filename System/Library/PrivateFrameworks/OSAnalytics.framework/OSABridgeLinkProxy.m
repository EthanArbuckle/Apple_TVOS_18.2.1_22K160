@interface OSABridgeLinkProxy
+ (void)setLink:(id)a3;
+ (void)transfer:(id)a3 key:(id)a4;
- (void)transferInternal:(id)a3 key:(id)a4;
@end

@implementation OSABridgeLinkProxy

+ (void)setLink:(id)a3
{
  id v3 = a3;
  if (_sharedProxyInstance) {
    +[OSABridgeLinkProxy setLink:].cold.1();
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__OSABridgeLinkProxy_setLink___block_invoke;
  block[3] = &unk_189E20268;
  id v7 = v3;
  uint64_t v4 = setLink__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&setLink__onceToken, block);
  }
}

void __30__OSABridgeLinkProxy_setLink___block_invoke(uint64_t a1)
{
}

- (void)transferInternal:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[OSABridgeLinkProxy transferInternal:key:]", "OSABridgeLinkProxy.m", 31, "0");
}

+ (void)transfer:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((OSAIsRSDDevice() & 1) != 0)
  {
    if (_sharedProxyInstance)
    {
      [(id)_sharedProxyInstance transferInternal:v5 key:v6];
    }

    else
    {
      if (transfer_key__tok != -1) {
        dispatch_once(&transfer_key__tok, &__block_literal_global_13);
      }
      if (transfer_key__connection)
      {
        xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_uint64(v7, "operation", 5uLL);
        xpc_dictionary_set_string( v7, "log_filepath", (const char *)[v5 UTF8String]);
        xpc_dictionary_set_string( v7, "log_countkey", (const char *)[v6 UTF8String]);
        xpc_connection_send_message((xpc_connection_t)transfer_key__connection, v7);
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Skipping transfer from unsupported device",  v8,  2u);
  }
}

void __35__OSABridgeLinkProxy_transfer_key___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0LL, 2uLL);
  v1 = (void *)transfer_key__connection;
  transfer_key__connection = (uint64_t)mach_service;

  if (transfer_key__connection)
  {
    xpc_connection_set_event_handler((xpc_connection_t)transfer_key__connection, &__block_literal_global_6);
    xpc_connection_resume((xpc_connection_t)transfer_key__connection);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.osanalytics.osanalyticshelper";
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "No XPC connection to %s",  (uint8_t *)&v2,  0xCu);
  }

void __35__OSABridgeLinkProxy_transfer_key___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  id v3 = v2;
  if (v2 != (id)MEMORY[0x1895F9198]
    && MEMORY[0x186E34734](v2) == MEMORY[0x1895F9268]
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    int v5 = 136315394;
    id v6 = "com.apple.osanalytics.osanalyticshelper";
    __int16 v7 = 2080;
    v8 = string;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "xpc error message from %s: %s\n",  (uint8_t *)&v5,  0x16u);
  }
}

+ (void)setLink:.cold.1()
{
  __assert_rtn("+[OSABridgeLinkProxy setLink:]", "OSABridgeLinkProxy.m", 22, "_sharedProxyInstance == nil");
}

@end