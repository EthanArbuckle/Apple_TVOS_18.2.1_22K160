@interface NWRemoteBrowserWrapper
- (NSUUID)clientID;
- (NWBrowser)browser;
- (void)setBrowser:(id)a3;
- (void)setClientID:(id)a3;
@end

@implementation NWRemoteBrowserWrapper

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setClientID:(id)a3
{
}

- (NWBrowser)browser
{
  return (NWBrowser *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBrowser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end