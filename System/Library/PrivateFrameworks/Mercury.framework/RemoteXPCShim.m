@interface RemoteXPCShim
+ (id)anonymousConnectedPairWithTargetQueue:(id)a3;
@end

@implementation RemoteXPCShim

+ (id)anonymousConnectedPairWithTargetQueue:(id)a3
{
  id v3 = a3;
  xpc_remote_connection_get_version_flags();
  xpc_remote_connection_create_connected_pair();

  id v4 = 0LL;
  id v5 = 0LL;
  v6 = -[RemoteXPCPair initWithClient:server:]( objc_alloc(&OBJC_CLASS___RemoteXPCPair),  "initWithClient:server:",  v4,  v5);

  return v6;
}

@end