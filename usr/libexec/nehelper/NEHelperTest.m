@interface NEHelperTest
- (NEHelperTest)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperTest

- (NEHelperTest)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  BOOL v6 = sub_100010A1C( (uint64_t)&OBJC_CLASS___NEHelperServer,  v5,  (uint64_t)"com.apple.private.networkextension.test-control");
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NEHelperTest;
    self = -[NEHelperTest init](&v13, "init");
    v8 = self;
  }

  else
  {
    uint64_t v9 = ne_log_obj(v6, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_100010A78((uint64_t)&OBJC_CLASS___NEHelperServer, v5);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      __int16 v16 = 2080;
      v17 = "com.apple.private.networkextension.test-control";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Denying test connection because %@ does not have the %s entitlement",  buf,  0x16u);
    }

    v8 = 0LL;
  }

  return v8;
}

- (void)handleMessage:(id)a3
{
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "operation");
  if (uint64 == 3)
  {
    string = xpc_dictionary_get_string(xdict, "app-bundle-id");
    if (string)
    {
      xpc_object_t v5 = xpc_string_create(string);
      xpc_object_t v6 = xpc_array_create(0LL, 0LL);
      xpc_array_append_value(v6, v5);
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_value(v7, (const char *)[@"bundleIDs" UTF8String], v6);
      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
      uint64_t v9 = v8;
      v10 = _xpc_event_key_name;
      v11 = "ApplicationInstalled";
      goto LABEL_8;
    }

@end