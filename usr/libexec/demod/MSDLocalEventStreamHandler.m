@interface MSDLocalEventStreamHandler
+ (id)sharedInstance;
- (void)handleEvent:(id)a3 fromStream:(const char *)a4;
- (void)start;
@end

@implementation MSDLocalEventStreamHandler

+ (id)sharedInstance
{
  if (qword_100125348 != -1) {
    dispatch_once(&qword_100125348, &stru_1000F9C40);
  }
  return (id)qword_100125340;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 messageQueue]);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100032FD4;
  handler[3] = &unk_1000F9C68;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.fsevents.matching", v4, handler);
}

- (void)handleEvent:(id)a3 fromStream:(const char *)a4
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v7 = (uint64_t)type;
    id v8 = sub_10003AA3C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000966BC(v7, v9);
    }
    goto LABEL_4;
  }

  string = xpc_dictionary_get_string(v5, _xpc_event_key_name);
  id v11 = sub_10003AA3C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = string;
    __int16 v15 = 2080;
    v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received XPC event of name: %s from stream: %s",  (uint8_t *)&v13,  0x16u);
  }

  if (!strncmp(a4, "com.apple.fsevents.matching", 0x1CuLL)
    && !strncmp(string, "DemoSettingsManagedPreferencesChanged", 0x26uLL))
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[os_log_s toggleSEPDemoModeOnManagedPreferencesChange](v9, "toggleSEPDemoModeOnManagedPreferencesChange");
LABEL_4:
  }
}

@end