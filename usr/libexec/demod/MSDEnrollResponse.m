@interface MSDEnrollResponse
- (NSDictionary)settingsDict;
- (NSString)credential;
- (NSString)hubProtocolVersion;
- (void)setCredential:(id)a3;
- (void)setHubProtocolVersion:(id)a3;
- (void)setSettingsDict:(id)a3;
@end

@implementation MSDEnrollResponse

- (NSString)credential
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCredential:(id)a3
{
}

- (NSDictionary)settingsDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSettingsDict:(id)a3
{
}

- (NSString)hubProtocolVersion
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHubProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end