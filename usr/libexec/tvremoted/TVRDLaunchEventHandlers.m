@interface TVRDLaunchEventHandlers
@end

@implementation TVRDLaunchEventHandlers

void __46__TVRDLaunchEventHandlers_tvOS_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___TVRDLaunchEventHandlers_tvOS);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

void __45__TVRDLaunchEventHandlers_tvOS_setupHandlers__block_invoke(id a1, OS_xpc_object *a2)
{
  original = a2;
  BOOL v2 = xpc_dictionary_get_BOOL(original, "replyRequired");
  v3 = original;
  if (v2)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    v5 = reply;
    if (reply) {
      xpc_dictionary_send_reply(reply);
    }

    v3 = original;
  }
}

void __45__TVRDLaunchEventHandlers_tvOS_setupHandlers__block_invoke_6(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string && !strcmp("tvremote.siriRemoteConnected", string))
  {
    id v3 = _TVRDXPCLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "XPC: Recieved tvremote.siriRemoteConnected LaunchEvent",  v5,  2u);
    }
  }

@end