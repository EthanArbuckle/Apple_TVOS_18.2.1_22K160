@interface NEHelperRelayManager
- (NEHelperRelayManager)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperRelayManager

- (NEHelperRelayManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  objc_opt_self(&OBJC_CLASS___NEHelperRelayManager);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEHelperRelayManager;
  v6 = -[NEHelperRelayManager init](&v8, "init");

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ processing Relay Manager message", buf, 0xCu);
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "relay-command");
  if (uint64 - 1 <= 1)
  {
    uint64_t v9 = uint64;
    size_t length = 0LL;
    data = xpc_dictionary_get_data(v4, "relay-persistent-reference", &length);
    if (data && length)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data));
      xpc_object_t value = xpc_dictionary_get_value(v4, "relay-identity-domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue(value);
      v14 = v13;
      if (!v13)
      {
        uuid = xpc_dictionary_get_uuid(v4, "relay-config-id");
        if (!uuid)
        {
LABEL_16:
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
LABEL_42:

          goto LABEL_43;
        }

        v21 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uuid);
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472LL;
        v54[2] = sub_1000053A4;
        v54[3] = &unk_100034B98;
        v54[4] = self;
        id v55 = v4;
        uint64_t v57 = v9;
        id v56 = v11;
        [v22 loadConfigurationWithID:v21 withCompletionQueue:&_dispatch_main_q handler:v54];

LABEL_41:
        goto LABEL_42;
      }

      xpc_type_t type = xpc_get_type(v13);
      if (type != (xpc_type_t)&_xpc_type_string)
      {
        uint64_t v17 = ne_log_obj(type, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = self;
          v19 = "%@ invalid domain";
LABEL_45:
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
          goto LABEL_15;
        }

        goto LABEL_15;
      }

      string_ptr = xpc_string_get_string_ptr(v14);
      uint64_t v24 = strcmp(string_ptr, "com.apple.networkrelay");
      if ((_DWORD)v24)
      {
        uint64_t v26 = ne_log_obj(v24, v25);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = self;
          v19 = "%@ unsupported domain";
          goto LABEL_45;
        }

@end