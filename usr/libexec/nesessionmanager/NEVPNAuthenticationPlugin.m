@interface NEVPNAuthenticationPlugin
- (id)remotePluginInterface;
@end

@implementation NEVPNAuthenticationPlugin

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEVPNAuthenticationPluginDriver);
}

@end