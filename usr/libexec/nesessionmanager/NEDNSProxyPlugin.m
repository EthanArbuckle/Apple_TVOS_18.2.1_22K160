@interface NEDNSProxyPlugin
- (id)remotePluginInterface;
@end

@implementation NEDNSProxyPlugin

- (id)remotePluginInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEDNSProxyPluginDriver));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  v4 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  objc_opt_class(&OBJC_CLASS___NEDNSSettings),  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v2 setClasses:v5 forSelector:"setSystemDNSSettings:" argumentIndex:0 ofReply:0];

  return v2;
}

@end