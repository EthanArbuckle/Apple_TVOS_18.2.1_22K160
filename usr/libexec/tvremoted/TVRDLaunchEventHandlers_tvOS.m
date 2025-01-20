@interface TVRDLaunchEventHandlers_tvOS
+ (id)sharedInstance;
- (void)setupHandlers;
@end

@implementation TVRDLaunchEventHandlers_tvOS

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  return (id)sharedInstance_sharedInstance;
}

- (void)setupHandlers
{
  id v2 = _TVRDXPCLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "com.apple.rapport.matching";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Setting up %s handler for tvremoted.",  (uint8_t *)&v6,  0xCu);
  }

  xpc_set_event_stream_handler("com.apple.rapport.matching", &_dispatch_main_q, &__block_literal_global_3_0);
  id v4 = _TVRDXPCLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "XPC: Setting up com.apple.notifyd.matching handlers for tvremoted.",  (uint8_t *)&v6,  2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &__block_literal_global_7);
}

@end