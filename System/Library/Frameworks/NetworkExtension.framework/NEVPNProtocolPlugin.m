@interface NEVPNProtocolPlugin
- (NSString)pluginType;
@end

@implementation NEVPNProtocolPlugin

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void).cxx_destruct
{
}

@end