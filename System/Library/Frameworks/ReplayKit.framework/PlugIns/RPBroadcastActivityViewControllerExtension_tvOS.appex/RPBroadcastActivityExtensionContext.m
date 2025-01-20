@interface RPBroadcastActivityExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionObjectProxy;
@end

@implementation RPBroadcastActivityExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPBroadcastActivityCommunicationProtocol);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPBroadcastActivityCommunicationHostProtocol);
}

- (id)extensionObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:&stru_10000C688]);

  return v3;
}

@end