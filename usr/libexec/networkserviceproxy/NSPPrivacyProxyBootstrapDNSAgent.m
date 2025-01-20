@interface NSPPrivacyProxyBootstrapDNSAgent
+ (id)dnsAgentUUID;
@end

@implementation NSPPrivacyProxyBootstrapDNSAgent

+ (id)dnsAgentUUID
{
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_100116D38);
}

@end